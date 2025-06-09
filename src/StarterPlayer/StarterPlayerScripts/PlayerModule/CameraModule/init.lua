-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {}
u1.__index = u1
local u2 = {
    "CameraMinZoomDistance",
    "CameraMaxZoomDistance",
    "CameraMode",
    "DevCameraOcclusionMode",
    "DevComputerCameraMode",
    "DevTouchCameraMode",
    "DevComputerMovementMode",
    "DevTouchMovementMode",
    "DevEnableMouseLock"
}
local u3 = {
    "ComputerCameraMovementMode",
    "ComputerMovementMode",
    "ControlMode",
    "GamepadCameraSensitivity",
    "MouseSensitivity",
    "RotationType",
    "TouchCameraMovementMode",
    "TouchMovementMode"
}
local u4 = game:GetService("Players")
local u5 = game:GetService("RunService")
local u6 = game:GetService("UserInputService")
local u7 = game:GetService("VRService")
local u8 = UserSettings():GetService("UserGameSettings")
local u9 = require(script:WaitForChild("CameraUtils"))
local u10 = require(script:WaitForChild("CameraInput"))
local u11 = require(script:WaitForChild("ClassicCamera"))
local u12 = require(script:WaitForChild("OrbitalCamera"))
local u13 = require(script:WaitForChild("LegacyCamera"))
local u14 = require(script:WaitForChild("VehicleCamera"))
local u15 = require(script:WaitForChild("VRCamera"))
local u16 = require(script:WaitForChild("VRVehicleCamera"))
local u17 = require(script:WaitForChild("Invisicam"))
local u18 = require(script:WaitForChild("Poppercam"))
local u19 = require(script:WaitForChild("TransparencyController"))
local u20 = {}
local u21 = {}
local v22 = u4.LocalPlayer:WaitForChild("PlayerScripts")
v22:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default)
v22:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow)
v22:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic)
v22:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default)
v22:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow)
v22:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic)
v22:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle)
function u1.new() --[[Anonymous function at line 94]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
        [3] = u19
        [4] = u5
        [5] = u2
        [6] = u3
        [7] = u8
    --]]
    local v23 = u1
    local u24 = setmetatable({}, v23)
    u24.activeCameraController = nil
    u24.activeOcclusionModule = nil
    u24.activeTransparencyController = nil
    u24.currentComputerCameraMovementMode = nil
    u24.cameraSubjectChangedConn = nil
    u24.cameraTypeChangedConn = nil
    for _, v25 in pairs(u4:GetPlayers()) do
        u24:OnPlayerAdded(v25)
    end
    u4.PlayerAdded:Connect(function(p26) --[[Anonymous function at line 114]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:OnPlayerAdded(p26)
    end)
    u24.activeTransparencyController = u19.new()
    u24.activeTransparencyController:Enable(true)
    u24:ActivateCameraController(u24:GetCameraControlChoice())
    u24:ActivateOcclusionModule(u4.LocalPlayer.DevCameraOcclusionMode)
    u24:OnCurrentCameraChanged()
    u5:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p27) --[[Anonymous function at line 124]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:Update(p27)
    end)
    for _, u28 in pairs(u2) do
        u4.LocalPlayer:GetPropertyChangedSignal(u28):Connect(function() --[[Anonymous function at line 128]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u28
            --]]
            u24:OnLocalPlayerCameraPropertyChanged(u28)
        end)
    end
    for _, u29 in pairs(u3) do
        u8:GetPropertyChangedSignal(u29):Connect(function() --[[Anonymous function at line 134]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u29
            --]]
            u24:OnUserGameSettingsPropertyChanged(u29)
        end)
    end
    game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[Anonymous function at line 138]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:OnCurrentCameraChanged()
    end)
    return u24
