-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1, v2 = pcall(function() --[[Anonymous function at line 17]]
    return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera2")
end)
local u3 = v1 and v2
local u4 = game:GetService("VRService")
local u5 = require(script.Parent:WaitForChild("CameraInput"))
local u6 = require(script.Parent:WaitForChild("ZoomController"))
local u7 = game:GetService("Players").LocalPlayer
local u8 = game:GetService("Lighting")
local u9 = game:GetService("RunService")
local u10 = UserSettings():GetService("UserGameSettings")
local u11 = require(script.Parent:WaitForChild("BaseCamera"))
local u12 = setmetatable({}, u11)
u12.__index = u12
function u12.new() --[[Anonymous function at line 41]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    local v13 = u11.new()
    local v14 = u12
    local v15 = setmetatable(v13, v14)
    v15.gamepadZoomLevels = { 0, 7 }
    v15.headScale = 1
    v15:SetCameraToSubjectDistance(7)
    v15.VRFadeResetTimer = 0
    v15.VREdgeBlurTimer = 0
    v15.gamepadResetConnection = nil
    v15.needsReset = true
    v15.recentered = false
    v15:Reset()
    return v15
end
function u12.Reset(p16) --[[Anonymous function at line 67]]
    p16.stepRotateTimeout = 0
end
function u12.GetModuleName(_) --[[Anonymous function at line 71]]
    return "VRBaseCamera"
end
function u12.GamepadZoomPress(p17) --[[Anonymous function at line 75]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.GamepadZoomPress(p17)
    p17:GamepadReset()
    p17:ResetZoom()
end
function u12.GamepadReset(p18) --[[Anonymous function at line 83]]
    p18.stepRotateTimeout = 0
    p18.needsReset = true
end
function u12.ResetZoom(p19) --[[Anonymous function at line 88]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.SetZoomParameters(p19.currentSubjectDistance, 0)
    u6.ReleaseSpring()
end
function u12.OnEnabledChanged(u20) --[[Anonymous function at line 93]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u4
        [4] = u3
        [5] = u7
        [6] = u8
    --]]
    u11.OnEnabledChanged(u20)
    if u20.enabled then
        u20.gamepadResetConnection = u5.gamepadReset:Connect(function() --[[Anonymous function at line 97]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:GamepadReset()
        end)
        u20.thirdPersonOptionChanged = u4:GetPropertyChangedSignal("ThirdPersonFollowCamEnabled"):Connect(function() --[[Anonymous function at line 102]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u20
            --]]
            if u3 then
                u20:Reset()
            elseif not u20:IsInFirstPerson() then
                u20:Reset()
            end
        end)
        u20.vrRecentered = u4.UserCFrameChanged:Connect(function(p21, _) --[[Anonymous function at line 113]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            if p21 == Enum.UserCFrame.Floor then
                u20.recentered = true
            end
        end)
    else
        if u20.inFirstPerson then
            u20:GamepadZoomPress()
        end
        if u20.thirdPersonOptionChanged then
            u20.thirdPersonOptionChanged:Disconnect()
            u20.thirdPersonOptionChanged = nil
        end
        if u20.vrRecentered then
            u20.vrRecentered:Disconnect()
            u20.vrRecentered = nil
        end
        if u20.cameraHeadScaleChangedConn then
            u20.cameraHeadScaleChangedConn:Disconnect()
            u20.cameraHeadScaleChangedConn = nil
        end
        if u20.gamepadResetConnection then
            u20.gamepadResetConnection:Disconnect()
            u20.gamepadResetConnection = nil
        end
        u20.VREdgeBlurTimer = 0
        u20:UpdateEdgeBlur(u7, 1)
        local v22 = u8:FindFirstChild("VRFade")
        if v22 then
            v22.Brightness = 0
        end
    end
end
function u12.OnCurrentCameraChanged(u23) --[[Anonymous function at line 155]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.OnCurrentCameraChanged(u23)
    if u23.cameraHeadScaleChangedConn then
        u23.cameraHeadScaleChangedConn:Disconnect()
        u23.cameraHeadScaleChangedConn = nil
    end
    local v24 = workspace.CurrentCamera
    if v24 then
        u23.cameraHeadScaleChangedConn = v24:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[Anonymous function at line 167]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23:OnHeadScaleChanged()
        end)
        u23:OnHeadScaleChanged()
    end
end
function u12.OnHeadScaleChanged(p25) --[[Anonymous function at line 172]]
    local v26 = workspace.CurrentCamera.HeadScale
    for v27, v28 in p25.gamepadZoomLevels do
        p25.gamepadZoomLevels[v27] = v28 * v26 / p25.headScale
    end
    p25:SetCameraToSubjectDistance(p25:GetCameraToSubjectDistance() * v26 / p25.headScale)
    p25.headScale = v26
end
function u12.GetVRFocus(p29, p30, p31) --[[Anonymous function at line 188]]
    local v32 = p29.lastCameraFocus or p30
    local v33 = p29.cameraTranslationConstraints.x
    local v34 = p29.cameraTranslationConstraints.y + p31
    local v35 = math.min(1, v34)
    local v36 = p29.cameraTranslationConstraints.z
    p29.cameraTranslationConstraints = Vector3.new(v33, v35, v36)
    local v37 = p29:GetCameraHeight()
    local v38 = Vector3.new(0, v37, 0)
    local v39 = CFrame.new
    local v40 = p30.x
    local v41 = v32.y
    local v42 = p30.z
    return v39(Vector3.new(v40, v41, v42):Lerp(p30 + v38, p29.cameraTranslationConstraints.y))
end
function u12.StartFadeFromBlack(p43) --[[Anonymous function at line 204]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
    --]]
    if u10.VignetteEnabled ~= false then
        local v44 = u8:FindFirstChild("VRFade")
        if not v44 then
            v44 = Instance.new("ColorCorrectionEffect")
            v44.Name = "VRFade"
            v44.Parent = u8
        end
        v44.Brightness = -1
        p43.VRFadeResetTimer = 0.1
    end
end
function u12.UpdateFadeFromBlack(p45, p46) --[[Anonymous function at line 219]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v47 = u8:FindFirstChild("VRFade")
    if p45.VRFadeResetTimer > 0 then
        local v48 = p45.VRFadeResetTimer - p46
        p45.VRFadeResetTimer = math.max(v48, 0)
        local v49 = u8:FindFirstChild("VRFade")
        if v49 and v49.Brightness < 0 then
            local v50 = v49.Brightness + p46 * 10
            v49.Brightness = math.min(v50, 0)
            return
        end
    elseif v47 then
        v47.Brightness = 0
    end
end
function u12.StartVREdgeBlur(p51, p52) --[[Anonymous function at line 235]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u4
    --]]
    if u10.VignetteEnabled ~= false then
        local v53 = workspace.CurrentCamera:FindFirstChild("VRBlurPart")
        if not v53 then
            local u54 = Instance.new("Part")
            u54.Name = "VRBlurPart"
            u54.Parent = workspace.CurrentCamera
            u54.CanTouch = false
            u54.CanCollide = false
            u54.CanQuery = false
            u54.Anchored = true
            u54.Size = Vector3.new(0.44, 0.47, 1)
            u54.Transparency = 1
            u54.CastShadow = false
            u9.RenderStepped:Connect(function(_) --[[Anonymous function at line 255]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u54
                --]]
                local v55 = u4:GetUserCFrame(Enum.UserCFrame.Head)
                local v56 = workspace.CurrentCamera.CFrame * (CFrame.new(v55.p * workspace.CurrentCamera.HeadScale) * (v55 - v55.p))
                u54.CFrame = v56 * CFrame.Angles(0, 3.141592653589793, 0) + v56.LookVector * (1.05 * workspace.CurrentCamera.HeadScale)
                u54.Size = Vector3.new(0.44, 0.47, 1) * workspace.CurrentCamera.HeadScale
            end)
            v53 = u54
        end
        local v57 = p52.PlayerGui:FindFirstChild("VRBlurScreen")
        local v58
        if v57 then
            v58 = v57:FindFirstChild("VRBlur")
        else
            v58 = nil
        end
        if not v58 then
            local v59 = v57 or (Instance.new("SurfaceGui") or Instance.new("ScreenGui"))
            v59.Name = "VRBlurScreen"
            v59.Parent = p52.PlayerGui
            v59.Adornee = v53
            v58 = Instance.new("ImageLabel")
            v58.Name = "VRBlur"
            v58.Parent = v59
            v58.Image = "rbxasset://textures/ui/VR/edgeBlur.png"
            v58.AnchorPoint = Vector2.new(0.5, 0.5)
            v58.Position = UDim2.new(0.5, 0, 0.5, 0)
            local v60 = workspace.CurrentCamera.ViewportSize.X * 2.3 / 512
            local v61 = workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512
            v58.Size = UDim2.fromScale(v60, v61)
            v58.BackgroundTransparency = 1
            v58.Active = true
            v58.ScaleType = Enum.ScaleType.Stretch
        end
        v58.Visible = true
        v58.ImageTransparency = 0
        p51.VREdgeBlurTimer = 0.14
    end
end
function u12.UpdateEdgeBlur(p62, p63, p64) --[[Anonymous function at line 304]]
    local v65 = p63.PlayerGui:FindFirstChild("VRBlurScreen")
    local v66
    if v65 then
        v66 = v65:FindFirstChild("VRBlur")
    else
        v66 = nil
    end
    if v66 then
        if p62.VREdgeBlurTimer > 0 then
            p62.VREdgeBlurTimer = p62.VREdgeBlurTimer - p64
            local v67 = p63.PlayerGui:FindFirstChild("VRBlurScreen")
            local v68 = v67 and v67:FindFirstChild("VRBlur")
            if v68 then
                local v69 = p62.VREdgeBlurTimer
                v68.ImageTransparency = 1 - math.clamp(v69, 0.01, 0.14) * 7.142857142857142
                return
            end
        else
            v66.Visible = false
        end
    end
end
function u12.GetCameraHeight(p70) --[[Anonymous function at line 329]]
    return p70.inFirstPerson and 0 or 0.25881904510252074 * p70.currentSubjectDistance
end
function u12.GetSubjectCFrame(p71) --[[Anonymous function at line 336]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v72 = u11.GetSubjectCFrame(p71)
    local v73 = workspace.CurrentCamera
    if v73 then
        v73 = v73.CameraSubject
    end
    if not v73 then
        return v72
    end
    if v73:IsA("Humanoid") and (v73:GetState() == Enum.HumanoidStateType.Dead and v73 == p71.lastSubject) then
        v72 = p71.lastSubjectCFrame
    end
    if v72 then
        p71.lastSubjectCFrame = v72
    end
    return v72
end
function u12.GetSubjectPosition(p74) --[[Anonymous function at line 362]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v75 = u11.GetSubjectPosition(p74)
    local v76 = game.Workspace.CurrentCamera
    if v76 then
        v76 = v76.CameraSubject
    end
    if not v76 then
        return nil
    end
    if v76:IsA("Humanoid") then
        if v76:GetState() == Enum.HumanoidStateType.Dead and v76 == p74.lastSubject then
            v75 = p74.lastSubjectPosition
        end
    elseif v76:IsA("VehicleSeat") then
        v75 = v76.CFrame.p + v76.CFrame:vectorToWorldSpace(Vector3.new(0, 4, 0))
    end
    p74.lastSubjectPosition = v75
    return v75
end
function u12.getRotation(p77, p78) --[[Anonymous function at line 391]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
    --]]
    local v79 = u5.getRotation()
    local v80 = 0
    if u10.VRSmoothRotationEnabled then
        return v79.X * 40 * p78
    end
    local v81 = v79.X
    if math.abs(v81) > 0.03 then
        if p77.stepRotateTimeout > 0 then
            p77.stepRotateTimeout = p77.stepRotateTimeout - p78
        end
        if p77.stepRotateTimeout <= 0 then
            local v82 = (v79.X < 0 and -1 or 1) * 0.5235987755982988
            p77:StartFadeFromBlack()
            p77.stepRotateTimeout = 0.25
            return v82
        end
    else
        local v83 = v79.X
        if math.abs(v83) < 0.02 then
            p77.stepRotateTimeout = 0
        end
    end
    return v80
end
return u12