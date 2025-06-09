-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("VRService")
local u2 = game:GetService("UserInputService")
local u3 = game:GetService("RunService")
local v4 = game:GetService("Players")
local u5 = game:GetService("PathfindingService")
local u6 = game:GetService("ContextActionService")
local u7 = game:GetService("StarterGui")
local u8 = nil
local u9 = v4.LocalPlayer
local u10 = Instance.new("BindableEvent")
u10.Name = "MovementUpdate"
u10.Parent = script
coroutine.wrap(function() --[[Anonymous function at line 44]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v11 = script.Parent:WaitForChild("PathDisplay")
    if v11 then
        u8 = require(v11)
    end
end)()
local u12 = require(script.Parent:WaitForChild("BaseCharacterController"))
local u13 = setmetatable({}, u12)
u13.__index = u13
function u13.new(p14) --[[Anonymous function at line 57]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
    --]]
    local v15 = u12.new()
    local v16 = u13
    local v17 = setmetatable(v15, v16)
    v17.CONTROL_ACTION_PRIORITY = p14
    v17.navigationRequestedConn = nil
    v17.heartbeatConn = nil
    v17.currentDestination = nil
    v17.currentPath = nil
    v17.currentPoints = nil
    v17.currentPointIdx = 0
    v17.expectedTimeToNextPoint = 0
    v17.timeReachedLastPoint = tick()
    v17.moving = false
    v17.isJumpBound = false
    v17.moveLatch = false
    v17.userCFrameEnabledConn = nil
    return v17
end
function u13.SetLaserPointerMode(_, u18) --[[Anonymous function at line 82]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    pcall(function() --[[Anonymous function at line 83]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u18
        --]]
        u7:SetCore("VRLaserPointerMode", u18)
    end)