end
function u1.GetCameraMovementModeFromSettings(_) --[[Anonymous function at line 145]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u6
        [4] = u8
    --]]
    if u4.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return u9.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic)
    else
        local v30, v31
        if u6.TouchEnabled then
            v30 = u9.ConvertCameraModeEnumToStandard(u4.LocalPlayer.DevTouchCameraMode)
            v31 = u9.ConvertCameraModeEnumToStandard(u8.TouchCameraMovementMode)
        else
            v30 = u9.ConvertCameraModeEnumToStandard(u4.LocalPlayer.DevComputerCameraMode)
            v31 = u9.ConvertCameraModeEnumToStandard(u8.ComputerCameraMovementMode)
        end
        if v30 == Enum.DevComputerCameraMovementMode.UserChoice then
            return v31
        else
            return v30
        end
    end
end
function u1.ActivateOcclusionModule(p32, p33) --[[Anonymous function at line 170]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
        [3] = u21
        [4] = u4
    --]]
    local v34
    if p33 == Enum.DevCameraOcclusionMode.Zoom then
        v34 = u18
    else
        if p33 ~= Enum.DevCameraOcclusionMode.Invisicam then
            warn("CameraScript ActivateOcclusionModule called with unsupported mode")
            return
        end
        v34 = u17
    end
    p32.occlusionMode = p33
    if p32.activeOcclusionModule and p32.activeOcclusionModule:GetOcclusionMode() == p33 then
        if not p32.activeOcclusionModule:GetEnabled() then
            p32.activeOcclusionModule:Enable(true)
        end
    else
        local v35 = p32.activeOcclusionModule
        p32.activeOcclusionModule = u21[v34]
        if not p32.activeOcclusionModule then
            p32.activeOcclusionModule = v34.new()
            if p32.activeOcclusionModule then
                u21[v34] = p32.activeOcclusionModule
            end
        end
        if p32.activeOcclusionModule then
            if p32.activeOcclusionModule:GetOcclusionMode() ~= p33 then
                warn("CameraScript ActivateOcclusionModule mismatch: ", p32.activeOcclusionModule:GetOcclusionMode(), "~=", p33)
            end
            if v35 then
                if v35 == p32.activeOcclusionModule then
                    warn("CameraScript ActivateOcclusionModule failure to detect already running correct module")
                else
                    v35:Enable(false)
                end
            end
            if p33 == Enum.DevCameraOcclusionMode.Invisicam then
                if u4.LocalPlayer.Character then
                    p32.activeOcclusionModule:CharacterAdded(u4.LocalPlayer.Character, u4.LocalPlayer)
                end
            else
                for _, v36 in pairs(u4:GetPlayers()) do
                    if v36 and v36.Character then
                        p32.activeOcclusionModule:CharacterAdded(v36.Character, v36)
                    end
                end
                p32.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject)
            end
            p32.activeOcclusionModule:Enable(true)
        end
    end
end
function u1.ShouldUseVehicleCamera(p37) --[[Anonymous function at line 249]]
    local v38 = workspace.CurrentCamera
    if not v38 then
        return false
    end
    local v39 = v38.CameraType
    local v40 = v38.CameraSubject
    local v41 = v39 == Enum.CameraType.Custom and true or v39 == Enum.CameraType.Follow
    local v42 = v40 and v40:IsA("VehicleSeat") or false
    local v43 = p37.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam
    if v42 then
        if not v41 then
            v43 = v41
        end
    else
        v43 = v42
    end
    return v43
