-- mGBA 0.10+; Tools > Scripting > Load script, after the bridge is listening.
-- APIs checked against https://mgba.io/docs/scripting.html on 2026-11-07.
-- Set FRANK_TAP before loading to override defaults. Reload to reconnect.
local cfg = FRANK_TAP or {}
local every = math.max(1, tonumber(cfg.every) or 2)
local shots = cfg.screenshot_dir -- existing absolute directory, optional
local shotEvery = math.max(every, tonumber(cfg.screenshot_every) or 180)
local client = nil
local pending = ""
local failed = false
local function quote(s)
    return '"' .. tostring(s):gsub('\\', '\\\\'):gsub('"', '\\"'):gsub('[%z\1-\31]', function(c)
        return string.format('\\u%04x', string.byte(c))
    end) .. '"'
end
local function field(v, lo, bits) return math.floor(v / 2^lo) % 2^bits end
local sizes = {
    {{8,8},{16,16},{32,32},{64,64}},
    {{16,8},{32,8},{32,16},{64,32}},
    {{8,16},{8,32},{16,32},{32,64}}
}
local function stop(reason)
    failed = true
    console:warn("FRANK tap stopped: " .. tostring(reason) .. "; reload script to reconnect")
end
if not emu then error("Load a GBA ROM before loading this script") end
if not socket then error("This mGBA build has no scripting socket API") end
-- connect is blocking: call once at script load, never in the frame callback.
local ok, s, err = pcall(socket.connect, "127.0.0.1", 7300)
if ok and s then client = s else stop(err or s) end

local function send(line)
    if failed then return end
    pending = pending .. line .. "\n"
    if #pending > 131072 then stop("bridge backpressure") return end
    local success, last, why = pcall(function() return client:send(pending) end)
    if not success then stop(last) return end
    if last then
        pending = pending:sub(last + 1)
    elseif why ~= socket.ERRORS.AGAIN then
        stop(why)
    end
end

local id = callbacks:add("frame", function()
    if failed then return end
    local frame = emu:currentFrame()
    if frame % every ~= 0 then return end
    local sprites = {}
    for i = 0, 127 do
        local addr = 0x07000000 + i * 8
        local a = emu:read16(addr)
        local b = emu:read16(addr + 2)
        local c = emu:read16(addr + 4)
        local affine = field(a,8,1) == 1
        local hidden = not affine and field(a,9,1) == 1
        local shape = field(a,14,2)
        if not hidden and shape < 3 then
            local size = sizes[shape + 1][field(b,14,2) + 1]
            local w, h = size[1], size[2]
            if affine and field(a,9,1) == 1 then w, h = w*2, h*2 end
            local x, y = field(b,0,9), field(a,0,8)
            if x >= 256 then x = x - 512 end
            if y >= 160 then y = y - 256 end
            if x < 240 and y < 160 and x + w > 0 and y + h > 0 then
                sprites[#sprites+1] = string.format('{"i":%d,"x":%d,"y":%d,"w":%d,"h":%d,"tile":%d,"pal":%d}', i,x,y,w,h,field(c,0,10),field(c,12,4))
            end
        end
    end
    local pcOk, pc = pcall(function() return emu:readRegister("pc") end)
    pc = pcOk and tonumber(pc) or nil
    local keysOk, keys = pcall(function() return emu:getKeys() end)
    keys = keysOk and tonumber(keys) or nil
    local extra = ""
    if shots and frame % shotEvery == 0 then
        local path = shots .. "/" .. tostring(frame) .. ".png"
        local shotOk = pcall(function() emu:screenshot(path) end)
        -- screenshot() has no documented success return; bridge must check file exists.
        if shotOk then extra = ',"screenshot_path":' .. quote(path) end
    end
    send(string.format('{"v":1,"frame":%d,"sprites":[%s],"pc":%s,"keys":%s%s}', frame,table.concat(sprites,","),pc and tostring(pc) or "null",keys and tostring(keys) or "null",extra))
end)
console:log("FRANK tap callback " .. tostring(id) .. "; PC is one sparse sample per emitted frame, not an execution trace")
