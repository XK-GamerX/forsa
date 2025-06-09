-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local u2 = game:GetService("VRService")
UserSettings():GetService("UserGameSettings")
require(script.Parent:WaitForChild("CameraInput"))
require(script.Parent:WaitForChild("CameraUtils"))
local u3 = require(script.Parent:WaitForChild("VRBaseCamera"))
local u4 = setmetatable({}, u3)
u4.__index = u4
function u4.new() --[[Anonymous function at line 25]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v5 = u3.new()
    local v6 = u4
    local v7 = setmetatable(v5, v6)
    v7.lastUpdate = tick()
    v7.focusOffset = CFrame.new()
    v7:Reset()
    return v7
end
function u4.Reset(p8) --[[Anonymous function at line 35]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    p8.needsReset = true
    p8.needsBlackout = true
    p8.motionDetTime = 0
    p8.blackOutTimer = 0
    p8.lastCameraResetPosition = nil
    u3.Reset(p8)
end
function u4.Update(p9, p10) --[[Anonymous function at line 44]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v11 = workspace.CurrentCamera
    local v12 = v11.CFrame
    local v13 = v11.Focus
    local v14 = u1.LocalPlayer
    p9:GetHumanoid()
    local _ = v11.CameraSubject
    if p9.lastUpdate == nil or p10 > 1 then
        p9.lastCameraTransform = nil
    end
    p9:UpdateFadeFromBlack(p10)
    p9:UpdateEdgeBlur(v14, p10)
    local v15 = p9.lastSubjectPosition
    local v16 = p9:GetSubjectPosition()
    if p9.needsBlackout then
        p9:StartFadeFromBlack()
        local v17 = math.clamp(p10, 0.0001, 0.1)
        p9.blackOutTimer = p9.blackOutTimer + v17
        if p9.blackOutTimer > 0.1 and game:IsLoaded() then
            p9.needsBlackout = false
            p9.needsReset = true
        end
    end
    if v16 and (v14 and v11) then
        local v18 = p9:GetVRFocus(v16, p10)
        if p9:IsInFirstPerson() then
            v12, v13 = p9:UpdateFirstPersonTransform(p10, v12, v18, v15, v16)
        elseif u2.ThirdPersonFollowCamEnabled then
            v12, v13 = p9:UpdateThirdPersonFollowTransform(p10, v12, v18, v15, v16)
        else
            v12, v13 = p9:UpdateThirdPersonComfortTransform(p10, v12, v18, v15, v16)
        end
        p9.lastCameraTransform = v12
        p9.lastCameraFocus = v13
    end
    p9.lastUpdate = tick()
    return v12, v13
end
function u4.GetAvatarFeetWorldYValue(_) --[[Anonymous function at line 101]]
    local v19 = workspace.CurrentCamera.CameraSubject
    if not v19 then
        return nil
    end
    if not (v19:IsA("Humanoid") and v19.RootPart) then
        return nil
    end
    local v20 = v19.RootPart
    return v20.Position.Y - v20.Size.Y / 2 - v19.HipHeight
end
function u4.UpdateFirstPersonTransform(p21, p22, _, p23, p24, p25) --[[Anonymous function at line 116]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p21.needsReset then
        p21:StartFadeFromBlack()
        p21.needsReset = false
    end
    local v26 = u1.LocalPlayer
    if (p24 - p25).magnitude > 0.01 then
        p21:StartVREdgeBlur(v26)
    end
    local v27 = p23.p
    local v28 = p21:GetCameraLookVector()
    local v29 = v28.X
    local v30 = v28.Z
    local v31 = Vector3.new(v29, 0, v30).Unit
    local v32 = p21:getRotation(p22)
    local v33 = p21:CalculateNewLookVectorFromArg(v31, Vector2.new(v32, 0))
    return CFrame.new(v27 - 0.5 * v33, v27), p23
end
function u4.UpdateThirdPersonComfortTransform(p34, p35, p36, p37, p38, p39) --[[Anonymous function at line 143]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v40 = p34:GetCameraToSubjectDistance()
    local v41 = v40 < 0.5 and 0.5 or v40
    if p38 ~= nil and p34.lastCameraFocus ~= nil then
        local v42 = u1.LocalPlayer
        local v43 = p38 - p39
        local v44 = require(v42:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule")):GetMoveVector()
        local v45 = v43.magnitude > 0.01 and true or v44.magnitude > 0.01
        if v45 then
            p34.motionDetTime = 0.1
        end
        p34.motionDetTime = p34.motionDetTime - p35
        if (p34.motionDetTime > 0 and true or v45) and not p34.needsReset then
            local v46 = p34.lastCameraFocus
            p34.VRCameraFocusFrozen = true
            return p36, v46
        end
        local v47 = p34.lastCameraResetPosition == nil and true or (p39 - p34.lastCameraResetPosition).Magnitude > 1
        local v48 = p34:getRotation(p35)
        if math.abs(v48) > 0 then
            local v49 = p37:ToObjectSpace(p36)
            p36 = p37 * CFrame.Angles(0, -v48, 0) * v49
        end
        if p34.VRCameraFocusFrozen and v47 or p34.needsReset then
            u2:RecenterUserHeadCFrame()
            p34.VRCameraFocusFrozen = false
            p34.needsReset = false
            p34.lastCameraResetPosition = p39
            p34:ResetZoom()
            p34:StartFadeFromBlack()
            local v50 = p34:GetHumanoid()
            local v51 = v50.Torso and v50.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
            local v52 = v51.X
            local v53 = v51.Z
            local v54 = Vector3.new(v52, 0, v53)
            local v55 = p37.Position - v54 * v41
            local v56 = p37.Position.X
            local v57 = v55.Y
            local v58 = p37.Position.Z
            local v59 = Vector3.new(v56, v57, v58)
            p36 = CFrame.new(v55, v59)
        end
    end
    return p36, p37
end
function u4.UpdateThirdPersonFollowTransform(p60, p61, _, _, p62, p63) --[[Anonymous function at line 210]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    local v64 = workspace.CurrentCamera
    local v65 = p60:GetCameraToSubjectDistance()
    local v66 = p60:GetVRFocus(p63, p61)
    if p60.needsReset then
        p60.needsReset = false
        u2:RecenterUserHeadCFrame()
        p60:ResetZoom()
        p60:StartFadeFromBlack()
    end
    if p60.recentered then
        local v67 = p60:GetSubjectCFrame()
        if not v67 then
            return v64.CFrame, v64.Focus
        end
        local v68 = v66 * v67.Rotation * CFrame.new(0, 0, v65)
        p60.focusOffset = v66:ToObjectSpace(v68)
        p60.recentered = false
        return v68, v66
    end
    local v69 = v66:ToWorldSpace(p60.focusOffset)
    local v70 = u1.LocalPlayer
    local v71 = p62 - p63
    local v72 = require(v70:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"))
    local v73 = v72:GetMoveVector()
    if v71.magnitude > 0.01 or v73.magnitude > 0 then
        local v74 = v72:GetEstimatedVRTorsoFrame()
        local v75 = v74.Rotation + v74.Position * v64.HeadScale
        local v76 = v64.CFrame * v75
        local v77 = v76.LookVector
        local v78 = v77.X
        local v79 = v77.Z
        local v80 = Vector3.new(v78, 0, v79).Unit * v65
        local v81 = v66.Position - v80
        v69 = v69:Lerp(CFrame.new(v64.CFrame.Position + v81 - v76.Position) * v69.Rotation, 0.01)
    end
    local v82 = p60:getRotation(p61)
    if math.abs(v82) > 0 then
        local v83 = v66:ToObjectSpace(v69)
        v69 = v66 * CFrame.Angles(0, -v82, 0) * v83
    end
    p60.focusOffset = v66:ToObjectSpace(v69)
    local v84 = v69 * CFrame.new(0, 0, -v65)
    if (v84.Position - v64.Focus.Position).Magnitude > 0.01 then
        p60:StartVREdgeBlur(u1.LocalPlayer)
    end
    return v69, v84
end
function u4.LeaveFirstPerson(p85) --[[Anonymous function at line 288]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.LeaveFirstPerson(p85)
    p85.needsReset = true
    if p85.VRBlur then
        p85.VRBlur.Visible = false
    end
end
return u4