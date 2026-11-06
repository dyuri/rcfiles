#!/usr/bin/env python3
"""Small, dependency-free Planka CLI for agents. Run from the target project directory."""

import argparse
import json
import os
from pathlib import Path
import re
import shlex
import sys
import tempfile
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen
from urllib.parse import quote

SPEC_URL = "https://plankanban.github.io/planka/swagger-ui/swagger.json"
CACHE = Path(".agents/cache/planka-swagger.json")
VERSION = "0.1.0"


class PlankaError(Exception):
    pass


def emit(key, value):
    print(f"{key}: {json.dumps(value, ensure_ascii=False)}")


def table(name, fields, rows):
    print(f"{name}[{len(rows)}]{{{','.join(fields)}}}:")
    for row in rows:
        print("  " + ",".join(json.dumps(value, ensure_ascii=False) for value in row))
    if not rows:
        emit("state", f"0 {name} found")


def load_settings():
    keys = ("PLANKA_URL", "PLANKA_API_KEY", "PLANKA_BOARD_ID", "PLANKA_USER_ID")
    config = {k: os.environ.get(k, "") for k in keys}
    for file in (Path.home() / ".env", Path.cwd() / ".env"):
        if not file.is_file():
            continue
        for line in file.read_text(encoding="utf-8").splitlines():
            match = re.match(r"^\s*(?:export\s+)?(PLANKA_URL|PLANKA_API_KEY|PLANKA_BOARD_ID|PLANKA_USER_ID)\s*=\s*(.*)$", line)
            if match:
                try:
                    parts = shlex.split(match[2], comments=True)
                except ValueError:
                    raise PlankaError(f"Invalid {match[1]} in {file}") from None
                config[match[1]] = " ".join(parts) if parts else ""
    missing = [key for key in ("PLANKA_URL", "PLANKA_API_KEY") if not config[key]]
    if missing:
        raise PlankaError(f"Set {', '.join(missing)} in .env, ~/.env, or the shell")
    url = config["PLANKA_URL"].rstrip("/")
    if not url.startswith(("https://", "http://")):
        raise PlankaError("PLANKA_URL must start with https:// or http://")
    config["PLANKA_URL"] = url
    return config


def load_config():
    config = load_settings()
    return config["PLANKA_URL"], config["PLANKA_API_KEY"]


def fetch_json(url, key=None, method="GET", payload=None):
    headers = {"Accept": "application/json"}
    if key:
        headers["X-Api-Key"] = key
    if payload is not None:
        headers["Content-Type"] = "application/json"
    request = Request(url, headers=headers, method=method,
                      data=json.dumps(payload).encode() if payload is not None else None)
    try:
        with urlopen(request, timeout=20) as response:
            content_type = response.headers.get("Content-Type", "")
            raw = response.read()
    except HTTPError as exc:
        raise PlankaError(f"{method} {url}: HTTP {exc.code}; check the endpoint, permissions, and input") from None
    except URLError as exc:
        raise PlankaError(f"Could not reach {url}: {exc.reason}") from None
    if "json" not in content_type.lower():
        raise PlankaError(f"{method} {url}: expected JSON, got {content_type or 'unknown content type'}; check PLANKA_URL and API path")
    try:
        return json.loads(raw)
    except (ValueError, UnicodeDecodeError):
        raise PlankaError(f"{method} {url}: invalid JSON response") from None


def spec(refresh=False):
    if not refresh and CACHE.is_file():
        try:
            cached = json.loads(CACHE.read_text(encoding="utf-8"))
            if isinstance(cached.get("paths"), dict):
                return cached
        except (ValueError, OSError, AttributeError):
            pass
    data = fetch_json(SPEC_URL)
    if not isinstance(data, dict) or not isinstance(data.get("paths"), dict):
        raise PlankaError("OpenAPI response has no paths; cache was not updated")
    CACHE.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(mode="w", encoding="utf-8", dir=CACHE.parent, delete=False) as temp:
        json.dump(data, temp)
        temp_path = Path(temp.name)
    temp_path.replace(CACHE)
    return data


def check_endpoint(method, template):
    if method.lower() not in spec().get("paths", {}).get(template, {}):
        raise PlankaError(f"{method} {template} is not in the cached spec; run `spec refresh` and inspect `spec endpoints`")


