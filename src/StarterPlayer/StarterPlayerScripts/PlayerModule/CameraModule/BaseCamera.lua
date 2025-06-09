-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

Vector2.new(0.2617993877991494, 0)
Vector2.new(0.7853981633974483, 0)
Vector2.new(0, 0)
local u1 = require(script.Parent:WaitForChild("CameraUtils"))
local u2 = require(script.Parent:WaitForChild("ZoomController"))
local u3 = require(script.Parent:WaitForChild("CameraToggleStateController"))
local u4 = require(script.Parent:WaitForChild("CameraInput"))
local u5 = require(script.Parent:WaitForChild("CameraUI"))
local v6 = game:GetService("Players")
local u7 = game:GetService("UserInputService")
game:GetService("StarterGui")
local u8 = game:GetService("VRService")
local u9 = UserSettings():GetService("UserGameSettings")
local u10 = v6.LocalPlayer
local u11 = {}
u11.__index = u11
function u11.new() --[[Anonymous function at line 59]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u9
    --]]
    local v12 = u11
    local u13 = setmetatable({}, v12)
    u13.gamepadZoomLevels = { 0, 10, 20 }
    u13.FIRST_PERSON_DISTANCE_THRESHOLD = 1
    u13.cameraType = nil
    u13.cameraMovementMode = nil
    u13.lastCameraTransform = nil
    u13.lastUserPanCamera = tick()
    u13.humanoidRootPart = nil
    u13.humanoidCache = {}
    u13.lastSubject = nil
    u13.lastSubjectPosition = Vector3.new(0, 5, 0)
    u13.lastSubjectCFrame = CFrame.new(u13.lastSubjectPosition)
    local v14 = u10.CameraMinZoomDistance
    local v15 = u10.CameraMaxZoomDistance
    u13.currentSubjectDistance = math.clamp(12.5, v14, v15)
    u13.inFirstPerson = false
    u13.inMouseLockedMode = false
    u13.portraitMode = false
    u13.isSmallTouchScreen = false
    u13.resetCameraAngle = true
    u13.enabled = false
    u13.PlayerGui = nil
    u13.cameraChangedConn = nil
    u13.viewportSizeChangedConn = nil
    u13.shouldUseVRRotation = false
    u13.VRRotationIntensityAvailable = false
    u13.lastVRRotationIntensityCheckTime = 0
    u13.lastVRRotationTime = 0
    u13.vrRotateKeyCooldown = {}
    u13.cameraTranslationConstraints = Vector3.new(1, 1, 1)
    u13.humanoidJumpOrigin = nil
    u13.trackingHumanoid = nil
    u13.cameraFrozen = false
    u13.subjectStateChangedConn = nil
    u13.gamepadZoomPressConnection = nil
    u13.mouseLockOffset = Vector3.new(0, 0, 0)
    if u10.Character then
        u13:OnCharacterAdded(u10.Character)
    end
    u10.CharacterAdded:Connect(function(p16) --[[Anonymous function at line 124]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:OnCharacterAdded(p16)
    end)
    if u13.playerCameraModeChangeConn then
        u13.playerCameraModeChangeConn:Disconnect()
    end
    u13.playerCameraModeChangeConn = u10:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[Anonymous function at line 129]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:OnPlayerCameraPropertyChange()
    end)
    if u13.minDistanceChangeConn then
        u13.minDistanceChangeConn:Disconnect()
    end
    u13.minDistanceChangeConn = u10:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[Anonymous function at line 134]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:OnPlayerCameraPropertyChange()
    end)
    if u13.maxDistanceChangeConn then
        u13.maxDistanceChangeConn:Disconnect()
    end
    u13.maxDistanceChangeConn = u10:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[Anonymous function at line 139]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:OnPlayerCameraPropertyChange()
    end)
    if u13.playerDevTouchMoveModeChangeConn then
        u13.playerDevTouchMoveModeChangeConn:Disconnect()
    end
    u13.playerDevTouchMoveModeChangeConn = u10:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[Anonymous function at line 144]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:OnDevTouchMovementModeChanged()
    end)
    u13:OnDevTouchMovementModeChanged()
    if u13.gameSettingsTouchMoveMoveChangeConn then
        u13.gameSettingsTouchMoveMoveChangeConn:Disconnect()
    end
    u13.gameSettingsTouchMoveMoveChangeConn = u9:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[Anonymous function at line 150]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:OnGameSettingsTouchMovementModeChanged()
    end)
    u13:OnGameSettingsTouchMovementModeChanged()
    u9:SetCameraYInvertVisible()
    u9:SetGamepadCameraSensitivityVisible()
    u13.hasGameLoaded = game:IsLoaded()
    if not u13.hasGameLoaded then
        u13.gameLoadedConn = game.Loaded:Connect(function() --[[Anonymous function at line 160]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.hasGameLoaded = true
            u13.gameLoadedConn:Disconnect()
            u13.gameLoadedConn = nil
        end)
    end
    u13:OnPlayerCameraPropertyChange()
    return u13
end
function u11.GetModuleName(_) --[[Anonymous function at line 172]]
    return "BaseCamera"
end
function u11.OnCharacterAdded(u17, p18) --[[Anonymous function at line 176]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
    --]]
    u17.resetCameraAngle = u17.resetCameraAngle or u17:GetEnabled()
    u17.humanoidRootPart = nil
    if u7.TouchEnabled then
        u17.PlayerGui = u10:WaitForChild("PlayerGui")
        for _, v19 in ipairs(p18:GetChildren()) do
            if v19:IsA("Tool") then
                u17.isAToolEquipped = true
            end
        end
        p18.ChildAdded:Connect(function(p20) --[[Anonymous function at line 186]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            if p20:IsA("Tool") then
                u17.isAToolEquipped = true
            end
        end)
        p18.ChildRemoved:Connect(function(p21) --[[Anonymous function at line 191]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            if p21:IsA("Tool") then
                u17.isAToolEquipped = false
            end
        end)
    end
end
function u11.GetHumanoidRootPart(p22) --[[Anonymous function at line 199]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v23 = (not p22.humanoidRootPart and u10.Character and true or false) and u10.Character:FindFirstChildOfClass("Humanoid")
    if v23 then
        p22.humanoidRootPart = v23.RootPart
    end
    return p22.humanoidRootPart
end
function u11.GetBodyPartToFollow(_, p24, _) --[[Anonymous function at line 211]]
    if p24:GetState() == Enum.HumanoidStateType.Dead then
        local v25 = p24.Parent
        if v25 and v25:IsA("Model") then
            return v25:FindFirstChild("Head") or p24.RootPart
        end
    end
    return p24.RootPart
end
function u11.GetSubjectCFrame(p26) --[[Anonymous function at line 223]]
    local v27 = p26.lastSubjectCFrame
    local v28 = workspace.CurrentCamera
    if v28 then
        v28 = v28.CameraSubject
    end
    if not v28 then
        return v27
    end
    if v28:IsA("Humanoid") then
        local v29 = v28:GetState() == Enum.HumanoidStateType.Dead
        local v30 = v28.RootPart
        if v29 and (v28.Parent and v28.Parent:IsA("Model")) then
            v30 = v28.Parent:FindFirstChild("Head") or v30
        end
        if v30 and v30:IsA("BasePart") then
            local v31
            if v28.RigType == Enum.HumanoidRigType.R15 then
                if v28.AutomaticScalingEnabled then
                    v31 = Vector3.new(0, 1.5, 0)
                    local v32 = v28.RootPart
                    if v30 == v32 then
                        local v33 = (v32.Size.Y - (Vector3.new(2, 2, 1)).Y) / 2
                        v31 = v31 + Vector3.new(0, v33, 0)
                    end
                else
                    v31 = Vector3.new(0, 2, 0)
                end
            else
                v31 = Vector3.new(0, 1.5, 0)
            end
            v27 = v30.CFrame * CFrame.new((v29 and Vector3.new(0, 0, 0) or v31) + v28.CameraOffset)
        end
    elseif v28:IsA("BasePart") then
        v27 = v28.CFrame
    elseif v28:IsA("Model") then
        if v28.PrimaryPart then
            v27 = v28:GetPrimaryPartCFrame()
        else
            v27 = CFrame.new()
        end
    end
    if v27 then
        p26.lastSubjectCFrame = v27
    end
    return v27
end
function u11.GetSubjectVelocity(_) --[[Anonymous function at line 289]]
    local v34 = workspace.CurrentCamera
    if v34 then
        v34 = v34.CameraSubject
    end
    if not v34 then
        return Vector3.new(0, 0, 0)
    end
    if v34:IsA("BasePart") then
        return v34.Velocity
    end
    if v34:IsA("Humanoid") then
        local v35 = v34.RootPart
        if v35 then
            return v35.Velocity
        end
    else
        local v36 = v34:IsA("Model") and v34.PrimaryPart
        if v36 then
            return v36.Velocity
        end
    end
    return Vector3.new(0, 0, 0)
end
function u11.GetSubjectRotVelocity(_) --[[Anonymous function at line 318]]
    local v37 = workspace.CurrentCamera
    if v37 then
        v37 = v37.CameraSubject
    end
    if not v37 then
        return Vector3.new(0, 0, 0)
    end
    if v37:IsA("BasePart") then
        return v37.RotVelocity
    end
    if v37:IsA("Humanoid") then
        local v38 = v37.RootPart
        if v38 then
            return v38.RotVelocity
        end
    else
        local v39 = v37:IsA("Model") and v37.PrimaryPart
        if v39 then
            return v39.RotVelocity
        end
    end
    return Vector3.new(0, 0, 0)
end
function u11.StepZoom(p40) --[[Anonymous function at line 347]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    local v41 = p40.currentSubjectDistance
    local v42 = u4.getZoomDelta()
    if math.abs(v42) > 0 then
        local v43
        if v42 > 0 then
            local v44 = v41 + v42 * (v41 * 0.5 + 1)
            local v45 = p40.FIRST_PERSON_DISTANCE_THRESHOLD
            v43 = math.max(v44, v45)
        else
            local v46 = (v41 + v42) / (1 - v42 * 0.5)
            v43 = math.max(v46, 0.5)
        end
        p40:SetCameraToSubjectDistance(v43 < p40.FIRST_PERSON_DISTANCE_THRESHOLD and 0.5 or v43)
    end
    return u2.GetZoomRadius()
end
function u11.GetSubjectPosition(p47) --[[Anonymous function at line 372]]
    local v48 = p47.lastSubjectPosition
    local v49 = game.Workspace.CurrentCamera
    if v49 then
        v49 = v49.CameraSubject
    end
    if not v49 then
        return nil
    end
    if v49:IsA("Humanoid") then
        local v50 = v49:GetState() == Enum.HumanoidStateType.Dead
        local v51 = v49.RootPart
        if v50 and (v49.Parent and v49.Parent:IsA("Model")) then
            v51 = v49.Parent:FindFirstChild("Head") or v51
        end
        if v51 and v51:IsA("BasePart") then
            local v52
            if v49.RigType == Enum.HumanoidRigType.R15 then
                if v49.AutomaticScalingEnabled then
                    v52 = Vector3.new(0, 1.5, 0)
                    if v51 == v49.RootPart then
                        local v53 = v49.RootPart.Size.Y / 2 - (Vector3.new(2, 2, 1)).Y / 2
                        v52 = v52 + Vector3.new(0, v53, 0)
                    end
                else
                    v52 = Vector3.new(0, 2, 0)
                end
            else
                v52 = Vector3.new(0, 1.5, 0)
            end
            v48 = v51.CFrame.p + v51.CFrame:vectorToWorldSpace((v50 and Vector3.new(0, 0, 0) or v52) + v49.CameraOffset)
        end
    elseif v49:IsA("VehicleSeat") then
        v48 = v49.CFrame.p + v49.CFrame:vectorToWorldSpace(Vector3.new(0, 5, 0))
    elseif v49:IsA("SkateboardPlatform") then
        v48 = v49.CFrame.p + Vector3.new(0, 5, 0)
    elseif v49:IsA("BasePart") then
        v48 = v49.CFrame.p
    elseif v49:IsA("Model") then
        if v49.PrimaryPart then
            v48 = v49:GetPrimaryPartCFrame().p
        else
            v48 = v49:GetModelCFrame().p
        end
    end
    p47.lastSubject = v49
    p47.lastSubjectPosition = v48
    return v48
end
function u11.OnViewportSizeChanged(p54) --[[Anonymous function at line 442]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v55 = game.Workspace.CurrentCamera.ViewportSize
    p54.portraitMode = v55.X < v55.Y
    local v56 = u7.TouchEnabled
    if v56 then
        v56 = v55.Y < 500 and true or v55.X < 700
    end
    p54.isSmallTouchScreen = v56
end
function u11.OnCurrentCameraChanged(u57) --[[Anonymous function at line 450]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if u7.TouchEnabled then
        if u57.viewportSizeChangedConn then
            u57.viewportSizeChangedConn:Disconnect()
            u57.viewportSizeChangedConn = nil
        end
        local v58 = game.Workspace.CurrentCamera
        if v58 then
            u57:OnViewportSizeChanged()
            u57.viewportSizeChangedConn = v58:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[Anonymous function at line 461]]
                --[[
                Upvalues:
                    [1] = u57
                --]]
                u57:OnViewportSizeChanged()
            end)
        end
    end
    if u57.cameraSubjectChangedConn then
        u57.cameraSubjectChangedConn:Disconnect()
        u57.cameraSubjectChangedConn = nil
    end
    local v59 = game.Workspace.CurrentCamera
    if v59 then
        u57.cameraSubjectChangedConn = v59:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[Anonymous function at line 475]]
            --[[
            Upvalues:
                [1] = u57
            --]]
            u57:OnNewCameraSubject()
        end)
        u57:OnNewCameraSubject()
    end
end
function u11.OnDynamicThumbstickEnabled(p60) --[[Anonymous function at line 482]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if u7.TouchEnabled then
        p60.isDynamicThumbstickEnabled = true
    end
end
function u11.OnDynamicThumbstickDisabled(p61) --[[Anonymous function at line 488]]
    p61.isDynamicThumbstickEnabled = false
end
function u11.OnGameSettingsTouchMovementModeChanged(p62) --[[Anonymous function at line 492]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    if u10.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
        if u9.TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or u9.TouchMovementMode == Enum.TouchMovementMode.Default then
            p62:OnDynamicThumbstickEnabled()
            return
        end
        p62:OnDynamicThumbstickDisabled()
    end
end
function u11.OnDevTouchMovementModeChanged(p63) --[[Anonymous function at line 503]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u10.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
        p63:OnDynamicThumbstickEnabled()
    else
        p63:OnGameSettingsTouchMovementModeChanged()
    end
end
function u11.OnPlayerCameraPropertyChange(p64) --[[Anonymous function at line 511]]
    p64:SetCameraToSubjectDistance(p64.currentSubjectDistance)
end
function u11.InputTranslationToCameraAngleChange(_, p65, p66) --[[Anonymous function at line 516]]
    return p65 * p66
end
function u11.GamepadZoomPress(p67) --[[Anonymous function at line 522]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v68 = p67:GetCameraToSubjectDistance()
    local v69 = u10.CameraMaxZoomDistance
    for v70 = #p67.gamepadZoomLevels, 1, -1 do
        local v71 = p67.gamepadZoomLevels[v70]
        if v69 >= v71 then
            if v71 < u10.CameraMinZoomDistance then
                v71 = u10.CameraMinZoomDistance
            end
            if v69 == v71 then
                break
            end
            if v71 + (v69 - v71) / 2 < v68 then
                p67:SetCameraToSubjectDistance(v71)
                return
            end
            v69 = v71
        end
    end
    p67:SetCameraToSubjectDistance(p67.gamepadZoomLevels[#p67.gamepadZoomLevels])
end
function u11.Enable(p72, p73) --[[Anonymous function at line 560]]
    if p72.enabled ~= p73 then
        p72.enabled = p73
        p72:OnEnabledChanged()
    end
end
function u11.OnEnabledChanged(u74) --[[Anonymous function at line 568]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
    --]]
    if u74.enabled then
        u4.setInputEnabled(true)
        u74.gamepadZoomPressConnection = u4.gamepadZoomPress:Connect(function() --[[Anonymous function at line 572]]
            --[[
            Upvalues:
                [1] = u74
            --]]
            u74:GamepadZoomPress()
        end)
        if u10.CameraMode == Enum.CameraMode.LockFirstPerson then
            u74.currentSubjectDistance = 0.5
            if not u74.inFirstPerson then
                u74:EnterFirstPerson()
            end
        end
        if u74.cameraChangedConn then
            u74.cameraChangedConn:Disconnect()
            u74.cameraChangedConn = nil
        end
        u74.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[Anonymous function at line 584]]
            --[[
            Upvalues:
                [1] = u74
            --]]
            u74:OnCurrentCameraChanged()
        end)
        u74:OnCurrentCameraChanged()
    else
        u4.setInputEnabled(false)
        if u74.gamepadZoomPressConnection then
            u74.gamepadZoomPressConnection:Disconnect()
            u74.gamepadZoomPressConnection = nil
        end
        u74:Cleanup()
    end
end
function u11.GetEnabled(p75) --[[Anonymous function at line 600]]
    return p75.enabled
end
function u11.Cleanup(p76) --[[Anonymous function at line 604]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p76.subjectStateChangedConn then
        p76.subjectStateChangedConn:Disconnect()
        p76.subjectStateChangedConn = nil
    end
    if p76.viewportSizeChangedConn then
        p76.viewportSizeChangedConn:Disconnect()
        p76.viewportSizeChangedConn = nil
    end
    if p76.cameraChangedConn then
        p76.cameraChangedConn:Disconnect()
        p76.cameraChangedConn = nil
    end
    p76.lastCameraTransform = nil
    p76.lastSubjectCFrame = nil
    u1.restoreMouseBehavior()
end
function u11.UpdateMouseBehavior(p77) --[[Anonymous function at line 625]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u4
        [4] = u3
        [5] = u1
    --]]
    local v78 = u9.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
    if p77.isCameraToggle and v78 == false then
        u5.setCameraModeToastEnabled(true)
        u4.enableCameraToggleInput()
        u3(p77.inFirstPerson)
        return
    else
        u5.setCameraModeToastEnabled(false)
        u4.disableCameraToggleInput()
        if p77.inFirstPerson or p77.inMouseLockedMode then
            if p77.inFirstPerson then
                u1.setRotationTypeOverride(Enum.RotationType.CameraRelative)
            end
            u1.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
            return
        else
            u1.restoreRotationType()
            if u4.getRotationActivated() then
                u1.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition)
            else
                u1.restoreMouseBehavior()
            end
        end
    end
end
function u11.UpdateForDistancePropertyChange(p79) --[[Anonymous function at line 656]]
    p79:SetCameraToSubjectDistance(p79.currentSubjectDistance)
end
function u11.SetCameraToSubjectDistance(p80, p81) --[[Anonymous function at line 662]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
    --]]
    local v82 = p80.currentSubjectDistance
    if u10.CameraMode == Enum.CameraMode.LockFirstPerson then
        p80.currentSubjectDistance = 0.5
        if not p80.inFirstPerson then
            p80:EnterFirstPerson()
        end
    else
        local v83 = u10.CameraMinZoomDistance
        local v84 = u10.CameraMaxZoomDistance
        local v85 = math.clamp(p81, v83, v84)
        if v85 < 1 then
            p80.currentSubjectDistance = 0.5
            if not p80.inFirstPerson then
                p80:EnterFirstPerson()
            end
        else
            p80.currentSubjectDistance = v85
            if p80.inFirstPerson then
                p80:LeaveFirstPerson()
            end
        end
    end
    local v86 = u2.SetZoomParameters
    local v87 = p80.currentSubjectDistance
    local v88 = p81 - v82
    v86(v87, (math.sign(v88)))
    return p80.currentSubjectDistance
end
function u11.SetCameraType(p89, p90) --[[Anonymous function at line 696]]
    p89.cameraType = p90
end
function u11.GetCameraType(p91) --[[Anonymous function at line 701]]
    return p91.cameraType
end
function u11.SetCameraMovementMode(p92, p93) --[[Anonymous function at line 706]]
    p92.cameraMovementMode = p93
end
function u11.GetCameraMovementMode(p94) --[[Anonymous function at line 710]]
    return p94.cameraMovementMode
end
function u11.SetIsMouseLocked(p95, p96) --[[Anonymous function at line 714]]
    p95.inMouseLockedMode = p96
end
function u11.GetIsMouseLocked(p97) --[[Anonymous function at line 718]]
    return p97.inMouseLockedMode
end
function u11.InFirstPerson(p98) --[[Anonymous function at line 722]]
    return p98.inFirstPerson
end
function u11.EnterFirstPerson(p99) --[[Anonymous function at line 726]]
    p99.inFirstPerson = true
    p99:UpdateMouseBehavior()
end
function u11.LeaveFirstPerson(p100) --[[Anonymous function at line 731]]
    p100.inFirstPerson = false
    p100:UpdateMouseBehavior()
end
function u11.GetCameraToSubjectDistance(p101) --[[Anonymous function at line 737]]
    return p101.currentSubjectDistance
end
function u11.GetMeasuredDistanceToFocus(_) --[[Anonymous function at line 744]]
    local v102 = game.Workspace.CurrentCamera
    if v102 then
        return (v102.CoordinateFrame.p - v102.Focus.p).magnitude
    else
        return nil
    end
end
function u11.GetCameraLookVector(_) --[[Anonymous function at line 752]]
    return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or Vector3.new(0, 0, 1)
end
function u11.CalculateNewLookCFrameFromArg(p103, p104, p105) --[[Anonymous function at line 756]]
    local v106 = p104 or p103:GetCameraLookVector()
    local v107 = v106.Y
    local v108 = math.asin(v107)
    local v109 = p105.Y
    local v110 = v108 + -1.3962634015954636
    local v111 = v108 + 1.3962634015954636
    local v112 = math.clamp(v109, v110, v111)
    local v113 = Vector2.new(p105.X, v112)
    local v114 = CFrame.new(Vector3.new(0, 0, 0), v106)
    return CFrame.Angles(0, -v113.X, 0) * v114 * CFrame.Angles(-v113.Y, 0, 0)
end
function u11.CalculateNewLookVectorFromArg(p115, p116, p117) --[[Anonymous function at line 766]]
    return p115:CalculateNewLookCFrameFromArg(p116, p117).LookVector
end
function u11.CalculateNewLookVectorVRFromArg(p118, p119) --[[Anonymous function at line 771]]
    local v120 = ((p118:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1)).unit
    local v121 = Vector2.new(p119.X, 0)
    local v122 = CFrame.new(Vector3.new(0, 0, 0), v120)
    return ((CFrame.Angles(0, -v121.X, 0) * v122 * CFrame.Angles(-v121.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1)).unit
end
function u11.GetHumanoid(p123) --[[Anonymous function at line 781]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v124 = u10
    if v124 then
        v124 = u10.Character
    end
    if not v124 then
        return nil
    end
    local v125 = p123.humanoidCache[u10]
    if v125 and v125.Parent == v124 then
        return v125
    end
    p123.humanoidCache[u10] = nil
    local v126 = v124:FindFirstChildOfClass("Humanoid")
    if v126 then
        p123.humanoidCache[u10] = v126
    end
    return v126
end
function u11.GetHumanoidPartToFollow(_, p127, p128) --[[Anonymous function at line 799]]
    if p128 == Enum.HumanoidStateType.Dead then
        local v129 = p127.Parent
        if v129 then
            return v129:FindFirstChild("Head") or p127.Torso
        else
            return p127.Torso
        end
    else
        return p127.Torso
    end
end
function u11.OnNewCameraSubject(p130) --[[Anonymous function at line 812]]
    if p130.subjectStateChangedConn then
        p130.subjectStateChangedConn:Disconnect()
        p130.subjectStateChangedConn = nil
    end
end
function u11.IsInFirstPerson(p131) --[[Anonymous function at line 819]]
    return p131.inFirstPerson
end
function u11.Update(_, _) --[[Anonymous function at line 823]]
    error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2)
end
function u11.GetCameraHeight(p132) --[[Anonymous function at line 827]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return (not u8.VREnabled or p132.inFirstPerson) and 0 or 0.25881904510252074 * p132.currentSubjectDistance
end
return u11