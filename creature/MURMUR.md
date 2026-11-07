# Murmur coordination

Enzo requested repo-wide Murmur setup and use. Root `AGENTS.md` and `CLAUDE.md` contain the official discovery section. Each teammate joins their own clone; nobody is enrolled on another person's behalf. Messages/statuses go through public git refs, so never include keys or private data.

Use the team-pinned docs/murmur/setup.md, docs/murmur/join.md and docs/murmur/use.md. Lane A pinned/audited v0.2.3 in 10db35a; preserve those links and do not rerun init against live upstream docs. After joining, set a concrete lane/task status, check `who` and `inbox` at task boundaries, and send specific dependency requests. Keep commits and lane handoffs as the durable record.

## Lane D host checkpoint, 2026-11-07

- Official Windows amd64 `mur 0.2.3` downloaded and checked against the release's `SHA256SUMS`: `455608ce5a4fc0eaf39366372c9c65517c7a3f60652203465546cc23a1f4bd0d`.
- `mur init` generated the official discovery section. Its shell push failed in the sandbox's Git credential-manager. The same section was committed through the authenticated GitHub connector, preserving concurrent commits.
- `mur join` installed the clone-local hook, recorded consent and started the daemon. It could not write user-global Claude/Codex/Grok settings (access denied). No broad approval/settings changes were made.
- The official MCP interface initialized and listed who/status/inbox/lookup/send. All were actually called. A real inbound message from Eddy's machine was received; who/lookup showed active Lane A agents. Cross-device receive is verified. A send to the active Lane A agent failed explicitly in Git credential-manager, so outbound delivery is NOT verified; the request is preserved in issue #2. Our remote name remains pending.

To finish the normal integration on this machine, close this temporary MCP client, then run `mur stop` followed by `mur join` from the repo in the user's normal terminal with normal Git push access. This replaces the sandbox-started daemon as well as finishing registration. The downloaded binary can be run by its full path if it is not on PATH. A newly started Codex session then loads its registered tools. `mur ui` opens the session/message view; keep its keyed local URL private. `mur join --leave` undoes the clone's join.

Continue GitHub handoffs for outgoing requests until a real sent message is acknowledged. Receiving a remote message does not prove our sandbox can publish a reply.
