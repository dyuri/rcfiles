# herdr — agent skill

**Overview**
herdr is a terminal-native agent multiplexer enabling management of workspaces, tabs, and panes through CLI commands. It operates via local unix socket communication when running inside a herdr-managed environment (requires `HERDR_ENV=1`).

**Core Concepts**
- **Workspaces**: Project contexts containing tabs
- **Tabs**: Subcontexts within workspaces holding panes
- **Panes**: Individual terminal splits with their own processes
- **Agent Status**: Automatically detected states (idle, working, blocked, done, unknown)
- **IDs**: Compact session identifiers that change when items close; always re-read from commands

**Essential Commands**

Discover your environment:
```bash
herdr pane list
herdr workspace list
```

Tab operations:
```bash
herdr tab create --workspace 1 --label "logs"
herdr tab focus 1:2
herdr tab close 1:2
```

Pane operations:
```bash
herdr pane split 1-2 --direction right --no-focus
herdr pane read 1-1 --source recent --lines 50
herdr pane run 1-3 "npm run dev"
```

Wait operations:
```bash
herdr wait output 1-3 --match "ready" --timeout 30000
herdr wait agent-status 1-1 --status done --timeout 60000
```

**Key Patterns**
- Split panes to run servers, tests, or spawn agents in parallel
- Use `wait output` for expected future output; use `pane read` for existing content
- Apply `--no-focus` to maintain current context while creating new panes
- Always parse IDs from command responses rather than assuming previous IDs remain valid
