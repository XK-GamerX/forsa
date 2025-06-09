-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local u2 = game:GetService("GuiService")
local u3 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u4 = setmetatable({}, u3)
u4.__index = u4
function u4.new() --[[Anonymous function at line 20]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v5 = u3.new()
    local v6 = u4
    local v7 = setmetatable(v5, v6)
    v7.parentUIFrame = nil
    v7.jumpButton = nil
    v7.characterAddedConn = nil
    v7.humanoidStateEnabledChangedConn = nil
    v7.humanoidJumpPowerConn = nil
    v7.humanoidParentConn = nil
    v7.externallyEnabled = false
    v7.jumpPower = 0
    v7.jumpStateEnabled = true
    v7.isJumping = false
    v7.humanoid = nil
    return v7
end
function u4.EnableButton(p8, p9) --[[Anonymous function at line 38]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p9 then
        if not p8.jumpButton then
            p8:Create()
        end
        local v10 = u1.LocalPlayer.Character
        if v10 then
            v10 = u1.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        end
        if v10 and (p8.externallyEnabled and (p8.externallyEnabled and v10.JumpPower > 0)) then
            p8.jumpButton.Visible = true
            return
        end
    else
        p8.jumpButton.Visible = false
        p8.isJumping = false
        p8.jumpButton.ImageRectOffset = Vector2.new(1, 146)
    end
end
function u4.UpdateEnabled(p11) --[[Anonymous function at line 58]]
    if p11.jumpPower > 0 and p11.jumpStateEnabled then
        p11:EnableButton(true)
    else
        p11:EnableButton(false)
    end
end
function u4.HumanoidChanged(p12, p13) --[[Anonymous function at line 66]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v14 = u1.LocalPlayer.Character
    if v14 then
        v14 = u1.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
    if v14 then
        if p13 == "JumpPower" then
            p12.jumpPower = v14.JumpPower
            p12:UpdateEnabled()
            return
        end
        if p13 == "Parent" and not v14.Parent then
            p12.humanoidChangeConn:Disconnect()
        end
    end
end
function u4.HumanoidStateEnabledChanged(p15, p16, p17) --[[Anonymous function at line 80]]
    if p16 == Enum.HumanoidStateType.Jumping then
        p15.jumpStateEnabled = p17
        p15:UpdateEnabled()
    end
end
function u4.CharacterAdded(u18, p19) --[[Anonymous function at line 87]]
    if u18.humanoidChangeConn then
        u18.humanoidChangeConn:Disconnect()
        u18.humanoidChangeConn = nil
    end
    u18.humanoid = p19:FindFirstChildOfClass("Humanoid")
    while not u18.humanoid do
        p19.ChildAdded:wait()
        u18.humanoid = p19:FindFirstChildOfClass("Humanoid")
    end
    u18.humanoidJumpPowerConn = u18.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() --[[Anonymous function at line 99]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18.jumpPower = u18.humanoid.JumpPower
        u18:UpdateEnabled()
    end)
    u18.humanoidParentConn = u18.humanoid:GetPropertyChangedSignal("Parent"):Connect(function() --[[Anonymous function at line 104]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        if not u18.humanoid.Parent then
            u18.humanoidJumpPowerConn:Disconnect()
            u18.humanoidJumpPowerConn = nil
            u18.humanoidParentConn:Disconnect()
            u18.humanoidParentConn = nil
        end
    end)
    u18.humanoidStateEnabledChangedConn = u18.humanoid.StateEnabledChanged:Connect(function(p20, p21) --[[Anonymous function at line 113]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18:HumanoidStateEnabledChanged(p20, p21)
    end)
    u18.jumpPower = u18.humanoid.JumpPower
    u18.jumpStateEnabled = u18.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)
    u18:UpdateEnabled()
end
function u4.SetupCharacterAddedFunction(u22) --[[Anonymous function at line 122]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u22.characterAddedConn = u1.LocalPlayer.CharacterAdded:Connect(function(p23) --[[Anonymous function at line 123]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:CharacterAdded(p23)
    end)
    if u1.LocalPlayer.Character then
        u22:CharacterAdded(u1.LocalPlayer.Character)
    end
end
function u4.Enable(p24, p25, p26) --[[Anonymous function at line 131]]
    if p26 then
        p24.parentUIFrame = p26
    end
    p24.externallyEnabled = p25
    p24:EnableButton(p25)
end
function u4.Create(u27) --[[Anonymous function at line 139]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u27.parentUIFrame then
        if u27.jumpButton then
            u27.jumpButton:Destroy()
            u27.jumpButton = nil
        end
        local v28 = u27.parentUIFrame.AbsoluteSize.x
        local v29 = u27.parentUIFrame.AbsoluteSize.y
        local v30 = math.min(v28, v29) <= 500
        local v31 = v30 and 70 or 120
        u27.jumpButton = Instance.new("ImageButton")
        u27.jumpButton.Name = "JumpButton"
        u27.jumpButton.Visible = false
        u27.jumpButton.BackgroundTransparency = 1
        u27.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
        u27.jumpButton.ImageRectOffset = Vector2.new(1, 146)
        u27.jumpButton.ImageRectSize = Vector2.new(144, 144)
        u27.jumpButton.Size = UDim2.new(0, v31, 0, v31)
        u27.jumpButton.Position = v30 and UDim2.new(1, -(v31 * 1.5 - 10), 1, -v31 - 20) or UDim2.new(1, -(v31 * 1.5 - 10), 1, -v31 * 1.75)
        local u32 = nil
        u27.jumpButton.InputBegan:connect(function(p33) --[[Anonymous function at line 166]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u27
            --]]
            if not u32 and (p33.UserInputType == Enum.UserInputType.Touch and p33.UserInputState == Enum.UserInputState.Begin) then
                u32 = p33
                u27.jumpButton.ImageRectOffset = Vector2.new(146, 146)
                u27.isJumping = true
            end
        end)
        u27.jumpButton.InputEnded:connect(function(p34) --[[Anonymous function at line 185]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u27
            --]]
            if p34 == u32 then
                u32 = nil
                u27.isJumping = false
                u27.jumpButton.ImageRectOffset = Vector2.new(1, 146)
            end
        end)
        u2.MenuOpened:connect(function() --[[Anonymous function at line 191]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u27
            --]]
            if u32 then
                u32 = nil
                u27.isJumping = false
                u27.jumpButton.ImageRectOffset = Vector2.new(1, 146)
            end
        end)
        if not u27.characterAddedConn then
            u27:SetupCharacterAddedFunction()
        end
        u27.jumpButton.Parent = u27.parentUIFrame
    end
end
return u4