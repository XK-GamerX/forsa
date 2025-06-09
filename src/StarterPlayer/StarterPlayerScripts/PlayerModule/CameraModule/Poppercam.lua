-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = require(script.Parent:WaitForChild("ZoomController"))
local u2 = {}
u2.__index = u2
local u3 = CFrame.new()
function u2.new() --[[Anonymous function at line 31]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v4 = u2
    return setmetatable({
        ["lastCFrame"] = nil
    }, v4)
end
function u2.Step(p5, p6, p7) --[[Anonymous function at line 37]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v8 = p5.lastCFrame or p7
    p5.lastCFrame = p7
    local u9 = p7.Position
    local _, _, _, v10, v11, v12, v13, v14, v15, v16, v17, v18 = p7:GetComponents()
    local u19 = CFrame.new(0, 0, 0, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    local v20 = v8.p
    local _, _, _, v21, v22, v23, v24, v25, v26, v27, v28, v29 = v8:GetComponents()
    local v30 = CFrame.new(0, 0, 0, v21, v22, v23, v24, v25, v26, v27, v28, v29)
    local u31 = (u9 - v20) / p6
    local v32, v33 = (u19 * v30:inverse()):ToAxisAngle()
    local u34 = v32 * v33 / p6
    return {
        ["extrapolate"] = function(p35) --[[Function name: extrapolate, line 52]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u9
                [3] = u34
                [4] = u3
                [5] = u19
            --]]
            local v36 = u31 * p35 + u9
            local v37 = u34 * p35
            local v38 = v37.Magnitude
            local v39
            if v38 > 0.00001 then
                v39 = CFrame.fromAxisAngle(v37, v38)
            else
                v39 = u3
            end
            return v39 * u19 + v36
        end,
        ["posVelocity"] = u31,
        ["rotVelocity"] = u34
    }
end
function u2.Reset(p40) --[[Anonymous function at line 65]]
    p40.lastCFrame = nil
end
local u41 = require(script.Parent:WaitForChild("BaseOcclusion"))
local u42 = setmetatable({}, u41)
u42.__index = u42
function u42.new() --[[Anonymous function at line 75]]
    --[[
    Upvalues:
        [1] = u41
        [2] = u42
        [3] = u2
    --]]
    local v43 = u41.new()
    local v44 = u42
    local v45 = setmetatable(v43, v44)
    v45.focusExtrapolator = u2.new()
    return v45
end
function u42.GetOcclusionMode(_) --[[Anonymous function at line 81]]
    return Enum.DevCameraOcclusionMode.Zoom
end
function u42.Enable(p46, _) --[[Anonymous function at line 85]]
    p46.focusExtrapolator:Reset()
end
function u42.Update(p47, p48, p49, p50, _) --[[Anonymous function at line 89]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v51 = CFrame.new(p50.p, p49.p) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    local v52 = p47.focusExtrapolator:Step(p48, v51)
    local v53 = u1.Update(p48, v51, v52)
    return v51 * CFrame.new(0, 0, v53), p50
end
function u42.CharacterAdded(_, _, _) --[[Anonymous function at line 102]] end
function u42.CharacterRemoving(_, _, _) --[[Anonymous function at line 106]] end
function u42.OnCameraSubjectChanged(_, _) --[[Anonymous function at line 109]] end
return u42