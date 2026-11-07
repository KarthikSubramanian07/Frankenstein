-- Deterministic judge-change playtest: same inputs on every ROM, screenshots every FRANK_SHOT_EVERY frames.
-- FRANK_SCENARIO=god: Up Up Down Down Left Left Right Right at frame 700 (GBADoom source/m_cheat.c, God mode).
-- FRANK_SCENARIO=raise: hold A+R (use + strafe right = weapon cycle up, source/g_game.c) at frame 700 and 900.
local SHOTS = os.getenv("FRANK_SHOTS") or "runs/_shots"
local every = tonumber(os.getenv("FRANK_SHOT_EVERY") or "4")
local first = tonumber(os.getenv("FRANK_SHOT_FROM") or "600")
local scenario = os.getenv("FRANK_SCENARIO") or "god"
local K = C.GBA_KEY
local function bit(k) return 1 << k end
local plan = {}
local function press(at, mask, len) plan[#plan + 1] = {at, at + (len or 8), mask} end
press(240, bit(K.START)); press(300, bit(K.A)); press(360, bit(K.A)); press(420, bit(K.A))
if scenario == "god" then
    local seq = {K.UP, K.UP, K.DOWN, K.DOWN, K.LEFT, K.LEFT, K.RIGHT, K.RIGHT}
    for i, k in ipairs(seq) do press(700 + (i - 1) * 8, bit(k), 4) end
else
    press(700, bit(K.A) | bit(K.R), 6)
    press(900, bit(K.A) | bit(K.R), 6)
end
callbacks:add("frame", function()
    local f = emu:currentFrame()
    local mask = 0
    for _, p in ipairs(plan) do if f >= p[1] and f < p[2] then mask = mask | p[3] end end
    emu:setKeys(mask)
    if f >= first and f % every == 0 then emu:screenshot(SHOTS .. "/" .. tostring(f) .. ".png") end
end)
console:log("FRANK scenario " .. scenario .. ", shots every " .. every .. " from frame " .. first)