end
function u1.ActivateCameraController(p44, p45, p46) --[[Anonymous function at line 267]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
        [3] = u15
        [4] = u11
        [5] = u12
        [6] = u16
        [7] = u14
        [8] = u20
    --]]
    local v47 = nil
    if p46 ~= nil then
        if p46 == Enum.CameraType.Scriptable then
            if p44.activeCameraController then
                p44.activeCameraController:Enable(false)
                p44.activeCameraController = nil
            end
            return
        end
        if p46 == Enum.CameraType.Custom then
            p45 = p44:GetCameraMovementModeFromSettings()
        elseif p46 == Enum.CameraType.Track then
            p45 = Enum.ComputerCameraMovementMode.Classic
        elseif p46 == Enum.CameraType.Follow then
            p45 = Enum.ComputerCameraMovementMode.Follow
        elseif p46 == Enum.CameraType.Orbital then
            p45 = Enum.ComputerCameraMovementMode.Orbital
        elseif p46 == Enum.CameraType.Attach or (p46 == Enum.CameraType.Watch or p46 == Enum.CameraType.Fixed) then
            v47 = u13
        else
            warn("CameraScript encountered an unhandled Camera.CameraType value: ", p46)
        end
    end
    if not v47 then
        if u7.VREnabled then
            v47 = u15
        elseif p45 == Enum.ComputerCameraMovementMode.Classic or (p45 == Enum.ComputerCameraMovementMode.Follow or (p45 == Enum.ComputerCameraMovementMode.Default or p45 == Enum.ComputerCameraMovementMode.CameraToggle)) then
            v47 = u11
        else
            if p45 ~= Enum.ComputerCameraMovementMode.Orbital then
                warn("ActivateCameraController did not select a module.")
                return
            end
            v47 = u12
        end
    end
    if p44:ShouldUseVehicleCamera() then
        if u7.VREnabled then
            v47 = u16
        else
            v47 = u14
        end
    end
    local v48
    if u20[v47] then
        v48 = u20[v47]
        if v48.Reset then
            v48:Reset()
        end
    else
        v48 = v47.new()
        u20[v47] = v48
    end
    if p44.activeCameraController then
        if p44.activeCameraController == v48 then
            if not p44.activeCameraController:GetEnabled() then
                p44.activeCameraController:Enable(true)
            end
        else
            p44.activeCameraController:Enable(false)
            p44.activeCameraController = v48
            p44.activeCameraController:Enable(true)
        end
    elseif v48 ~= nil then
        p44.activeCameraController = v48
        p44.activeCameraController:Enable(true)
    end
    if p44.activeCameraController then
        if p45 ~= nil then
            p44.activeCameraController:SetCameraMovementMode(p45)
            return
        end
        if p46 ~= nil then
            p44.activeCameraController:SetCameraType(p46)
        end
    end
end
function u1.OnCameraSubjectChanged(p49) --[[Anonymous function at line 372]]
    local v50 = workspace.CurrentCamera
    local v51
    if v50 then
        v51 = v50.CameraSubject
    else
        v51 = v50
    end
    if p49.activeTransparencyController then
        p49.activeTransparencyController:SetSubject(v51)
    end
    if p49.activeOcclusionModule then
        p49.activeOcclusionModule:OnCameraSubjectChanged(v51)
    end
    p49:ActivateCameraController(nil, v50.CameraType)
end
function u1.OnCameraTypeChanged(p52, p53) --[[Anonymous function at line 387]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
    --]]
    if p53 == Enum.CameraType.Scriptable and u6.MouseBehavior == Enum.MouseBehavior.LockCenter then
        u9.restoreMouseBehavior()
    end
    p52:ActivateCameraController(nil, p53)
end
function u1.OnCurrentCameraChanged(u54) --[[Anonymous function at line 399]]
    local u55 = game.Workspace.CurrentCamera
    if u55 then
        if u54.cameraSubjectChangedConn then
            u54.cameraSubjectChangedConn:Disconnect()
        end
        if u54.cameraTypeChangedConn then
            u54.cameraTypeChangedConn:Disconnect()
        end
        u54.cameraSubjectChangedConn = u55:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[Anonymous function at line 411]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u55
            --]]
            u54:OnCameraSubjectChanged(u55.CameraSubject)
        end)
        u54.cameraTypeChangedConn = u55:GetPropertyChangedSignal("CameraType"):Connect(function() --[[Anonymous function at line 415]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u55
            --]]
            u54:OnCameraTypeChanged(u55.CameraType)
        end)
        u54:OnCameraSubjectChanged(u55.CameraSubject)
        u54:OnCameraTypeChanged(u55.CameraType)
    end
