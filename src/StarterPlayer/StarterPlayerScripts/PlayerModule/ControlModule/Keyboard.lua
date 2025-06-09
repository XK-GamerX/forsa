-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("UserInputService")
local u2 = game:GetService("ContextActionService")
local u3 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u4 = setmetatable({}, u3)
u4.__index = u4
function u4.new(p5) --[[Anonymous function at line 20]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v6 = u3.new()
    local v7 = u4
    local v8 = setmetatable(v6, v7)
    v8.CONTROL_ACTION_PRIORITY = p5
    v8.textFocusReleasedConn = nil
    v8.textFocusGainedConn = nil
    v8.windowFocusReleasedConn = nil
    v8.forwardValue = 0
    v8.backwardValue = 0
    v8.leftValue = 0
    v8.rightValue = 0
    v8.jumpEnabled = true
    return v8
end
function u4.Enable(p9, p10) --[[Anonymous function at line 39]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if not u1.KeyboardEnabled then
        return false
    end
    if p10 == p9.enabled then
        return true
    end
    p9.forwardValue = 0
    p9.backwardValue = 0
    p9.leftValue = 0
    p9.rightValue = 0
    p9.moveVector = Vector3.new(0, 0, 0)
    p9.jumpRequested = false
    p9:UpdateJump()
    if p10 then
        p9:BindContextActions()
        p9:ConnectFocusEventListeners()
    else
        p9:UnbindContextActions()
        p9:DisconnectFocusEventListeners()
    end
    p9.enabled = p10
    return true
end
function u4.UpdateMovement(p11, p12) --[[Anonymous function at line 71]]
    if p12 == Enum.UserInputState.Cancel then
        p11.moveVector = Vector3.new(0, 0, 0)
    else
        local v13 = p11.leftValue + p11.rightValue
        local v14 = p11.forwardValue + p11.backwardValue
        p11.moveVector = Vector3.new(v13, 0, v14)
    end
end
function u4.UpdateJump(p15) --[[Anonymous function at line 79]]
    p15.isJumping = p15.jumpRequested
end
function u4.BindContextActions(u16) --[[Anonymous function at line 83]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2:BindActionAtPriority("moveForwardAction", function(_, p17, _) --[[Anonymous function at line 89]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.forwardValue = p17 == Enum.UserInputState.Begin and -1 or 0
        u16:UpdateMovement(p17)
        return Enum.ContextActionResult.Pass
    end, false, u16.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward)
    u2:BindActionAtPriority("moveBackwardAction", function(_, p18, _) --[[Anonymous function at line 95]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.backwardValue = p18 == Enum.UserInputState.Begin and 1 or 0
        u16:UpdateMovement(p18)
        return Enum.ContextActionResult.Pass
    end, false, u16.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward)
    u2:BindActionAtPriority("moveLeftAction", function(_, p19, _) --[[Anonymous function at line 101]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.leftValue = p19 == Enum.UserInputState.Begin and -1 or 0
        u16:UpdateMovement(p19)
        return Enum.ContextActionResult.Pass
    end, false, u16.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft)
    u2:BindActionAtPriority("moveRightAction", function(_, p20, _) --[[Anonymous function at line 107]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.rightValue = p20 == Enum.UserInputState.Begin and 1 or 0
        u16:UpdateMovement(p20)
        return Enum.ContextActionResult.Pass
    end, false, u16.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight)
    u2:BindActionAtPriority("jumpAction", function(_, p21, _) --[[Anonymous function at line 113]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        local v22 = u16
        local v23 = u16.jumpEnabled
        if v23 then
            v23 = p21 == Enum.UserInputState.Begin
        end
        v22.jumpRequested = v23
        u16:UpdateJump()
        return Enum.ContextActionResult.Pass
    end, false, u16.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump)
end
function u4.UnbindContextActions(_) --[[Anonymous function at line 131]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2:UnbindAction("moveForwardAction")
    u2:UnbindAction("moveBackwardAction")
    u2:UnbindAction("moveLeftAction")
    u2:UnbindAction("moveRightAction")
    u2:UnbindAction("jumpAction")
end
function u4.ConnectFocusEventListeners(u24) --[[Anonymous function at line 139]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local function v25() --[[Anonymous function at line 140]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24.moveVector = Vector3.new(0, 0, 0)
        u24.forwardValue = 0
        u24.backwardValue = 0
        u24.leftValue = 0
        u24.rightValue = 0
        u24.jumpRequested = false
        u24:UpdateJump()
    end
    u24.textFocusReleasedConn = u1.TextBoxFocusReleased:Connect(v25)
    u24.textFocusGainedConn = u1.TextBoxFocused:Connect(function(_) --[[Function name: onTextFocusGained, line 150]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24.jumpRequested = false
        u24:UpdateJump()
    end)
    u24.windowFocusReleasedConn = u1.WindowFocused:Connect(v25)
end
function u4.DisconnectFocusEventListeners(p26) --[[Anonymous function at line 160]]
    if p26.textFocusReleasedConn then
        p26.textFocusReleasedConn:Disconnect()
        p26.textFocusReleasedConn = nil
    end
    if p26.textFocusGainedConn then
        p26.textFocusGainedConn:Disconnect()
        p26.textFocusGainedConn = nil
    end
    if p26.windowFocusReleasedConn then
        p26.windowFocusReleasedConn:Disconnect()
        p26.windowFocusReleasedConn = nil
    end
end
return u4