# Fetch.ai submission: what to paste, and what only a human can do

Track: Best Use of Fetch.ai (1st $2,500, 2nd $2,500). The fields below go to the AIE Summit ASI:One Submission Agent and to the Fetch.ai part of the Cerebral Valley form. Numbers come from `crew/exports/union` and `DECISIONS.md`. Refresh them right before you submit.

## Paste-ready fields

**Project name:** Frankenstein

**One line:** AI agents bring back lost games' source code from the cartridge, and an ASI:One agent proves every piece byte for byte. First patient: Doom.

**Agents (Agent Chat Protocol, Agentverse mailbox, discoverable in ASI:One):**

| Agent | Address | Agentverse profile |
|---|---|---|
| frankenstein-referee | `agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0` | https://agentverse.ai/agents/details/agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0/profile |
| frankenstein-excavator | `agent1qf4w7kmtsgv4fdyuj72nwethhjwhmdh7m3u7kqe5tgz4wyq8nmmmq5gjacp` | https://agentverse.ai/agents/details/agent1qf4w7kmtsgv4fdyuj72nwethhjwhmdh7m3u7kqe5tgz4wyq8nmmmq5gjacp/profile |

Open both profile links once before you paste them. If the URL format is different, copy each profile link from Agentverse instead.

**Repo:** https://github.com/KarthikSubramanian07/Frankenstein (the "Talk to our agents in ASI:One" section in the README has the instructions)

**How it works (multi-agent):** You ask the Excavator in plain words or by function id. It starts a recovery job with our crew (Muse writes the C, SubQ Snap decides), then sends the crew's C to the Referee agent as an agent-to-agent chat message over Agentverse mailboxes. It answers you only with the Referee's verdict. The Referee compiles the C in a sealed container with no network and compares it with Doom's original machine code, instruction by instruction.

**How it proves its work:** Nothing counts unless the compiler turns the agent's C into the original's exact bytes. Every reply splits Observed (proved by the compiler: verdict, first differing instruction, SHA-1 checksums) from Inferred (our guesses, such as function names). "Prove the rebuild is exact" rebuilds the ROM from every recovered function on the spot and returns both SHA-1s: 235 agent-written functions spliced in, identical checksum `d936259b…` (15:22; refreshed at the 16:00 freeze). Built for any compiled game with a matching compiler and a reproducible build: proven on Doom, and tried on a second game, Attack on Voxelburg (4 of 20 functions on a first run; DECISIONS 13:43).

**The workflow happens in ASI:One chat:** ask for progress, check your own C, recover a function, and prove the rebuild, all without leaving the chat. There is no custom front end in the loop.

**How to test it in ASI:One (2 minutes):**
1. "@frankenstein-referee How much of DOOM is back?"
2. "@frankenstein-referee Does this C match fn_0801C130?" plus a wrong ```c block. You get REJECTED and the first instruction that differs.
3. The same message with the correct C. You get MATCH.
4. "@frankenstein-referee Prove the rebuild is exact." You get two identical SHA-1 checksums.
5. "@frankenstein-excavator Recover fn_08004DA8." The Excavator runs the crew and gets the Referee agent's verdict back.

The agents run on Eddy's laptop and answer while it's on, with the referee and crew API up.

## Only a human can do these (Eddy), in order

1. **Fresh-chat test on a phone.** Open asi1.ai in a new chat and send prompts 1 to 4 above. Make sure every reply arrives. Prompt 5 starts a paid crew job, and Meta was returning HTTP 402 (spend cap) from 14:20, so send it only after the cap is raised. Otherwise expect the reply "The crew turned that request down: … 402".
2. **Share the chat.** Use ASI:One's share button and copy the public chat URL. Fetch.ai's other hackathons ask for one, so have it ready.
3. **Record 40 seconds of screen.** Phone or laptop: prompt 2 (REJECTED with the differing instruction), prompt 3 (MATCH), then prompt 4 (IDENTICAL). It's for the submission and the video.
4. **Submission Agent chat.** Find the AIE Summit ASI:One Submission Agent named in the Fetch.ai guide linked from the event page, and paste the fields above. I couldn't find a public page for it (the innovationlab.fetch.ai hackpack URL for this event returns "Event not found"), so follow its prompts. Add the shared chat URL and the 40-second clip if it asks for them.
5. **Cerebral Valley form.** In the Fetch.ai section, paste the same one line, both addresses, the repo link and the shared chat URL.
6. **Record the confirmation** in `DECISIONS.md` as one line with the time and what the Submission Agent replied.
