-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {}
u1.__index = u1
local u2 = game:GetService("Players")
local u3 = game:GetService("RunService")
local u4 = game:GetService("UserInputService")
local u5 = game:GetService("GuiService")
local u6 = game:GetService("Workspace")
local u7 = UserSettings():GetService("UserGameSettings")
local u8 = game:GetService("VRService")
local u9 = require(script:WaitForChild("Keyboard"))
local u10 = require(script:WaitForChild("Gamepad"))
local u11 = require(script:WaitForChild("DynamicThumbstick"))
local v12, v13 = pcall(function() --[[Anonymous function at line 32]]
    return UserSettings():IsUserFeatureEnabled("UserHideControlsWhenMenuOpen")
end)
local u14 = v12 and v13
local v15, v16 = pcall(function() --[[Anonymous function at line 39]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local u17 = v15 and v16
local u18 = require(script:WaitForChild("TouchThumbstick"))
local u19 = require(script:WaitForChild("ClickToMoveController"))
local u20 = require(script:WaitForChild("TouchJump"))
local u21 = require(script:WaitForChild("VehicleController"))
local u22 = Enum.ContextActionPriority.Medium.Value
local u23 = {
    [Enum.TouchMovementMode.DPad] = u11,
    [Enum.DevTouchMovementMode.DPad] = u11,
    [Enum.TouchMovementMode.Thumbpad] = u11,
    [Enum.DevTouchMovementMode.Thumbpad] = u11,
    [Enum.TouchMovementMode.Thumbstick] = u18,
    [Enum.DevTouchMovementMode.Thumbstick] = u18,
    [Enum.TouchMovementMode.DynamicThumbstick] = u11,
    [Enum.DevTouchMovementMode.DynamicThumbstick] = u11,
    [Enum.TouchMovementMode.ClickToMove] = u19,
    [Enum.DevTouchMovementMode.ClickToMove] = u19,
    [Enum.TouchMovementMode.Default] = u11,
    [Enum.ComputerMovementMode.Default] = u9,
    [Enum.ComputerMovementMode.KeyboardMouse] = u9,
    [Enum.DevComputerMovementMode.KeyboardMouse] = u9,
    [Enum.DevComputerMovementMode.Scriptable] = nil,
    [Enum.ComputerMovementMode.ClickToMove] = u19,
    [Enum.DevComputerMovementMode.ClickToMove] = u19
}
local u24 = {
    [Enum.UserInputType.Keyboard] = u9,
    [Enum.UserInputType.MouseButton1] = u9,
    [Enum.UserInputType.MouseButton2] = u9,
    [Enum.UserInputType.MouseButton3] = u9,
    [Enum.UserInputType.MouseWheel] = u9,
    [Enum.UserInputType.MouseMovement] = u9,
    [Enum.UserInputType.Gamepad1] = u10,
    [Enum.UserInputType.Gamepad2] = u10,
    [Enum.UserInputType.Gamepad3] = u10,
    [Enum.UserInputType.Gamepad4] = u10
}
local u25 = nil
function u1.new() --[[Anonymous function at line 96]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
        [3] = u14
        [4] = u5
        [5] = u21
        [6] = u22
        [7] = u3
        [8] = u4
        [9] = u7
    --]]
    local v26 = u1
    local u27 = setmetatable({}, v26)
    u27.controllers = {}
    u27.activeControlModule = nil
    u27.activeController = nil
    u27.touchJumpController = nil
    u27.moveFunction = u2.LocalPlayer.Move
    u27.humanoid = nil
    u27.lastInputType = Enum.UserInputType.None
    u27.controlsEnabled = true
    u27.humanoidSeatedConn = nil
    u27.vehicleController = nil
    u27.touchControlFrame = nil
    u27.currentTorsoAngle = 0
    if u14 then
        u5.MenuOpened:Connect(function() --[[Anonymous function at line 119]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            if u27.touchControlFrame and u27.touchControlFrame.Visible then
                u27.touchControlFrame.Visible = false
            end
        end)
        u5.MenuClosed:Connect(function() --[[Anonymous function at line 125]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            if u27.touchControlFrame then
                u27.touchControlFrame.Visible = true
            end
        end)
    end
    u27.vehicleController = u21.new(u22)
    u2.LocalPlayer.CharacterAdded:Connect(function(p28) --[[Anonymous function at line 134]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnCharacterAdded(p28)
    end)
    u2.LocalPlayer.CharacterRemoving:Connect(function(p29) --[[Anonymous function at line 135]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnCharacterRemoving(p29)
    end)
    if u2.LocalPlayer.Character then
        u27:OnCharacterAdded(u2.LocalPlayer.Character)
    end
    u3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p30) --[[Anonymous function at line 140]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnRenderStepped(p30)
    end)
    u4.LastInputTypeChanged:Connect(function(p31) --[[Anonymous function at line 144]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnLastInputTypeChanged(p31)
    end)
    u7:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[Anonymous function at line 149]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnTouchMovementModeChange()
    end)
    u2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[Anonymous function at line 152]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnTouchMovementModeChange()
    end)
    u7:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[Anonymous function at line 156]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnComputerMovementModeChange()
    end)
    u2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[Anonymous function at line 159]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnComputerMovementModeChange()
    end)
    u27.playerGui = nil
    u27.touchGui = nil
    u27.playerGuiAddedConn = nil
    u5:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[Anonymous function at line 168]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:UpdateTouchGuiVisibility()
        u27:UpdateActiveControlModuleEnabled()
    end)
    if not u4.TouchEnabled then
        u27:OnLastInputTypeChanged(u4:GetLastInputType())
        return u27
    end
    u27.playerGui = u2.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not u27.playerGui then
        u27.playerGuiAddedConn = u2.LocalPlayer.ChildAdded:Connect(function(p32) --[[Anonymous function at line 179]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u4
            --]]
            if p32:IsA("PlayerGui") then
                u27.playerGui = p32
                u27:CreateTouchGuiContainer()
                u27.playerGuiAddedConn:Disconnect()
                u27.playerGuiAddedConn = nil
                u27:OnLastInputTypeChanged(u4:GetLastInputType())
            end
        end)
        return u27
    end
    u27:CreateTouchGuiContainer()
    u27:OnLastInputTypeChanged(u4:GetLastInputType())
    return u27
