---
name: planka
description: Manage Planka kanban boards — create, organize, and track project tasks
argument-hint: overview | board <name>
---

Interact with a self-hosted Planka instance. Planka is a Trello-like kanban board.

> See [README.md](README.md) for setup instructions, usage examples, and advanced use cases.

## Setup

Required environment variables:

- `PLANKA_URL` — Base URL (e.g. `https://planka.example.com`)
- `PLANKA_API_KEY` — API key (generated in Planka UI → User Settings)

Optional: `PLANKA_BOARD_ID` selects a default board via `@default`; `PLANKA_USER_ID` identifies the agent for self-assignment. They use the same env precedence as the required settings.

These can be set in:
1. The current project's `.env` file (most common)
2. `~/.env` (global, for cross-project use)
3. Shell environment (e.g. `~/.bashrc` or `~/.zshrc`)

Use the bundled helper from the **project root** (replace the path if the skill was installed elsewhere):

```bash
python3 .agents/skills/planka/planka.py                 # projects and boards
python3 .agents/skills/planka/planka.py board TodoApp
python3 .agents/skills/planka/planka.py card TodoApp "Card title" --full
python3 .agents/skills/planka/planka.py spec endpoints card-labels
python3 .agents/skills/planka/planka.py spec refresh
```

The helper loads `~/.env`, then the project's `.env` (project values win), then normalizes `PLANKA_URL` before appending `/api`. It validates JSON and does not print the key. It stores the published OpenAPI spec in `.agents/cache/planka-swagger.json` in the current project on first use, reuses it offline, and refreshes it only on `spec refresh`. The cache contains public API documentation, never credentials. Run from the project root so the right env and cache are used.

**Full OpenAPI spec**: https://plankanban.github.io/planka/swagger-ui/swagger.json

### Finding endpoints

**Never guess endpoints.** Use `spec endpoints <search-term>` to inspect the cached raw spec. Do not rely on summaries of the spec. For operations beyond the helper's commands, inspect the relevant request schema in `.agents/cache/planka-swagger.json` before calling the API. On 404, do not repeat the same request; refresh the spec and check the installed server's version. The helper refuses endpoints absent from its cached spec, so refresh if it is stale.

## Key Concepts

- **Hierarchy**: Project → Board → List → Card → Task List → Task
- **Responses**: `{"item": {...}}` for single, `{"items": [...]}` for collections, related data in `"included"`
- **Positioning**: Numeric, multiples of 65536. Lower = higher on the board.
- **Colors** (for lists/labels): e.g. `dark-granite`, `lagoon-blue`, `orange-peel`, `bright-moss`, `berry-red`, `light-mud`, `midnight-blue`, `light-cocoa`, `summer-sky`, `pumpkin-orange`

## How to Use

The user can talk naturally or use optional shorthand commands:

| Command | Description |
|---------|-------------|
| `/planka overview` | Show all projects and boards |
| `/planka board <name>` | Show a specific board with lists and cards |

These are shortcuts — the user can also just describe what they want freely: "create a card for Feature X", "move Bug Y to Done", "set up a new board with labels", etc.

Understand the intent, look up the right endpoints from the OpenAPI spec if needed, and execute.

**Finding boards**: Use `@default` with `PLANKA_BOARD_ID` to skip the project lookup. Otherwise list projects and match boards by name; never hardcode IDs. An explicitly supplied board name is always resolved by name.

**Picking up work**: After user approval, assign the card to the agent using `assign-card <board> <card> --confirm` and `PLANKA_USER_ID`. Follow project instructions in AGENTS.md or the README for any column changes; do not assume column names. Keep the current card ID in session context when useful and pass it as `id:<card-id>` instead of the card name. IDs are checked against the current board on each operation; do not persist a shared current-card file that could conflict across sessions.

**Null safety**: Many Planka fields can be `None`/`null` — name, description, color, position, etc. Always use `or ""`, `or 0`, `(x or "").strip()` patterns in Python code. Never call methods on potentially null values without guarding.

**Display formatting**:
- `overview`: Show projects as headers with boards as bullet points. Include board card count.
- `board <name>`: Show each list as a section with its cards listed below. For each card show: name, labels (as colored badges), task progress (e.g. 3/5), and description preview if available. Use markdown formatting — headers for lists, bullet points for cards. Skip empty/unnamed system lists (archive, trash).

Always:

- Prefer the helper for supported operations. Use `create-card <board> <list> <title> [--description TEXT] --confirm`, `move-card <board> <card> <list> --confirm`, and `assign-card <board> <card> --confirm` only after user approval. Names must be unambiguous; the helper resolves current IDs each time. `--confirm` is a safety gate, **not** a substitute for conversational approval.
- For unsupported operations, inspect the cached spec first and use `${PLANKA_URL%/}/api` (never `//api`), JSON encoding, response validation, and the same env precedence as the helper. See [README.md](README.md).
- Ask the user when something is ambiguous (e.g. multiple boards/projects).
- **Always confirm before executing a board write**: describe what you're about to do (e.g. "I'll create a card 'Dark Mode' in Backlog") and wait for approval. This applies to create, update, move, and delete.
