-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

game:GetService("Players")
local u1 = game:GetService("GuiService")
local u2 = game:GetService("UserInputService")
UserSettings():GetService("UserGameSettings")
local v3, v4 = pcall(function() --[[Anonymous function at line 13]]
    return UserSettings():IsUserFeatureEnabled("UserClampClassicThumbstick")
end)
local u5 = v3 and v4
local u6 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u7 = setmetatable({}, u6)
u7.__index = u7
function u7.new() --[[Anonymous function at line 26]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v8 = u6.new()
    local v9 = u7
    local v10 = setmetatable(v8, v9)
    v10.isFollowStick = false
    v10.thumbstickFrame = nil
    v10.moveTouchObject = nil
    v10.onTouchMovedConn = nil
    v10.onTouchEndedConn = nil
    v10.screenPos = nil
    v10.stickImage = nil
    v10.thumbstickSize = nil
    return v10
end
function u7.Enable(p11, p12, p13) --[[Anonymous function at line 41]]
    if p12 == nil then
        return false
    end
    local v14 = p12 and true or false
    if p11.enabled == v14 then
        return true
    end
    p11.moveVector = Vector3.new(0, 0, 0)
    p11.isJumping = false
    if v14 then
        if not p11.thumbstickFrame then
            p11:Create(p13)
        end
        p11.thumbstickFrame.Visible = true
    else
        p11.thumbstickFrame.Visible = false
        p11:OnInputEnded()
    end
    p11.enabled = v14
end
function u7.OnInputEnded(p15) --[[Anonymous function at line 62]]
    p15.thumbstickFrame.Position = p15.screenPos
    p15.stickImage.Position = UDim2.new(0, p15.thumbstickFrame.Size.X.Offset / 2 - p15.thumbstickSize / 4, 0, p15.thumbstickFrame.Size.Y.Offset / 2 - p15.thumbstickSize / 4)
    p15.moveVector = Vector3.new(0, 0, 0)
    p15.isJumping = false
    p15.thumbstickFrame.Position = p15.screenPos
    p15.moveTouchObject = nil
end
function u7.Create(u16, p17) --[[Anonymous function at line 71]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u1
    --]]
    if u16.thumbstickFrame then
        u16.thumbstickFrame:Destroy()
        u16.thumbstickFrame = nil
        if u16.onTouchMovedConn then
            u16.onTouchMovedConn:Disconnect()
            u16.onTouchMovedConn = nil
        end
        if u16.onTouchEndedConn then
            u16.onTouchEndedConn:Disconnect()
            u16.onTouchEndedConn = nil
        end
    end
    local v18 = p17.AbsoluteSize.X
    local v19 = p17.AbsoluteSize.Y
    local v20 = math.min(v18, v19) <= 500
    u16.thumbstickSize = v20 and 70 or 120
    u16.screenPos = v20 and UDim2.new(0, u16.thumbstickSize / 2 - 10, 1, -u16.thumbstickSize - 20) or UDim2.new(0, u16.thumbstickSize / 2, 1, -u16.thumbstickSize * 1.75)
    u16.thumbstickFrame = Instance.new("Frame")
    u16.thumbstickFrame.Name = "ThumbstickFrame"
    u16.thumbstickFrame.Active = true
    u16.thumbstickFrame.Visible = false
    u16.thumbstickFrame.Size = UDim2.new(0, u16.thumbstickSize, 0, u16.thumbstickSize)
    u16.thumbstickFrame.Position = u16.screenPos
    u16.thumbstickFrame.BackgroundTransparency = 1
    local v21 = Instance.new("ImageLabel")
    v21.Name = "OuterImage"
    v21.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
    v21.ImageRectOffset = Vector2.new()
    v21.ImageRectSize = Vector2.new(220, 220)
    v21.BackgroundTransparency = 1
    v21.Size = UDim2.new(0, u16.thumbstickSize, 0, u16.thumbstickSize)
    v21.Position = UDim2.new(0, 0, 0, 0)
    v21.Parent = u16.thumbstickFrame
    u16.stickImage = Instance.new("ImageLabel")
    u16.stickImage.Name = "StickImage"
    u16.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
    u16.stickImage.ImageRectOffset = Vector2.new(220, 0)
    u16.stickImage.ImageRectSize = Vector2.new(111, 111)
    u16.stickImage.BackgroundTransparency = 1
    u16.stickImage.Size = UDim2.new(0, u16.thumbstickSize / 2, 0, u16.thumbstickSize / 2)
    u16.stickImage.Position = UDim2.new(0, u16.thumbstickSize / 2 - u16.thumbstickSize / 4, 0, u16.thumbstickSize / 2 - u16.thumbstickSize / 4)
    u16.stickImage.ZIndex = 2
    u16.stickImage.Parent = u16.thumbstickFrame
    local u22 = nil
    local function u32(p23) --[[Anonymous function at line 124]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u5
        --]]
        local v24 = p23 / (u16.thumbstickSize / 2)
        local v25 = v24.magnitude
        local v26
        if v25 < 0.05 then
            v26 = Vector3.new()
        else
            local v27
            if u5 then
                local v28 = v24.unit
                local v29 = (v25 - 0.05) / 0.95
                v27 = v28 * math.min(1, v29)
            else
                v27 = v24.unit * ((v25 - 0.05) / 0.95)
            end
            local v30 = v27.X
            local v31 = v27.Y
            v26 = Vector3.new(v30, 0, v31)
        end
        u16.moveVector = v26
    end
    local function u39(p33) --[[Anonymous function at line 146]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u16
        --]]
        local v34 = Vector2.new(p33.X - u22.X, p33.Y - u22.Y)
        local v35 = v34.magnitude
        local v36 = u16.thumbstickFrame.AbsoluteSize.X / 2
        if u16.isFollowStick and v36 < v35 then
            local v37 = v34.unit * v36
            u16.thumbstickFrame.Position = UDim2.new(0, p33.X - u16.thumbstickFrame.AbsoluteSize.X / 2 - v37.X, 0, p33.Y - u16.thumbstickFrame.AbsoluteSize.Y / 2 - v37.Y)
        else
            local v38 = math.min(v35, v36)
            v34 = v34.unit * v38
        end
        u16.stickImage.Position = UDim2.new(0, v34.X + u16.stickImage.AbsoluteSize.X / 2, 0, v34.Y + u16.stickImage.AbsoluteSize.Y / 2)
    end
    u16.thumbstickFrame.InputBegan:Connect(function(p40) --[[Anonymous function at line 163]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u22
        --]]
        if not u16.moveTouchObject and (p40.UserInputType == Enum.UserInputType.Touch and p40.UserInputState == Enum.UserInputState.Begin) then
            u16.moveTouchObject = p40
            u16.thumbstickFrame.Position = UDim2.new(0, p40.Position.X - u16.thumbstickFrame.Size.X.Offset / 2, 0, p40.Position.Y - u16.thumbstickFrame.Size.Y.Offset / 2)
            u22 = Vector2.new(u16.thumbstickFrame.AbsolutePosition.X + u16.thumbstickFrame.AbsoluteSize.X / 2, u16.thumbstickFrame.AbsolutePosition.Y + u16.thumbstickFrame.AbsoluteSize.Y / 2)
            Vector2.new(p40.Position.X - u22.X, p40.Position.Y - u22.Y)
        end
    end)
    u16.onTouchMovedConn = u2.TouchMoved:Connect(function(p41, _) --[[Anonymous function at line 178]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u22
            [3] = u32
            [4] = u39
        --]]
        if p41 == u16.moveTouchObject then
            u22 = Vector2.new(u16.thumbstickFrame.AbsolutePosition.X + u16.thumbstickFrame.AbsoluteSize.X / 2, u16.thumbstickFrame.AbsolutePosition.Y + u16.thumbstickFrame.AbsoluteSize.Y / 2)
            u32((Vector2.new(p41.Position.X - u22.X, p41.Position.Y - u22.Y)))
            u39(p41.Position)
        end
    end)
    u16.onTouchEndedConn = u2.TouchEnded:Connect(function(p42, _) --[[Anonymous function at line 188]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if p42 == u16.moveTouchObject then
            u16:OnInputEnded()
        end
    end)
    u1.MenuOpened:Connect(function() --[[Anonymous function at line 194]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if u16.moveTouchObject then
            u16:OnInputEnded()
        end
    end)
    u16.thumbstickFrame.Parent = p17
end
return u7