end
function u1.GetMoveVector(p33) --[[Anonymous function at line 199]]
    return not p33.activeController and Vector3.new(0, 0, 0) or p33.activeController:GetMoveVector()
end
function u1.GetEstimatedVRTorsoFrame(p34) --[[Anonymous function at line 219]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v35 = u8:GetUserCFrame(Enum.UserCFrame.Head)
    local _, v36, _ = v35:ToEulerAnglesYXZ()
    local v37 = -v36
    if u8:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and u8:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        local v38 = u8:GetUserCFrame(Enum.UserCFrame.LeftHand)
        local v39 = u8:GetUserCFrame(Enum.UserCFrame.RightHand)
        local v40 = v35.Position - v38.Position
        local v41 = v35.Position - v39.Position
        local v42 = v40.X
        local v43 = v40.Z
        local v44 = -math.atan2(v42, v43)
        local v45 = v41.X
        local v46 = v41.Z
        local v47 = (-math.atan2(v45, v46) - v44 + 12.566370614359172) % 6.283185307179586
        if v47 > 3.141592653589793 then
            v47 = v47 - 6.283185307179586
        end
        local v48 = (v44 + v47 / 2 + 12.566370614359172) % 6.283185307179586
        if v48 > 3.141592653589793 then
            v48 = v48 - 6.283185307179586
        end
        local v49 = (v37 - p34.currentTorsoAngle + 12.566370614359172) % 6.283185307179586
        if v49 > 3.141592653589793 then
            v49 = v49 - 6.283185307179586
        end
        local v50 = (v48 - p34.currentTorsoAngle + 12.566370614359172) % 6.283185307179586
        if v50 > 3.141592653589793 then
            v50 = v50 - 6.283185307179586
        end
        local v51
        if v50 > -1.5707963267948966 then
            v51 = v50 < 1.5707963267948966
        else
            v51 = false
        end
        if not v51 then
            v50 = v49
        end
        local v52 = math.min(v50, v49)
        local v53 = math.max(v50, v49)
        local v54 = 0
        if v52 > 0 then
            v53 = v52
        elseif v53 >= 0 then
            v53 = v54
        end
        p34.currentTorsoAngle = v53 + p34.currentTorsoAngle
    else
        p34.currentTorsoAngle = v37
    end
    return CFrame.new(v35.Position) * CFrame.fromEulerAnglesYXZ(0, -p34.currentTorsoAngle, 0)
end
function u1.GetActiveController(p55) --[[Anonymous function at line 263]]
    return p55.activeController
end
function u1.UpdateActiveControlModuleEnabled(u56) --[[Anonymous function at line 268]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u19
        [3] = u5
        [4] = u4
        [5] = u18
        [6] = u11
    --]]
    local function v57() --[[Anonymous function at line 278]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u19
            [3] = u2
        --]]
        if u56.activeControlModule == u19 then
            u56.activeController:Enable(true, u2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, u56.touchJumpController)
            return
        elseif u56.touchControlFrame then
            u56.activeController:Enable(true, u56.touchControlFrame)
        else
            u56.activeController:Enable(true)
        end
    end
    if u56.activeController then
        if u56.controlsEnabled then
            if u5.TouchControlsEnabled or (not u4.TouchEnabled or u56.activeControlModule ~= u19 and (u56.activeControlModule ~= u18 and u56.activeControlModule ~= u11)) then
                v57()
            else
                u56.activeController:Enable(false)
                if u56.moveFunction then
                    u56.moveFunction(u2.LocalPlayer, Vector3.new(0, 0, 0), true)
                end
            end
        else
            u56.activeController:Enable(false)
            if u56.moveFunction then
                u56.moveFunction(u2.LocalPlayer, Vector3.new(0, 0, 0), true)
            end
            return
        end
    else
        return
    end
