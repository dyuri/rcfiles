# Planka Skill for AI agents

An AI agent skill for managing [Planka](https://github.com/plankanban/planka) kanban boards through natural language. No rigid CLI syntax — just describe what you want.

## Setup

1. Install the skill in your agent's skills directory, for example by copying the folder to `~/.agents/skills/planka` or the project's `.agents/skills/planka`.

2. Generate an API key in Planka: User Settings → API Key

3. Set environment variables (in project `.env`, `~/.env`, or shell):
   ```bash
   PLANKA_URL=https://planka.example.com
   PLANKA_API_KEY=your-api-key
   ```
   A trailing slash in `PLANKA_URL` is fine. The skill strips it before adding `/api`.
   When both env files exist, the project's `.env` overrides `~/.env`;
   values in either file override existing shell values. Optional `PLANKA_BOARD_ID`
   and `PLANKA_USER_ID` follow the same precedence. Set them to the default board
   ID and the agent's Planka user ID, respectively.

## Helper CLI

Run from the target project's root. If the skill lives elsewhere, replace the script path with its installed location. The CLI needs only Python 3's standard library.

```bash
python3 .agents/skills/planka/planka.py                         # projects, boards, card counts
python3 .agents/skills/planka/planka.py board TodoApp             # lists and cards
python3 .agents/skills/planka/planka.py card TodoApp "Login Bug"   # card details
python3 .agents/skills/planka/planka.py card TodoApp "Login Bug" --full
python3 .agents/skills/planka/planka.py spec endpoints card-labels
python3 .agents/skills/planka/planka.py spec refresh
```

After the user approves a board write:

```bash
python3 .agents/skills/planka/planka.py create-card TodoApp TODO "Fix login" --description "Steps to reproduce..." --confirm
python3 .agents/skills/planka/planka.py move-card TodoApp "Fix login" "IN PROGRESS" --confirm
python3 .agents/skills/planka/planka.py assign-card @default "Fix login" --confirm
```

Use `@default` in place of a board name to use `PLANKA_BOARD_ID` and skip the project lookup. Explicit board names are resolved normally. Card arguments also accept `id:<card-id>`; keep a working card's ID in session context rather than a shared persistent cache. The helper checks it against the current board. Assign cards to the agent when picking up work, after approval. Define project-specific column names and the basic workflow for moving cards between them in the project's `AGENTS.md`; follow those instructions rather than assuming a common column setup.

The script resolves board, list, and card names to current IDs. Ambiguous names fail instead of picking one. Writes require `--confirm` **and** prior user approval in conversation. It refuses unknown flags. Run each subcommand with `--help` for arguments.

The first API call downloads the published OpenAPI spec to `.agents/cache/planka-swagger.json` in the current project; later calls use the cache. Run `spec refresh` to fetch a new copy. The cache is public schema data, not credentials. If the server's API differs from the published spec, refresh and inspect its version rather than guessing paths. A first-time run needs network access to both the spec and Planka; subsequent endpoint checks work offline, but board operations still need Planka.

For unsupported operations, inspect the cached spec first (`spec endpoints <term>` and the request schema in the JSON file). Use the API base `${PLANKA_URL%/}/api`, `X-Api-Key` authentication, encoded JSON bodies, and validate the response content type and JSON. Never print the key. The helper reads simple `KEY=value` / quoted values for `PLANKA_URL` and `PLANKA_API_KEY` and optional `PLANKA_BOARD_ID` / `PLANKA_USER_ID` from `~/.env` then `.env`; it does not execute shell expressions in those files.

## Quick Commands

```
/planka overview              # all projects and boards at a glance
/planka board "My Project"    # detailed board view with cards and progress
```

## What You Can Do

Talk naturally — the skill understands intent and figures out the API calls.

### Browse & Inspect
```
/planka show me all my boards
/planka what's in the ToDo list?
/planka show me card "Login Bug" with all its tasks
```

### Create & Organize
```
/planka create a card "Dark Mode" in Backlog with fitting labels
/planka set up a new board "Backend" with lists ToDo, In Progress, Done, Blocked
/planka add labels Bug (red), Feature (blue), Urgent (red) to the "My Project" board
/planka add tasks to "Dark Mode": update theme provider, test contrast, update docs
```

### Move & Update
```
/planka move "Dark Mode" to In Progress
/planka mark "Dark Mode" as done
/planka rename "Dark Mode" to "Dark Mode v2"
/planka add a comment to "Dark Mode": waiting for design review
```

### Bulk Operations
```
/planka move everything from In Progress to Done
/planka read the git log and create cards for all completed features
/planka look at board X and create the same structure for a new board
/planka check all cards for typos and fix them
```

### Project Sync
```
/planka sync the board with our recent git commits
/planka create cards for all open issues
/planka what changed on the board since last week?
```

The helper caches the [Planka OpenAPI spec](https://plankanban.github.io/planka/swagger-ui/swagger.json). Refresh it explicitly when the API changes.

## Requirements

- Planka instance with API key support
- Python 3
