-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

Vector2.new()
require(script.Parent:WaitForChild("CameraUtils"))
local u1 = require(script.Parent:WaitForChild("CameraInput"))
local u2 = game:GetService("Players")
local u3 = require(script.Parent:WaitForChild("BaseCamera"))
local u4 = setmetatable({}, u3)
u4.__index = u4
function u4.new() --[[Anonymous function at line 21]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v5 = u3.new()
    local v6 = u4
    local v7 = setmetatable(v5, v6)
    v7.cameraType = Enum.CameraType.Fixed
    v7.lastUpdate = tick()
    v7.lastDistanceToSubject = nil
    return v7
end
function u4.GetModuleName(_) --[[Anonymous function at line 31]]
    return "LegacyCamera"
end
function u4.SetCameraToSubjectDistance(p8, p9) --[[Anonymous function at line 36]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.SetCameraToSubjectDistance(p8, p9)
end
function u4.Update(p10, _) --[[Anonymous function at line 40]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    if not p10.cameraType then
        return nil, nil
    end
    local v11 = tick()
    local v12 = v11 - p10.lastUpdate
    local v13 = workspace.CurrentCamera
    local v14 = v13.CFrame
    local v15 = v13.Focus
    local v16 = u2.LocalPlayer
    if p10.lastUpdate == nil or v12 > 1 then
        p10.lastDistanceToSubject = nil
    end
    local v17 = p10:GetSubjectPosition()
    if p10.cameraType == Enum.CameraType.Fixed then
        if v17 and (v16 and v13) then
            local v18 = p10:GetCameraToSubjectDistance()
            local v19 = p10:CalculateNewLookVectorFromArg(nil, u1.getRotation())
            v15 = v13.Focus
            v14 = CFrame.new(v13.CFrame.p, v13.CFrame.p + v18 * v19)
        end
    elseif p10.cameraType == Enum.CameraType.Attach then
        local v20 = p10:GetSubjectCFrame()
        local v21 = v13.CFrame:ToEulerAnglesYXZ()
        local _, v22 = v20:ToEulerAnglesYXZ()
        local v23 = v21 - u1.getRotation().Y
        local v24 = math.clamp(v23, -1.3962634015954636, 1.3962634015954636)
        v15 = CFrame.new(v20.p) * CFrame.fromEulerAnglesYXZ(v24, v22, 0)
        v14 = v15 * CFrame.new(0, 0, p10:StepZoom())
    else
        if p10.cameraType ~= Enum.CameraType.Watch then
            return v13.CFrame, v13.Focus
        end
        if v17 and (v16 and v13) then
            local v25 = nil
            if v17 == v13.CFrame.p then
                warn("Camera cannot watch subject in same position as itself")
                return v13.CFrame, v13.Focus
            end
            local v26 = p10:GetHumanoid()
            if v26 and v26.RootPart then
                local v27 = v17 - v13.CFrame.p
                v25 = v27.unit
                if p10.lastDistanceToSubject and p10.lastDistanceToSubject == p10:GetCameraToSubjectDistance() then
                    p10:SetCameraToSubjectDistance(v27.magnitude)
                end
            end
            local v28 = p10:GetCameraToSubjectDistance()
            local v29 = p10:CalculateNewLookVectorFromArg(v25, u1.getRotation())
            v15 = CFrame.new(v17)
            v14 = CFrame.new(v17 - v28 * v29, v17)
            p10.lastDistanceToSubject = v28
        end
    end
    p10.lastUpdate = v11
    return v14, v15
end
return u4