end
function u1.Enable(p58, p59) --[[Anonymous function at line 318]]
    p58.controlsEnabled = p59 == nil and true or p59
    if p58.activeController then
        p58:UpdateActiveControlModuleEnabled()
    end
end
function u1.Disable(p60) --[[Anonymous function at line 332]]
    p60.controlsEnabled = false
    p60:UpdateActiveControlModuleEnabled()
end
function u1.SelectComputerMovementModule(_) --[[Anonymous function at line 340]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u24
        [4] = u25
        [5] = u7
        [6] = u9
        [7] = u19
        [8] = u23
    --]]
    if u4.KeyboardEnabled or u4.GamepadEnabled then
        local v61 = u2.LocalPlayer.DevComputerMovementMode
        local v62
        if v61 == Enum.DevComputerMovementMode.UserChoice then
            v62 = u24[u25]
            if u7.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v62 == u9 then
                v62 = u19
            end
        else
            v62 = u23[v61]
            if not v62 and v61 ~= Enum.DevComputerMovementMode.Scriptable then
                warn("No character control module is associated with DevComputerMovementMode ", v61)
            end
        end
        if v62 then
            return v62, true
        elseif v61 == Enum.DevComputerMovementMode.Scriptable then
            return nil, true
        else
            return nil, false
        end
    else
        return nil, false
    end
end
function u1.SelectTouchModule(_) --[[Anonymous function at line 378]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u23
        [4] = u7
    --]]
    if not u4.TouchEnabled then
        return nil, false
    end
    local v63 = u2.LocalPlayer.DevTouchMovementMode
    local v64
    if v63 == Enum.DevTouchMovementMode.UserChoice then
        v64 = u23[u7.TouchMovementMode]
    else
        if v63 == Enum.DevTouchMovementMode.Scriptable then
            return nil, true
        end
        v64 = u23[v63]
    end
    return v64, true
