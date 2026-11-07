-- Loads Lane D's real tap (creature/tap/oam_tap.lua) and then drives scripted input so Doom reaches E1M1 and plays.
-- Start = menu, A = enter/use, B = fire (GBADoom source/g_game.c).
local REPO = os.getenv("FRANK_REPO") or "."
local SHOTS = os.getenv("FRANK_SHOTS") or (REPO .. "/runs/_shots")
FRANK_TAP = {every = 2, screenshot_dir = SHOTS, screenshot_every = 60}
if os.getenv("FRANK_NO_TAP") then
    local every = tonumber(os.getenv("FRANK_SHOT_EVERY") or "60")
    callbacks:add("frame", function()
        local f = emu:currentFrame()
        if f % every == 0 then emu:screenshot(SHOTS .. "/" .. tostring(f) .. ".png") end
    end)
    console:log("FRANK drive: capture only, no tap, screenshot every " .. every .. " frames to " .. SHOTS)
else
    dofile(REPO .. "/creature/tap/oam_tap.lua")
end

local K = C.GBA_KEY
local function bit(k) return 1 << k end
-- {start_frame, end_frame, mask}
local plan = {}
local function press(at, key, len) plan[#plan + 1] = {at, at + (len or 8), bit(key)} end
press(240, K.START); press(300, K.A); press(360, K.A); press(420, K.A)  -- menu, New Game, episode, skill
local t = 600
for loop = 1, 400 do  -- about 50 minutes of patrol: forward, turn, fire, use
    plan[#plan + 1] = {t, t + 90, bit(K.UP)}
    plan[#plan + 1] = {t + 90, t + 120, bit(K.LEFT)}
    plan[#plan + 1] = {t + 120, t + 128, bit(K.B)}
    plan[#plan + 1] = {t + 130, t + 200, bit(K.UP) | bit(K.RIGHT)}
    plan[#plan + 1] = {t + 200, t + 206, bit(K.A)}
    plan[#plan + 1] = {t + 210, t + 260, bit(K.DOWN)}
    t = t + 270
end
FRANK_DRIVE = {paused = false}
callbacks:add("frame", function()
    if FRANK_DRIVE.paused then return end
    local f = emu:currentFrame()
    local mask = 0
    for _, p in ipairs(plan) do
        if f >= p[1] and f < p[2] then mask = mask | p[3] end
    end
    emu:setKeys(mask)
end)
console:log("FRANK drive: scripted input loaded (" .. #plan .. " steps)")
