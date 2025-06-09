-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = require(script:WaitForChild("Popper"))
local u2 = math.clamp
local u3 = math.exp
local u4 = math.min
local u5 = math.max
local u6 = nil
local u7 = nil
local u8 = game:GetService("Players").LocalPlayer
assert(u8)
local function v9() --[[Anonymous function at line 23]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u7
    --]]
    u6 = u8.CameraMinZoomDistance
    u7 = u8.CameraMaxZoomDistance
end
u6 = u8.CameraMinZoomDistance
u7 = u8.CameraMaxZoomDistance
u8:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(v9)
u8:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(v9)
local u10 = {}
u10.__index = u10
function u10.new(p11, p12, p13, p14) --[[Anonymous function at line 37]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
    --]]
    local v15 = u2(p12, p13, p14)
    local v16 = u10
    return setmetatable({
        ["freq"] = p11,
        ["x"] = v15,
        ["v"] = 0,
        ["minValue"] = p13,
        ["maxValue"] = p14,
        ["goal"] = v15
    }, v16)
end
function u10.Step(p17, p18) --[[Anonymous function at line 49]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v19 = p17.freq * 2 * 3.141592653589793
    local v20 = p17.x
    local v21 = p17.v
    local v22 = p17.minValue
    local v23 = p17.maxValue
    local v24 = p17.goal
    local v25 = v24 - v20
    local v26 = v19 * p18
    local v27 = u3(-v26)
    local v28 = v24 + (v21 * p18 - v25 * (v26 + 1)) * v27
    local v29 = ((v25 * v19 - v21) * v26 + v21) * v27
    if v28 < v22 then
        v23 = v22
        v29 = 0
    elseif v23 < v28 then
        v29 = 0
    else
        v23 = v28
    end
    p17.x = v23
    p17.v = v29
    return v23
end
local u30 = u10.new(4.5, 12.5, 0.5, u7)
local u31 = 0
return {
    ["Update"] = function(p32, p33, p34) --[[Function name: Update, line 98]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
            [3] = u6
            [4] = u7
            [5] = u2
            [6] = u5
            [7] = u1
            [8] = u4
        --]]
        local v35
        if u30.goal > 1 then
            local v36 = u30.x
            local v37 = u30.goal
            local v38 = u31
            local v39 = u6
            local v40 = u7
            local v41 = u2(v37 + v38 * (v37 * 0.0375 + 1), v39, v40)
            local v42 = u5(v36, v41 < 1 and (v38 <= 0 and v39 and v39 or 1) or v41)
            v35 = u1(p33 * CFrame.new(0, 0, 0.5), v42 - 0.5, p34) + 0.5
        else
            v35 = (1 / 0)
        end
        u30.minValue = 0.5
        u30.maxValue = u4(u7, v35)
        return u30:Step(p32)
    end,
    ["GetZoomRadius"] = function() --[[Function name: GetZoomRadius, line 122]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        return u30.x
    end,
    ["SetZoomParameters"] = function(p43, p44) --[[Function name: SetZoomParameters, line 126]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
        --]]
        u30.goal = p43
        u31 = p44
    end,
    ["ReleaseSpring"] = function() --[[Function name: ReleaseSpring, line 131]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30.x = u30.goal
        u30.v = 0
    end
}