end
local function u67() --[[Anonymous function at line 394]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v65 = u4:GetGamepadState(Enum.UserInputType.Gamepad1)
    for _, v66 in pairs(v65) do
        if v66.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v66.Position
        end
    end
    return Vector3.new(0, 0, 0)
end
function u1.calculateRawMoveVector(p68, p69, p70) --[[Anonymous function at line 404]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u67
    --]]
    local v71 = u6.CurrentCamera
    if not v71 then
        return p70
    end
    local v72 = v71.CFrame
    if u8.VREnabled and p69.RootPart then
        u8:GetUserCFrame(Enum.UserCFrame.Head)
        local v73 = p68:GetEstimatedVRTorsoFrame()
        if (v71.Focus.Position - v72.Position).Magnitude < 3 then
            v72 = v72 * v73
        else
            v72 = v71.CFrame * (v73.Rotation + v73.Position * v71.HeadScale)
        end
    end
    if p69:GetState() ~= Enum.HumanoidStateType.Swimming then
        local _, _, _, v78, v75, v76, _, _, v77, _, _, v78 = v72:GetComponents()
        if v77 >= 1 or v77 <= -1 then
            v76 = -v75 * math.sign(v77)
        end
        local v79 = v78 * v78 + v76 * v76
        local v80 = math.sqrt(v79)
        local v81 = (v78 * p70.X + v76 * p70.Z) / v80
        local v82 = (v78 * p70.Z - v76 * p70.X) / v80
        return Vector3.new(v81, 0, v82)
    end
    if not u8.VREnabled then
        return v72:VectorToWorldSpace(p70)
    end
    local v83 = p70.X
    local v84 = p70.Z
    local v85 = Vector3.new(v83, 0, v84)
    if v85.Magnitude < 0.01 then
        return Vector3.new(0, 0, 0)
    end
    local v86 = -u67().Y * 1.3962634015954636
    local v87 = -v85.X
    local v88 = -v85.Z
    local v89 = math.atan2(v87, v88)
    local _, v90, _ = v72:ToEulerAnglesYXZ()
    local v91 = v89 + v90
    return CFrame.fromEulerAnglesYXZ(v86, v91, 0).LookVector
end
function u1.OnRenderStepped(p92, p93) --[[Anonymous function at line 463]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
    --]]
    if p92.activeController and (p92.activeController.enabled and p92.humanoid) then
        p92.activeController:OnRenderStepped(p93)
        local v94 = p92.activeController:GetMoveVector()
        local v95 = p92.activeController:IsMoveVectorCameraRelative()
        local v96 = p92:GetClickToMoveController()
        if p92.activeController ~= v96 then
            if v94.magnitude > 0 then
                v96:CleanupPath()
            else
                v96:OnRenderStepped(p93)
                v94 = v96:GetMoveVector()
                v95 = v96:IsMoveVectorCameraRelative()
            end
        end
        if p92.vehicleController then
            local v97
            v94, v97 = p92.vehicleController:Update(v94, v95, p92.activeControlModule == u10)
        end
        if v95 then
            v94 = p92:calculateRawMoveVector(p92.humanoid, v94)
        end
        p92.moveFunction(u2.LocalPlayer, v94, false)
        local v98 = p92.humanoid
        local v99 = not p92.activeController:GetIsJumping() and p92.touchJumpController
        if v99 then
            v99 = p92.touchJumpController:GetIsJumping()
        end
        v98.Jump = v99
    end
