-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("UserInputService")
local u2 = game:GetService("ContextActionService")
local u3 = Enum.UserInputType.None
local u4 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u5 = setmetatable({}, u4)
u5.__index = u5
function u5.new(p6) --[[Anonymous function at line 21]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u3
    --]]
    local v7 = u4.new()
    local v8 = u5
    local v9 = setmetatable(v7, v8)
    v9.CONTROL_ACTION_PRIORITY = p6
    v9.forwardValue = 0
    v9.backwardValue = 0
    v9.leftValue = 0
    v9.rightValue = 0
    v9.activeGamepad = u3
    v9.gamepadConnectedConn = nil
    v9.gamepadDisconnectedConn = nil
    return v9
end
function u5.Enable(p10, p11) --[[Anonymous function at line 37]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    if not u1.GamepadEnabled then
        return false
    end
    if p11 == p10.enabled then
        return true
    end
    p10.forwardValue = 0
    p10.backwardValue = 0
    p10.leftValue = 0
    p10.rightValue = 0
    p10.moveVector = Vector3.new(0, 0, 0)
    p10.isJumping = false
    if p11 then
        p10.activeGamepad = p10:GetHighestPriorityGamepad()
        if p10.activeGamepad == u3 then
            return false
        end
        p10:BindContextActions()
        p10:ConnectGamepadConnectionListeners()
    else
        p10:UnbindContextActions()
        p10:DisconnectGamepadConnectionListeners()
        p10.activeGamepad = u3
    end
    p10.enabled = p11
    return true
end
function u5.GetHighestPriorityGamepad(_) --[[Anonymous function at line 77]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    local v12 = u1:GetConnectedGamepads()
    local v13 = u3
    for _, v14 in pairs(v12) do
        if v14.Value < v13.Value then
            v13 = v14
        end
    end
    return v13
end
function u5.BindContextActions(u15) --[[Anonymous function at line 88]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    if u15.activeGamepad == u3 then
        return false
    end
    u2:BindActivate(u15.activeGamepad, Enum.KeyCode.ButtonR2)
    u2:BindActionAtPriority("jumpAction", function(_, p16, _) --[[Anonymous function at line 95]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15.isJumping = p16 == Enum.UserInputState.Begin
        return Enum.ContextActionResult.Sink
    end, false, u15.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA)
    u2:BindActionAtPriority("moveThumbstick", function(_, p17, p18) --[[Anonymous function at line 100]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        if p17 == Enum.UserInputState.Cancel then
            u15.moveVector = Vector3.new(0, 0, 0)
            return Enum.ContextActionResult.Sink
        end
        if u15.activeGamepad ~= p18.UserInputType then
            return Enum.ContextActionResult.Pass
        end
        if p18.KeyCode == Enum.KeyCode.Thumbstick1 then
            if p18.Position.magnitude > 0.2 then
                local v19 = u15
                local v20 = p18.Position.X
                local v21 = -p18.Position.Y
                v19.moveVector = Vector3.new(v20, 0, v21)
            else
                u15.moveVector = Vector3.new(0, 0, 0)
            end
            return Enum.ContextActionResult.Sink
        end
    end, false, u15.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1)
    return true
end
function u5.UnbindContextActions(p22) --[[Anonymous function at line 129]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    if p22.activeGamepad ~= u3 then
        u2:UnbindActivate(p22.activeGamepad, Enum.KeyCode.ButtonR2)
    end
    u2:UnbindAction("moveThumbstick")
    u2:UnbindAction("jumpAction")
end
function u5.OnNewGamepadConnected(p23) --[[Anonymous function at line 137]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v24 = p23:GetHighestPriorityGamepad()
    if v24 == p23.activeGamepad then
        return
    elseif v24 == u3 then
        warn("Gamepad:OnNewGamepadConnected found no connected gamepads")
        p23:UnbindContextActions()
    else
        if p23.activeGamepad ~= u3 then
            p23:UnbindContextActions()
        end
        p23.activeGamepad = v24
        p23:BindContextActions()
    end
end
function u5.OnCurrentGamepadDisconnected(p25) --[[Anonymous function at line 164]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    if p25.activeGamepad ~= u3 then
        u2:UnbindActivate(p25.activeGamepad, Enum.KeyCode.ButtonR2)
    end
    local v26 = p25:GetHighestPriorityGamepad()
    if p25.activeGamepad == u3 or v26 ~= p25.activeGamepad then
        if v26 == u3 then
            p25:UnbindContextActions()
            p25.activeGamepad = u3
        else
            p25.activeGamepad = v26
            u2:BindActivate(p25.activeGamepad, Enum.KeyCode.ButtonR2)
        end
    else
        warn("Gamepad:OnCurrentGamepadDisconnected found the supposedly disconnected gamepad in connectedGamepads.")
        p25:UnbindContextActions()
        p25.activeGamepad = u3
        return
    end
end
function u5.ConnectGamepadConnectionListeners(u27) --[[Anonymous function at line 189]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u27.gamepadConnectedConn = u1.GamepadConnected:Connect(function(_) --[[Anonymous function at line 190]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:OnNewGamepadConnected()
    end)
    u27.gamepadDisconnectedConn = u1.GamepadDisconnected:Connect(function(p28) --[[Anonymous function at line 194]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        if u27.activeGamepad == p28 then
            u27:OnCurrentGamepadDisconnected()
        end
    end)
end
function u5.DisconnectGamepadConnectionListeners(p29) --[[Anonymous function at line 202]]
    if p29.gamepadConnectedConn then
        p29.gamepadConnectedConn:Disconnect()
        p29.gamepadConnectedConn = nil
    end
    if p29.gamepadDisconnectedConn then
        p29.gamepadDisconnectedConn:Disconnect()
        p29.gamepadDisconnectedConn = nil
    end
end
return u5