end
function u13.GetLocalHumanoid(_) --[[Anonymous function at line 88]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v19 = u9.Character
    if v19 then
        for _, v20 in pairs(v19:GetChildren()) do
            if v20:IsA("Humanoid") then
                return v20
            end
        end
        return nil
    end
end
function u13.HasBothHandControllers(_) --[[Anonymous function at line 102]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v21 = u1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
    if v21 then
        v21 = u1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
    end
    return v21
end
function u13.HasAnyHandControllers(_) --[[Anonymous function at line 106]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or u1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
end
function u13.IsMobileVR(_) --[[Anonymous function at line 110]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2.TouchEnabled
end
function u13.HasGamepad(_) --[[Anonymous function at line 114]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2.GamepadEnabled
end
function u13.ShouldUseNavigationLaser(p22) --[[Anonymous function at line 118]]
    if p22:IsMobileVR() then
        return true
    elseif p22:HasBothHandControllers() then
        return false
    else
        return p22:HasAnyHandControllers() and true or not p22:HasGamepad()
    end
end
function u13.StartFollowingPath(p23, p24) --[[Anonymous function at line 140]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    currentPath = p24
    currentPoints = currentPath:GetPointCoordinates()
    currentPointIdx = 1
    moving = true
    timeReachedLastPoint = tick()
    local v25 = p23:GetLocalHumanoid()
    if v25 and (v25.Torso and #currentPoints >= 1) then
        expectedTimeToNextPoint = (currentPoints[1] - v25.Torso.Position).magnitude / v25.WalkSpeed
    end
    u10:Fire("targetPoint", p23.currentDestination)
end
function u13.GoToPoint(p26, p27) --[[Anonymous function at line 157]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    currentPath = true
    currentPoints = { p27 }
    currentPointIdx = 1
    moving = true
    local v28 = p26:GetLocalHumanoid()
    local v29 = (v28.Torso.Position - p27).magnitude / v28.WalkSpeed
    timeReachedLastPoint = tick()
    expectedTimeToNextPoint = v29
    u10:Fire("targetPoint", p27)
end
function u13.StopFollowingPath(p30) --[[Anonymous function at line 173]]
    currentPath = nil
    currentPoints = nil
    currentPointIdx = 0
    moving = false
    p30.moveVector = Vector3.new(0, 0, 0)
end
function u13.TryComputePath(_, p31, p32) --[[Anonymous function at line 181]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v33 = nil
    local v34 = 0
    while not v33 and v34 < 5 do
        v33 = u5:ComputeSmoothPathAsync(p31, p32, 200)
        v34 = v34 + 1
        if v33.Status == Enum.PathStatus.ClosestNoPath or v33.Status == Enum.PathStatus.ClosestOutOfRange then
            return nil
        end
        if v33 and v33.Status == Enum.PathStatus.FailStartNotEmpty then
            p31 = p31 + (p32 - p31).Unit
            v33 = nil
        end
        if v33 and v33.Status == Enum.PathStatus.FailFinishNotEmpty then
            p32 = p32 + Vector3.new(0, 1, 0)
            v33 = nil
        end
    end
    return v33
end
function u13.OnNavigationRequest(p35, p36, _) --[[Anonymous function at line 208]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v37 = p36.Position
    local v38 = p35.currentDestination
    local v39 = v37.x
    local v40
    if v39 == v39 and v39 ~= (1 / 0) then
        v40 = v39 ~= (-1 / 0)
    else
        v40 = false
    end
    if v40 then
        local v41 = v37.y
        if v41 == v41 and v41 ~= (1 / 0) then
            v40 = v41 ~= (-1 / 0)
        else
            v40 = false
        end
        if v40 then
            local v42 = v37.z
            if v42 == v42 and v42 ~= (1 / 0) then
                v40 = v42 ~= (-1 / 0)
            else
                v40 = false
            end
        end
    end
    if v40 then
        p35.currentDestination = v37
        local v43 = p35:GetLocalHumanoid()
        if v43 and v43.Torso then
            local v44 = v43.Torso.Position
            if (p35.currentDestination - v44).magnitude < 12 then
                p35:GoToPoint(p35.currentDestination)
            elseif v38 and (p35.currentDestination - v38).magnitude <= 4 then
                if moving then
                    p35.currentPoints[#currentPoints] = p35.currentDestination
                    return
                end
                p35:GoToPoint(p35.currentDestination)
            else
                local v45 = p35:TryComputePath(v44, p35.currentDestination)
                if v45 then
                    p35:StartFollowingPath(v45)
                    if u8 then
                        u8.setCurrentPoints(p35.currentPoints)
                        u8.renderPath()
                        return
                    end
                else
                    p35:StopFollowingPath()
                    if u8 then
                        u8.clearRenderedPath()
                        return
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end
function u13.OnJumpAction(p46, _, p47, _) --[[Anonymous function at line 254]]
    if p47 == Enum.UserInputState.Begin then
        p46.isJumping = true
    end
    return Enum.ContextActionResult.Sink
end
function u13.BindJumpAction(u48, p49) --[[Anonymous function at line 260]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p49 then
        if not u48.isJumpBound then
            u48.isJumpBound = true
            u6:BindActionAtPriority("VRJumpAction", function() --[[Anonymous function at line 264]]
                --[[
                Upvalues:
                    [1] = u48
                --]]
                return u48:OnJumpAction()
            end, false, u48.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA)
            return
        end
    elseif u48.isJumpBound then
        u48.isJumpBound = false
        u6:UnbindAction("VRJumpAction")
    end
end
function u13.ControlCharacterGamepad(p50, _, p51, p52) --[[Anonymous function at line 275]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    if p52.KeyCode == Enum.KeyCode.Thumbstick1 then
        if p51 ~= Enum.UserInputState.Cancel then
            if p51 == Enum.UserInputState.End then
                p50.moveVector = Vector3.new(0, 0, 0)
                if p50:ShouldUseNavigationLaser() then
                    p50:BindJumpAction(false)
                    p50:SetLaserPointerMode("Navigation")
                end
                if p50.moveLatch then
                    p50.moveLatch = false
                    u10:Fire("offtrack")
                end
            else
                p50:StopFollowingPath()
                if u8 then
                    u8.clearRenderedPath()
                end
                if p50:ShouldUseNavigationLaser() then
                    p50:BindJumpAction(true)
                    p50:SetLaserPointerMode("Hidden")
                end
                if p52.Position.magnitude > 0.22 then
                    local v53 = p52.Position.X
                    local v54 = -p52.Position.Y
                    p50.moveVector = Vector3.new(v53, 0, v54)
                    if p50.moveVector.magnitude > 0 then
                        local v55 = p50.moveVector.unit
                        local v56 = p52.Position.magnitude
                        p50.moveVector = v55 * math.min(1, v56)
                    end
                    p50.moveLatch = true
                end
            end
            return Enum.ContextActionResult.Sink
        end
        p50.moveVector = Vector3.new(0, 0, 0)
    end
end
function u13.OnHeartbeat(p57, p58) --[[Anonymous function at line 318]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v59 = p57.moveVector
    local v60 = p57:GetLocalHumanoid()
    if v60 and v60.Torso then
        if p57.moving and p57.currentPoints then
            local v61 = v60.Torso.Position
            local v62 = (currentPoints[1] - v61) * Vector3.new(1, 0, 1)
            local v63 = v62.magnitude
            local v64 = v62 / v63
            if v63 < 1 then
                local v65 = currentPoints[1]
                local v66 = 0
                for v67, v68 in pairs(currentPoints) do
                    if v67 ~= 1 then
                        v66 = v66 + (v68 - v65).magnitude / v60.WalkSpeed
                        v65 = v68
                    end
                end
                table.remove(currentPoints, 1)
                currentPointIdx = currentPointIdx + 1
                if #currentPoints == 0 then
                    p57:StopFollowingPath()
                    if u8 then
                        u8.clearRenderedPath()
                    end
                    return
                end
                if u8 then
                    u8.setCurrentPoints(currentPoints)
                    u8.renderPath()
                end
                expectedTimeToNextPoint = (currentPoints[1] - v61).magnitude / v60.WalkSpeed
                timeReachedLastPoint = tick()
            else
                local v69 = { game.Players.LocalPlayer.Character, workspace.CurrentCamera }
                local v70 = Ray.new(v61 - Vector3.new(0, 1, 0), v64 * 3)
                local v71, v72, _ = workspace:FindPartOnRayWithIgnoreList(v70, v69)
                if v71 then
                    local v73 = Ray.new(v72 + v64 * 0.5 + Vector3.new(0, 100, 0), Vector3.new(-0, -100, -0))
                    local _, v74, _ = workspace:FindPartOnRayWithIgnoreList(v73, v69)
                    local v75 = v74.Y - v61.Y
                    if v75 < 6 and v75 > -2 then
                        v60.Jump = true
                    end
                end
                if tick() - timeReachedLastPoint > expectedTimeToNextPoint + 2 then
                    p57:StopFollowingPath()
                    if u8 then
                        u8.clearRenderedPath()
                    end
                    u10:Fire("offtrack")
                end
                v59 = p57.moveVector:Lerp(v64, p58 * 10)
            end
        end
        local v76 = v59.x
        local v77
        if v76 == v76 and v76 ~= (1 / 0) then
            v77 = v76 ~= (-1 / 0)
        else
            v77 = false
        end
        if v77 then
            local v78 = v59.y
            if v78 == v78 and v78 ~= (1 / 0) then
                v77 = v78 ~= (-1 / 0)
            else
                v77 = false
            end
            if v77 then
                local v79 = v59.z
                if v79 == v79 and v79 ~= (1 / 0) then
                    v77 = v79 ~= (-1 / 0)
                else
                    v77 = false
                end
            end
        end
        if v77 then
            p57.moveVector = v59
        end
    end
end
function u13.OnUserCFrameEnabled(p80) --[[Anonymous function at line 402]]
    if p80:ShouldUseNavigationLaser() then
        p80:BindJumpAction(false)
        p80:SetLaserPointerMode("Navigation")
    else
        p80:BindJumpAction(true)
        p80:SetLaserPointerMode("Hidden")
    end
end
function u13.Enable(u81, p82) --[[Anonymous function at line 412]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u6
    --]]
    u81.moveVector = Vector3.new(0, 0, 0)
    u81.isJumping = false
    if p82 then
        u81.navigationRequestedConn = u1.NavigationRequested:Connect(function(p83, p84) --[[Anonymous function at line 418]]
            --[[
            Upvalues:
                [1] = u81
            --]]
            u81:OnNavigationRequest(p83, p84)
        end)
        u81.heartbeatConn = u3.Heartbeat:Connect(function(p85) --[[Anonymous function at line 419]]
            --[[
            Upvalues:
                [1] = u81
            --]]
            u81:OnHeartbeat(p85)
        end)
        u6:BindAction("MoveThumbstick", function(p86, p87, p88) --[[Anonymous function at line 421]]
            --[[
            Upvalues:
                [1] = u81
            --]]
            return u81:ControlCharacterGamepad(p86, p87, p88)
        end, false, u81.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1)
        u6:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
        u81.userCFrameEnabledConn = u1.UserCFrameEnabled:Connect(function() --[[Anonymous function at line 425]]
            --[[
            Upvalues:
                [1] = u81
            --]]
            u81:OnUserCFrameEnabled()
        end)
        u81:OnUserCFrameEnabled()
        u1:SetTouchpadMode(Enum.VRTouchpad.Left, Enum.VRTouchpadMode.VirtualThumbstick)
        u1:SetTouchpadMode(Enum.VRTouchpad.Right, Enum.VRTouchpadMode.ABXY)
        u81.enabled = true
    else
        u81:StopFollowingPath()
        u6:UnbindAction("MoveThumbstick")
        u6:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
        u81:BindJumpAction(false)
        u81:SetLaserPointerMode("Disabled")
        if u81.navigationRequestedConn then
            u81.navigationRequestedConn:Disconnect()
            u81.navigationRequestedConn = nil
        end
        if u81.heartbeatConn then
            u81.heartbeatConn:Disconnect()
            u81.heartbeatConn = nil
        end
        if u81.userCFrameEnabledConn then
            u81.userCFrameEnabledConn:Disconnect()
            u81.userCFrameEnabledConn = nil
        end
        u81.enabled = false
    end
end
return u13