end
function u1.OnHumanoidSeated(p100, p101, p102) --[[Anonymous function at line 506]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    if p101 then
        if p102 and p102:IsA("VehicleSeat") then
            if not p100.vehicleController then
                p100.vehicleController = p100.vehicleController.new(u22)
            end
            p100.vehicleController:Enable(true, p102)
            return
        end
    elseif p100.vehicleController then
        p100.vehicleController:Enable(false, p102)
    end
end
function u1.OnCharacterAdded(u103, p104) --[[Anonymous function at line 521]]
    u103.humanoid = p104:FindFirstChildOfClass("Humanoid")
    while not u103.humanoid do
        p104.ChildAdded:wait()
        u103.humanoid = p104:FindFirstChildOfClass("Humanoid")
    end
    u103:UpdateTouchGuiVisibility()
    if u103.humanoidSeatedConn then
        u103.humanoidSeatedConn:Disconnect()
        u103.humanoidSeatedConn = nil
    end
    u103.humanoidSeatedConn = u103.humanoid.Seated:Connect(function(p105, p106) --[[Anonymous function at line 534]]
        --[[
        Upvalues:
            [1] = u103
        --]]
        u103:OnHumanoidSeated(p105, p106)
    end)
end
function u1.OnCharacterRemoving(p107, _) --[[Anonymous function at line 539]]
    p107.humanoid = nil
    p107:UpdateTouchGuiVisibility()
end
function u1.UpdateTouchGuiVisibility(p108) --[[Anonymous function at line 545]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p108.touchGui then
        local v109 = p108.humanoid
        if v109 then
            v109 = u5.TouchControlsEnabled
        end
        p108.touchGui.Enabled = v109 and true or false
    end
end
function u1.SwitchToController(p110, p111) --[[Anonymous function at line 559]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u19
        [3] = u18
        [4] = u11
        [5] = u20
    --]]
    if p111 then
        if not p110.controllers[p111] then
            p110.controllers[p111] = p111.new(u22)
        end
        if p110.activeController ~= p110.controllers[p111] then
            if p110.activeController then
                p110.activeController:Enable(false)
            end
            p110.activeController = p110.controllers[p111]
            p110.activeControlModule = p111
            if p110.touchControlFrame and (p110.activeControlModule == u19 or (p110.activeControlModule == u18 or p110.activeControlModule == u11)) then
                if not p110.controllers[u20] then
                    p110.controllers[u20] = u20.new()
                end
                p110.touchJumpController = p110.controllers[u20]
                p110.touchJumpController:Enable(true, p110.touchControlFrame)
            elseif p110.touchJumpController then
                p110.touchJumpController:Enable(false)
            end
            p110:UpdateActiveControlModuleEnabled()
        end
    else
        if p110.activeController then
            p110.activeController:Enable(false)
        end
        p110.activeController = nil
        p110.activeControlModule = nil
    end
end
function u1.OnLastInputTypeChanged(p112, p113) --[[Anonymous function at line 601]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u24
    --]]
    if u25 == p113 then
        warn("LastInputType Change listener called with current type.")
    end
    u25 = p113
    if u25 == Enum.UserInputType.Touch then
        local v114, v115 = p112:SelectTouchModule()
        if v115 then
            while not p112.touchControlFrame do
                wait()
            end
            p112:SwitchToController(v114)
        end
    elseif u24[u25] ~= nil then
        local v116 = p112:SelectComputerMovementModule()
        if v116 then
            p112:SwitchToController(v116)
        end
    end
    p112:UpdateTouchGuiVisibility()
end
function u1.OnComputerMovementModeChange(p117) --[[Anonymous function at line 627]]
    local v118, v119 = p117:SelectComputerMovementModule()
    if v119 then
        p117:SwitchToController(v118)
    end
end
function u1.OnTouchMovementModeChange(p120) --[[Anonymous function at line 634]]
    local v121, v122 = p120:SelectTouchModule()
    if v122 then
        while not p120.touchControlFrame do
            wait()
        end
        p120:SwitchToController(v121)
    end
end
function u1.CreateTouchGuiContainer(p123) --[[Anonymous function at line 644]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if p123.touchGui then
        p123.touchGui:Destroy()
    end
    p123.touchGui = Instance.new("ScreenGui")
    p123.touchGui.Name = "TouchGui"
    p123.touchGui.ResetOnSpawn = false
    p123.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    p123:UpdateTouchGuiVisibility()
    if u17 then
        p123.touchGui.ClipToDeviceSafeArea = false
    end
    p123.touchControlFrame = Instance.new("Frame")
    p123.touchControlFrame.Name = "TouchControlFrame"
    p123.touchControlFrame.Size = UDim2.new(1, 0, 1, 0)
    p123.touchControlFrame.BackgroundTransparency = 1
    p123.touchControlFrame.Parent = p123.touchGui
    p123.touchGui.Parent = p123.playerGui
end
function u1.GetClickToMoveController(p124) --[[Anonymous function at line 667]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u22
    --]]
    if not p124.controllers[u19] then
        p124.controllers[u19] = u19.new(u22)
    end
    return p124.controllers[u19]
end
return u1.new()