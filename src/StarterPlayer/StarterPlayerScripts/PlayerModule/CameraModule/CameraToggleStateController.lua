-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

game:GetService("Players")
game:GetService("UserInputService")
UserSettings():GetService("UserGameSettings")
local u1 = require(script.Parent:WaitForChild("CameraInput"))
local u2 = require(script.Parent:WaitForChild("CameraUI"))
local u3 = require(script.Parent:WaitForChild("CameraUtils"))
local u4 = false
local u5 = tick()
local u6 = false
local u7 = false
local u8 = false
u2.setCameraModeToastEnabled(false)
return function(p9) --[[Anonymous function at line 20]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
        [3] = u6
        [4] = u5
        [5] = u2
        [6] = u8
        [7] = u7
        [8] = u3
    --]]
    local v10 = u1.getTogglePan()
    if p9 and v10 ~= u4 then
        u6 = true
    end
    if u4 ~= v10 or tick() - u5 > 3 then
        local v11
        if v10 then
            v11 = tick() - u5 < 3
        else
            v11 = v10
        end
        u2.setCameraModeToastOpen(v11)
        if v10 then
            u6 = false
        end
        u5 = tick()
        u4 = v10
    end
    if p9 ~= u8 then
        if p9 then
            u7 = u1.getTogglePan()
            u1.setTogglePan(true)
        elseif not u6 then
            u1.setTogglePan(u7)
        end
    end
    if p9 then
        if u1.getTogglePan() then
            u3.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png")
            u3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
            u3.setRotationTypeOverride(Enum.RotationType.CameraRelative)
        else
            u3.restoreMouseIcon()
            u3.restoreMouseBehavior()
            u3.setRotationTypeOverride(Enum.RotationType.CameraRelative)
        end
    elseif u1.getTogglePan() then
        u3.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png")
        u3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
        u3.setRotationTypeOverride(Enum.RotationType.MovementRelative)
    elseif u1.getHoldPan() then
        u3.restoreMouseIcon()
        u3.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition)
        u3.setRotationTypeOverride(Enum.RotationType.MovementRelative)
    else
        u3.restoreMouseIcon()
        u3.restoreMouseBehavior()
        u3.restoreRotationType()
    end
    u8 = p9
end