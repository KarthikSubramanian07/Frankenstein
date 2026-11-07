# Murmur coordination

Enzo requested repo-wide Murmur setup and use. Root `AGENTS.md` and `CLAUDE.md` contain the official discovery section. Each teammate joins their own clone; nobody is enrolled on another person's behalf. Messages/statuses go through public git refs, so never include keys or private data.

Official setup: https://murmur.afig.dev/setup. Join and use instructions are linked in the root files. After joining, set a concrete lane/task status, check `who` and `inbox` at task boundaries, and send specific dependency requests. Keep commits and lane handoffs as the durable record.

## Lane D host checkpoint, 2026-11-07

- Official Windows amd64 `mur 0.2.3` downloaded and checked against the release's `SHA256SUMS`: `455608ce5a4fc0eaf39366372c9c65517c7a3f60652203465546cc23a1f4bd0d`.
- `mur init` generated the official discovery section. Its shell push failed in the sandbox's Git credential-manager. The same section was committed through the authenticated GitHub connector, preserving concurrent commits.
- `mur join` installed the clone-local hook, recorded consent and started the daemon. It could not write user-global Claude/Codex/Grok settings (access denied). No broad approval/settings changes were made.
- The official MCP interface initialized and listed `who`, `status`, `inbox`, `lookup`, `send`. `who`, `status`, `inbox` were actually called. Only the local Lane D session appeared, with its remote name pending. Cross-device publication/delivery is not verified.

To finish the normal integration on this machine, run `mur join` from the repo in the user's normal terminal with normal Git push access. The downloaded binary can be run by its full path if it is not on PATH. A newly started Codex session then loads its registered tools. `mur ui` opens the session/message view; keep its keyed local URL private. `mur join --leave` undoes the clone's join.

Until a real remote peer/message is observed, continue GitHub handoffs. Do not call Murmur fully connected because a local daemon or MCP tool list exists.