class Client:
    def __init__(self):
        self.config = load_settings()
        self.key = self.config["PLANKA_API_KEY"]
        self.base = self.config["PLANKA_URL"] + "/api"

    def request(self, method, template, path, payload=None):
        check_endpoint(method, template)
        return fetch_json(self.base + path, self.key, method, payload)

    def projects(self):
        return self.request("GET", "/projects", "/projects")

    def board(self, name):
        if name == "@default":
            board_id = self.config["PLANKA_BOARD_ID"]
            if not board_id:
                raise PlankaError("Set PLANKA_BOARD_ID to use @default")
            return self.request("GET", "/boards/{id}", "/boards/" + quote(board_id, safe=""))
        projects = self.projects()
        boards = (projects.get("included") or {}).get("boards") or []
        matches = [b for b in boards if b.get("name") == name]
        if len(matches) != 1:
            raise PlankaError(f"Board {name!r}: found {len(matches)} matches; use `overview` to check names")
        return self.request("GET", "/boards/{id}", "/boards/" + matches[0]["id"])


def board_parts(data):
    inc = data.get("included") or {}
    lists = inc.get("lists") or []
    cards = inc.get("cards") or []
    return lists, cards


def unique_list(lists, name):
    matches = [item for item in lists if item.get("name") == name]
    if len(matches) != 1:
        raise PlankaError(f"List {name!r}: found {len(matches)} matches; use `board` to check names")
    return matches[0]


def unique_card(cards, name):
    if name.startswith("id:"):
        matches = [item for item in cards if item.get("id") == name[3:]]
    else:
        matches = [item for item in cards if item.get("name") == name]
    if len(matches) != 1:
        raise PlankaError(f"Card {name!r}: found {len(matches)} matches; use `board` to check names")
    return matches[0]


def next_position(cards, list_id):
    return max((c.get("position") or 0 for c in cards if c.get("listId") == list_id), default=0) + 65536


def preview(text, full):
    text = text or ""
    if full or len(text) <= 800:
        return text
    return text[:800] + f"... (truncated, {len(text)} chars total; use --full)"


def command(args):
    if args.action == "spec":
        document = spec(refresh=args.spec_action == "refresh")
        if args.spec_action == "refresh":
            emit("spec", str(CACHE))
            emit("endpoints", len(document["paths"]))
        else:
            rows = [(method.upper(), path) for path, methods in document["paths"].items()
                    for method in methods if method in ("get", "post", "patch", "put", "delete")
                    and (not args.search or args.search.lower() in path.lower())]
            table("endpoints", ("method", "path"), rows)
        return

    client = Client()
    if args.action == "overview":
        projects = client.projects()
        boards = (projects.get("included") or {}).get("boards") or []
        rows = []
        for project in projects.get("items") or []:
            for board in boards:
                if board.get("projectId") == project.get("id"):
                    detail = client.request("GET", "/boards/{id}", "/boards/" + board["id"])
                    rows.append((project.get("name") or "", board.get("name") or "",
                                 len((detail.get("included") or {}).get("cards") or [])))
        table("boards", ("project", "board", "cards"), rows)
        return
    data = client.board(args.board)
    lists, cards = board_parts(data)
    if args.action == "board":
        emit("board", args.board)
        rows = [(item.get("name") or "", c.get("name") or "", c.get("id") or "")
                for item in lists if item.get("name")
                for c in cards if c.get("listId") == item.get("id")]
        table("cards", ("list", "title", "id"), rows)
        table("lists", ("name", "cards"), [(item.get("name") or "",
              sum(c.get("listId") == item.get("id") for c in cards))
              for item in lists if item.get("name")])
        return
    card = unique_card(cards, args.card) if args.action != "create-card" else None
    if args.action == "assign-card":
        user_id = client.config["PLANKA_USER_ID"]
        if not user_id:
            raise PlankaError("Set PLANKA_USER_ID to assign a card to the agent")
        memberships = (data.get("included") or {}).get("cardMemberships")
        if memberships is not None and any(m.get("cardId") == card["id"] and m.get("userId") == user_id for m in memberships):
            emit("result", "card already assigned to agent (no-op)")
            return
        client.request("POST", "/cards/{cardId}/card-memberships", "/cards/" + quote(card["id"], safe="") + "/card-memberships", {"userId": user_id})
        emit("assigned", card.get("name") or card["id"])
        return
    if args.action == "card":
        detail = client.request("GET", "/cards/{id}", "/cards/" + card["id"])
        item = detail.get("item") or {}
        emit("title", item.get("name") or "")
        emit("id", item.get("id") or "")
        emit("description", preview(item.get("description"), args.full))
        inc = detail.get("included") or {}
        table("task_lists", ("name", "id"), [(x.get("name") or "", x.get("id") or "") for x in inc.get("taskLists") or []])
        table("tasks", ("name", "completed"), [(x.get("name") or "", bool(x.get("isCompleted"))) for x in inc.get("tasks") or []])
        return
    if args.action == "create-card":
        target = unique_list(lists, args.list)
        if any(c.get("name") == args.title and c.get("listId") == target["id"] for c in cards):
            emit("result", "card already exists in target list (no-op)")
            return
        result = client.request("POST", "/lists/{listId}/cards", "/lists/" + target["id"] + "/cards",
                                {"type": "project", "name": args.title, "description": args.description,
                                 "position": next_position(cards, target["id"])})
        emit("created", (result.get("item") or {}).get("name") or args.title)
        return
    if args.action == "move-card":
        target = unique_list(lists, args.list)
        if card.get("listId") == target["id"]:
            emit("result", "card already in target list (no-op)")
            return
        result = client.request("PATCH", "/cards/{id}", "/cards/" + card["id"],
                                {"listId": target["id"], "position": next_position(cards, target["id"])})
        emit("moved", (result.get("item") or {}).get("name") or args.card)
        emit("list", args.list)


