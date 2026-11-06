"""Run: python3 -m unittest discover -s .agents/skills/planka -p 'test_*.py'"""
import importlib.util
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location("planka", Path(__file__).with_name("planka.py"))
planka = importlib.util.module_from_spec(spec)
spec.loader.exec_module(planka)


class PlankaTests(unittest.TestCase):
    def test_default_cache_path(self):
        self.assertEqual(planka.CACHE, Path('.agents/cache/planka-swagger.json'))

    def test_config_precedence_and_trailing_slash(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / ".env").write_text('PLANKA_URL="https://project.example/"\nPLANKA_API_KEY=project-key\n')
            home = root / "home"
            home.mkdir()
            (home / ".env").write_text('PLANKA_URL=https://global.example/\nPLANKA_API_KEY=global-key\n')
            with patch.object(Path, "home", return_value=home), patch.object(Path, "cwd", return_value=root), patch.dict(os.environ, {"PLANKA_URL": "https://shell.example", "PLANKA_API_KEY": "shell-key"}):
                self.assertEqual(planka.load_config(), ("https://project.example", "project-key"))

    def test_cache_fetch_once_and_refresh(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "spec.json"
            with patch.object(planka, "CACHE", path), patch.object(planka, "fetch_json", return_value={"paths": {"/projects": {"get": {}}}}) as fetch:
                self.assertEqual(planka.spec()["paths"], {"/projects": {"get": {}}})
                planka.spec()
                self.assertEqual(fetch.call_count, 1)
                planka.spec(refresh=True)
                self.assertEqual(fetch.call_count, 2)
                self.assertEqual(json.loads(path.read_text())["paths"], {"/projects": {"get": {}}})

    def test_default_board_skips_project_lookup(self):
        client = planka.Client.__new__(planka.Client)
        client.config = {"PLANKA_BOARD_ID": "board1"}
        with patch.object(client, "request", return_value={}) as request, patch.object(client, "projects") as projects:
            client.board("@default")
            projects.assert_not_called()
            request.assert_called_once_with("GET", "/boards/{id}", "/boards/board1")
        client.config["PLANKA_BOARD_ID"] = ""
        with self.assertRaisesRegex(planka.PlankaError, "PLANKA_BOARD_ID"):
            client.board("@default")

    def test_card_id_and_assignment(self):
        data = {"included": {"cards": [{"id": "c1", "name": "Task"}], "cardMemberships": []}}
        client = planka.Client.__new__(planka.Client)
        client.config = {"PLANKA_USER_ID": "u1"}
        args = planka.parser().parse_args(["assign-card", "@default", "id:c1", "--confirm"])
        with patch.object(planka, "Client", return_value=client), patch.object(client, "board", return_value=data), patch.object(client, "request") as request:
            planka.command(args)
            request.assert_called_once_with("POST", "/cards/{cardId}/card-memberships", "/cards/c1/card-memberships", {"userId": "u1"})
            request.reset_mock()
            data["included"]["cardMemberships"].append({"cardId": "c1", "userId": "u1"})
            planka.command(args)
            request.assert_not_called()
        with self.assertRaises(planka.PlankaError):
            planka.unique_card(data["included"]["cards"], "id:other")

    def test_non_json_html_200_is_rejected(self):
        class Response:
            headers = {"Content-Type": "text/html"}
            def __enter__(self): return self
            def __exit__(self, *args): pass
            def read(self): return b"<html>app</html>"
        with patch.object(planka, "urlopen", return_value=Response()):
            with self.assertRaisesRegex(planka.PlankaError, "expected JSON"):
                planka.fetch_json("https://example.test/api/projects", "secret")

    def test_positions_and_duplicate_selection(self):
        cards = [{"name": "Same", "listId": "a", "position": 65536}, {"name": "Same", "listId": "b", "position": 131072}]
        self.assertEqual(planka.next_position(cards, "a"), 131072)
        with self.assertRaisesRegex(planka.PlankaError, "2 matches"):
            planka.unique_card(cards, "Same")

    def test_write_requires_confirm(self):
        for argv in (["planka.py", "move-card", "Board", "Card", "List"], ["planka.py", "assign-card", "Board", "Card"]):
            with patch.object(planka, "Client") as client, patch.object(planka.sys, "argv", argv):
                self.assertEqual(planka.main(), 2)
                client.assert_not_called()


if __name__ == "__main__":
    unittest.main()
