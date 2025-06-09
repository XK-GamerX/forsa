-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {}
u1.__index = u1
function u1.new() --[[Anonymous function at line 12]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    v3.cameras = require(script:WaitForChild("CameraModule"))
    v3.controls = require(script:WaitForChild("ControlModule"))
    return v3
end
function u1.GetCameras(p4) --[[Anonymous function at line 19]]
    return p4.cameras
end
function u1.GetControls(p5) --[[Anonymous function at line 23]]
    return p5.controls
end
function u1.GetClickToMoveController(p6) --[[Anonymous function at line 27]]
    return p6.controls:GetClickToMoveController()
end
return u1.new()