class Parser(argparse.ArgumentParser):
    def error(self, message):
        emit("error", message)
        emit("help", self.format_usage().strip())
        self.exit(2)


def parser():
    p = Parser(description="Inspect and manage Planka boards in the current project")
    p.add_argument("--version", "-v", "-V", action="version", version=VERSION)
    sub = p.add_subparsers(dest="action", parser_class=Parser)
    sub.add_parser("overview", help="List projects and boards")
    board = sub.add_parser("board", help="List cards on a board")
    board.add_argument("board")
    card = sub.add_parser("card", help="Show a card")
    card.add_argument("board")
    card.add_argument("card")
    card.add_argument("--full", action="store_true", help="Do not truncate description")
    create = sub.add_parser("create-card", help="Create a card; requires --confirm")
    create.add_argument("board")
    create.add_argument("list")
    create.add_argument("title")
    create.add_argument("--description", default="")
    create.add_argument("--confirm", action="store_true", help="Confirm the board write")
    assign = sub.add_parser("assign-card", help="Assign a card to PLANKA_USER_ID; requires --confirm")
    assign.add_argument("board", help="Board name or @default")
    assign.add_argument("card", help="Card name or id:<card-id>")
    assign.add_argument("--confirm", action="store_true", help="Confirm the board write")
    move = sub.add_parser("move-card", help="Move a card; requires --confirm")
    move.add_argument("board")
    move.add_argument("card")
    move.add_argument("list")
    move.add_argument("--confirm", action="store_true", help="Confirm the board write")
    spec_cmd = sub.add_parser("spec", help="Inspect cached OpenAPI spec")
    spec_sub = spec_cmd.add_subparsers(dest="spec_action", required=True)
    endpoints = spec_sub.add_parser("endpoints", help="List endpoints, optionally filtered")
    endpoints.add_argument("search", nargs="?")
    spec_sub.add_parser("refresh", help="Refresh the spec cache")
    return p


def main():
    p = parser()
    try:
        args = p.parse_args()
    except SystemExit as exc:
        return exc.code
    if args.action is None:
        args.action = "overview"
    if args.action in ("create-card", "move-card", "assign-card") and not args.confirm:
        emit("error", "Board writes require --confirm after user approval")
        emit("help", f"Run `planka.py {args.action} --help` for usage")
        return 2
    try:
        command(args)
    except (PlankaError, OSError, KeyError, TypeError) as exc:
        emit("error", str(exc))
        emit("help", "Check `planka.py --help` or `planka.py spec endpoints <term>`")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
