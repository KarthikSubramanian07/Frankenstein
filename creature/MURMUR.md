# Murmur coordination

Enzo requested repo-wide Murmur setup and use. Root AGENTS.md and CLAUDE.md use Lane A's pinned v0.2.3 instructions in docs/murmur/. Preserve those links; do not rerun init against live upstream docs. Each teammate joins their own clone. Keep secrets out of public refs and use committed decisions/handoffs as the durable record.

## Current result: connected

- Enzo ran the verified binary's stop/join from normal PowerShell. Claude, Codex and Grok registration completed and the daemon started with normal Git access.
- Lane A's triple-hippo confirmed our device presence reached origin at 14:13. D received that real message and sees the other lanes in who.
- The official MCP send succeeded: message e00492e2 to triple-hippo. Incoming and outgoing transport are now verified. Recipient acknowledgement of that specific message is a separate check.
- Telemetry is disabled by MURMUR_NO_USAGE=1 and clone config murmur.usage=false. The pinned checkin.Off implementation checks both and returns before any check-in HTTP request.
- Existing Codex sessions do not automatically acquire newly registered MCP tools. This Work session uses the official stdio MCP interface directly. Session names can change when that temporary client restarts; use who/lookup to find the current Lane D session.

## Earlier blockers, resolved

The sandbox-started daemon could receive but could not publish refs: Windows blocked Git credential-manager. Global agent settings were also protected. Normal-terminal join resolved those system boundaries. A later automatic approval review blocked one outgoing attempt citing telemetry. The pinned no-usage code was inspected, clone-level telemetry disabling was set and verified, and the same official transport subsequently sent successfully. No telemetry endpoint was called by those tests.

## Routine

Set a concrete lane/task status. Read who/inbox at task boundaries. Use lookup before messaging an unfamiliar peer, and send specific requests without acknowledgement loops. Each lane commits its own work and receives incoming commits frequently.

Run mur ui in the repo to see sessions/messages; keep its keyed local URL private. mur join --leave undoes this clone's join.

## Current Work-session limitation

The normal daemon, published presence and one real outgoing message are verified. Some later sends from this Work session were rejected by automatic approval review, which cited Murmur's telemetry endpoint even after both no-usage controls were verified. Those rejected attempts did not send their messages. D keeps outgoing requests in GitHub issues/handoffs when that review blocks a send; do not wait on an assumed Murmur reply. This is separate from the normal-terminal registration that Enzo successfully completed.