end
function u1.OnLocalPlayerCameraPropertyChanged(p56, p57) --[[Anonymous function at line 423]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
    --]]
    if p57 == "CameraMode" then
        if u4.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
            if u4.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
                local v58 = p56:GetCameraMovementModeFromSettings()
                p56:ActivateCameraController(u9.ConvertCameraModeEnumToStandard(v58))
            else
                warn("Unhandled value for property player.CameraMode: ", u4.LocalPlayer.CameraMode)
            end
        end
        if not p56.activeCameraController or p56.activeCameraController:GetModuleName() ~= "ClassicCamera" then
            p56:ActivateCameraController(u9.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic))
        end
        if p56.activeCameraController then
            p56.activeCameraController:UpdateForDistancePropertyChange()
            return
        end
    else
        if p57 == "DevComputerCameraMode" or p57 == "DevTouchCameraMode" then
            local v59 = p56:GetCameraMovementModeFromSettings()
            p56:ActivateCameraController(u9.ConvertCameraModeEnumToStandard(v59))
            return
        end
        if p57 == "DevCameraOcclusionMode" then
            p56:ActivateOcclusionModule(u4.LocalPlayer.DevCameraOcclusionMode)
            return
        end
        if p57 == "CameraMinZoomDistance" or p57 == "CameraMaxZoomDistance" then
            if p56.activeCameraController then
                p56.activeCameraController:UpdateForDistancePropertyChange()
                return
            end
        else
            if p57 == "DevTouchMovementMode" then
                return
            end
            if p57 == "DevComputerMovementMode" then
                return
            end
            local _ = p57 == "DevEnableMouseLock"
        end
    end
end
function u1.OnUserGameSettingsPropertyChanged(p60, p61) --[[Anonymous function at line 467]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p61 == "ComputerCameraMovementMode" then
        local v62 = p60:GetCameraMovementModeFromSettings()
        p60:ActivateCameraController(u9.ConvertCameraModeEnumToStandard(v62))
    end
end
function u1.Update(p63, p64) --[[Anonymous function at line 480]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p63.activeCameraController then
        p63.activeCameraController:UpdateMouseBehavior()
        local v65, v66 = p63.activeCameraController:Update(p64)
        if p63.activeOcclusionModule then
            v65, v66 = p63.activeOcclusionModule:Update(p64, v65, v66)
        end
        local v67 = game.Workspace.CurrentCamera
        v67.CFrame = v65
        v67.Focus = v66
        if p63.activeTransparencyController then
            p63.activeTransparencyController:Update(p64)
        end
        if u10.getInputEnabled() then
            u10.resetInputForFrameEnd()
        end
    end
end
function u1.GetCameraControlChoice(_) --[[Anonymous function at line 508]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u9
        [4] = u8
    --]]
    local v68 = u4.LocalPlayer
    if v68 then
        if u6:GetLastInputType() == Enum.UserInputType.Touch or u6.TouchEnabled then
            if v68.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
                return u9.ConvertCameraModeEnumToStandard(u8.TouchCameraMovementMode)
            else
                return u9.ConvertCameraModeEnumToStandard(v68.DevTouchCameraMode)
            end
        else
            if v68.DevComputerCameraMode ~= Enum.DevComputerCameraMovementMode.UserChoice then
                return u9.ConvertCameraModeEnumToStandard(v68.DevComputerCameraMode)
            end
            local v69 = u9.ConvertCameraModeEnumToStandard(u8.ComputerCameraMovementMode)
            return u9.ConvertCameraModeEnumToStandard(v69)
        end
    else
        return
    end
end
function u1.OnCharacterAdded(p70, p71, p72) --[[Anonymous function at line 531]]
    if p70.activeOcclusionModule then
        p70.activeOcclusionModule:CharacterAdded(p71, p72)
    end
end
function u1.OnCharacterRemoving(p73, p74, p75) --[[Anonymous function at line 537]]
    if p73.activeOcclusionModule then
        p73.activeOcclusionModule:CharacterRemoving(p74, p75)
    end
end
function u1.OnPlayerAdded(u76, u77) --[[Anonymous function at line 543]]
    u77.CharacterAdded:Connect(function(p78) --[[Anonymous function at line 544]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u77
        --]]
        u76:OnCharacterAdded(p78, u77)
    end)
    u77.CharacterRemoving:Connect(function(p79) --[[Anonymous function at line 547]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u77
        --]]
        u76:OnCharacterRemoving(p79, u77)
    end)
end
u1.new()
return {}