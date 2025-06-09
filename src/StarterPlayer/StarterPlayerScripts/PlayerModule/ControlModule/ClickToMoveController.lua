-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1, v2 = pcall(function() --[[Anonymous function at line 10]]
    return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding")
end)
local u3 = v1 and v2
local v4, v5 = pcall(function() --[[Anonymous function at line 14]]
    return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2")
end)
local u6 = v4 and v5
local u7 = game:GetService("UserInputService")
local u8 = game:GetService("PathfindingService")
local u9 = game:GetService("Players")
game:GetService("Debris")
local u10 = game:GetService("StarterGui")
local u11 = game:GetService("Workspace")
local u12 = game:GetService("CollectionService")
local u13 = game:GetService("GuiService")
local u14 = true
local u15 = true
local u16 = false
local u17 = 1
local u18 = 8
local u19 = {
    [Enum.KeyCode.W] = true,
    [Enum.KeyCode.A] = true,
    [Enum.KeyCode.S] = true,
    [Enum.KeyCode.D] = true,
    [Enum.KeyCode.Up] = true,
    [Enum.KeyCode.Down] = true
}
local u20 = u9.LocalPlayer
local u21 = require(script.Parent:WaitForChild("ClickToMoveDisplay"))
local u22 = {}
local function u25(p23) --[[Anonymous function at line 56]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    if p23 then
        local v24 = p23:FindFirstChildOfClass("Humanoid")
        if v24 then
            return p23, v24
        else
            return u25(p23.Parent)
        end
    else
        return
    end
end
u22.FindCharacterAncestor = u25
local function u36(p26, p27, p28) --[[Anonymous function at line 68]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u25
        [3] = u36
    --]]
    local v29 = p28 or {}
    local v30, v31, v32, v33 = u11:FindPartOnRayWithIgnoreList(p26, v29)
    if not v30 then
        return nil, nil
    end
    if p27 and v30.CanCollide == false then
        local v34 = not v30 or v30:FindFirstChildOfClass("Humanoid")
        if not v34 then
            local v35
            v35, v34 = u25(v30.Parent)
        end
        if v34 == nil then
            table.insert(v29, v30)
            return u36(p26, p27, v29)
        end
    end
    return v30, v31, v32, v33
end
u22.Raycast = u36
local u37 = {}
local u38 = nil
local u39 = nil
local u40 = nil
local u41 = nil
local function u52(p42) --[[Anonymous function at line 117]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u40
        [3] = u41
        [4] = u38
        [5] = u20
        [6] = u12
    --]]
    if p42 ~= u39 then
        if u40 then
            u40:Disconnect()
            u40 = nil
        end
        if u41 then
            u41:Disconnect()
            u41 = nil
        end
        u39 = p42
        local v43 = {}
        local v44 = u20
        if v44 then
            v44 = u20.Character
        end
        __set_list(v43, 1, {v44})
        u38 = v43
        if u39 ~= nil then
            local v45 = u12:GetTagged(u39)
            for _, v46 in ipairs(v45) do
                local v47 = u38
                table.insert(v47, v46)
            end
            u40 = u12:GetInstanceAddedSignal(u39):Connect(function(p48) --[[Anonymous function at line 137]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                local v49 = u38
                table.insert(v49, p48)
            end)
            u41 = u12:GetInstanceRemovedSignal(u39):Connect(function(p50) --[[Anonymous function at line 141]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                for v51 = 1, #u38 do
                    if u38[v51] == p50 then
                        u38[v51] = u38[#u38]
                        table.remove(u38)
                        return
                    end
                end
            end)
        end
    end
end
local function u117(p53) --[[Anonymous function at line 169]]
    if p53 == nil or p53.PrimaryPart == nil then
        return
    else
        assert(p53, "")
        local v54 = p53.PrimaryPart
        assert(v54, "")
        local v55 = p53.PrimaryPart.CFrame:Inverse()
        local v56 = Vector3.new(inf, inf, inf)
        local v57 = Vector3.new(-inf, -inf, -inf)
        for _, v58 in pairs(p53:GetDescendants()) do
            if v58:IsA("BasePart") and v58.CanCollide then
                local v59 = v55 * v58.CFrame
                local v60 = v58.Size.X / 2
                local v61 = v58.Size.Y / 2
                local v62 = v58.Size.Z / 2
                local v63 = Vector3.new(v60, v61, v62)
                local v64 = {}
                local v65 = v63.X
                local v66 = v63.Y
                local v67 = v63.Z
                local v68 = Vector3.new(v65, v66, v67)
                local v69 = v63.X
                local v70 = v63.Y
                local v71 = -v63.Z
                local v72 = Vector3.new(v69, v70, v71)
                local v73 = v63.X
                local v74 = -v63.Y
                local v75 = v63.Z
                local v76 = Vector3.new(v73, v74, v75)
                local v77 = v63.X
                local v78 = -v63.Y
                local v79 = -v63.Z
                local v80 = Vector3.new(v77, v78, v79)
                local v81 = -v63.X
                local v82 = v63.Y
                local v83 = v63.Z
                local v84 = Vector3.new(v81, v82, v83)
                local v85 = -v63.X
                local v86 = v63.Y
                local v87 = -v63.Z
                local v88 = Vector3.new(v85, v86, v87)
                local v89 = -v63.X
                local v90 = -v63.Y
                local v91 = v63.Z
                local v92 = Vector3.new(v89, v90, v91)
                local v93 = -v63.X
                local v94 = -v63.Y
                local v95 = -v63.Z
                __set_list(v64, 1, {v68, v72, v76, v80, v84, v88, v92, (Vector3.new(v93, v94, v95))})
                for _, v96 in ipairs(v64) do
                    local v97 = v59 * v96
                    local v98 = v56.X
                    local v99 = v97.X
                    local v100 = math.min(v98, v99)
                    local v101 = v56.Y
                    local v102 = v97.Y
                    local v103 = math.min(v101, v102)
                    local v104 = v56.Z
                    local v105 = v97.Z
                    local v106 = math.min(v104, v105)
                    v56 = Vector3.new(v100, v103, v106)
                    local v107 = v57.X
                    local v108 = v97.X
                    local v109 = math.max(v107, v108)
                    local v110 = v57.Y
                    local v111 = v97.Y
                    local v112 = math.max(v110, v111)
                    local v113 = v57.Z
                    local v114 = v97.Z
                    local v115 = math.max(v113, v114)
                    v57 = Vector3.new(v109, v112, v115)
                end
            end
        end
        local v116 = v57 - v56
        if v116.X < 0 or (v116.Y < 0 or v116.Z < 0) then
            return nil
        else
            return v116
        end
    end
end
local function u184(p118, p119, p120) --[[Anonymous function at line 204]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u20
        [3] = u37
        [4] = u17
        [5] = u3
        [6] = u117
        [7] = u6
        [8] = u8
        [9] = u14
        [10] = u21
        [11] = u18
        [12] = u11
        [13] = u38
    --]]
    local u121 = {}
    local v122
    if p120 == nil then
        v122 = u16
        p120 = true
    else
        v122 = p120
    end
    u121.Cancelled = false
    u121.Started = false
    u121.Finished = Instance.new("BindableEvent")
    u121.PathFailed = Instance.new("BindableEvent")
    u121.PathComputing = false
    u121.PathComputed = false
    u121.OriginalTargetPoint = p118
    u121.TargetPoint = p118
    u121.TargetSurfaceNormal = p119
    u121.DiedConn = nil
    u121.SeatedConn = nil
    u121.BlockedConn = nil
    u121.TeleportedConn = nil
    u121.CurrentPoint = 0
    u121.HumanoidOffsetFromPath = Vector3.new(0, 0, 0)
    u121.CurrentWaypointPosition = nil
    u121.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
    u121.CurrentWaypointPlaneDistance = 0
    u121.CurrentWaypointNeedsJump = false
    u121.CurrentHumanoidPosition = Vector3.new(0, 0, 0)
    u121.CurrentHumanoidVelocity = 0
    u121.NextActionMoveDirection = Vector3.new(0, 0, 0)
    u121.NextActionJump = false
    u121.Timeout = 0
    local v123 = u20
    local v124
    if v123 then
        v124 = v123.Character
    else
        v124 = v123
    end
    local v125
    if v124 then
        v125 = u37[v123]
        if not v125 or v125.Parent ~= v124 then
            u37[v123] = nil
            v125 = v124:FindFirstChildOfClass("Humanoid")
            if v125 then
                u37[v123] = v125
            end
        end
    else
        v125 = nil
    end
    u121.Humanoid = v125
    u121.OriginPoint = nil
    u121.AgentCanFollowPath = false
    u121.DirectPath = false
    u121.DirectPathRiseFirst = false
    u121.stopTraverseFunc = nil
    u121.setPointFunc = nil
    u121.pointList = nil
    local v126 = u121.Humanoid
    if v126 then
        v126 = u121.Humanoid.RootPart
    end
    if v126 then
        u121.OriginPoint = v126.CFrame.Position
        local v127 = 2
        local v128 = 5
        local v129 = true
        local v130 = u121.Humanoid.SeatPart
        if v130 and v130:IsA("VehicleSeat") then
            local v131 = v130:FindFirstAncestorOfClass("Model")
            if v131 then
                local v132 = v131.PrimaryPart
                v131.PrimaryPart = v130
                if p120 then
                    local v133 = v131:GetExtentsSize()
                    local v134 = u17 * 0.5
                    local v135 = v133.X * v133.X + v133.Z * v133.Z
                    v127 = v134 * math.sqrt(v135)
                    v128 = u17 * v133.Y
                    u121.AgentCanFollowPath = true
                    u121.DirectPath = p120
                    v129 = false
                end
                v131.PrimaryPart = v132
            end
        else
            local v136 = nil
            if u3 then
                local v137 = u20
                if v137 then
                    v137 = u20.Character
                end
                if v137 ~= nil then
                    v136 = u117(v137)
                end
            end
            if v136 == nil then
                local v138 = u20
                if v138 then
                    v138 = u20.Character
                end
                v136 = v138:GetExtentsSize()
            end
            assert(v136, "")
            local v139 = u17 * 0.5
            local v140 = v136.X * v136.X + v136.Z * v136.Z
            v127 = v139 * math.sqrt(v140)
            v128 = u17 * v136.Y
            v129 = u121.Humanoid.JumpPower > 0
            u121.AgentCanFollowPath = true
            u121.DirectPath = v122
            u121.DirectPathRiseFirst = u121.Humanoid.Sit
        end
        if u6 then
            u121.pathResult = u8:CreatePath({
                ["AgentRadius"] = v127,
                ["AgentHeight"] = v128,
                ["AgentCanJump"] = v129,
                ["AgentCanClimb"] = true
            })
        else
            u121.pathResult = u8:CreatePath({
                ["AgentRadius"] = v127,
                ["AgentHeight"] = v128,
                ["AgentCanJump"] = v129
            })
        end
    end
    function u121.Cleanup(_) --[[Anonymous function at line 322]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        if u121.stopTraverseFunc then
            u121.stopTraverseFunc()
            u121.stopTraverseFunc = nil
        end
        if u121.BlockedConn then
            u121.BlockedConn:Disconnect()
            u121.BlockedConn = nil
        end
        if u121.DiedConn then
            u121.DiedConn:Disconnect()
            u121.DiedConn = nil
        end
        if u121.SeatedConn then
            u121.SeatedConn:Disconnect()
            u121.SeatedConn = nil
        end
        if u121.TeleportedConn then
            u121.TeleportedConn:Disconnect()
            u121.TeleportedConn = nil
        end
        u121.Started = false
    end
    function u121.Cancel(_) --[[Anonymous function at line 351]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        u121.Cancelled = true
        u121:Cleanup()
    end
    function u121.IsActive(_) --[[Anonymous function at line 356]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        local v141 = u121.AgentCanFollowPath and u121.Started
        if v141 then
            v141 = not u121.Cancelled
        end
        return v141
    end
    function u121.OnPathInterrupted(_) --[[Anonymous function at line 360]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        u121.Cancelled = true
        u121:OnPointReached(false)
    end
    function u121.ComputePath(_) --[[Anonymous function at line 366]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        if u121.OriginPoint then
            if u121.PathComputed or u121.PathComputing then
                return
            end
            u121.PathComputing = true
            if u121.AgentCanFollowPath then
                if u121.DirectPath then
                    u121.pointList = { PathWaypoint.new(u121.OriginPoint, Enum.PathWaypointAction.Walk), PathWaypoint.new(u121.TargetPoint, u121.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk) }
                    u121.PathComputed = true
                else
                    u121.pathResult:ComputeAsync(u121.OriginPoint, u121.TargetPoint)
                    u121.pointList = u121.pathResult:GetWaypoints()
                    u121.BlockedConn = u121.pathResult.Blocked:Connect(function(p142) --[[Anonymous function at line 380]]
                        --[[
                        Upvalues:
                            [1] = u121
                        --]]
                        u121:OnPathBlocked(p142)
                    end)
                    u121.PathComputed = u121.pathResult.Status == Enum.PathStatus.Success
                end
            end
            u121.PathComputing = false
        end
    end
    function u121.IsValidPath(_) --[[Anonymous function at line 388]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        u121:ComputePath()
        local v143 = u121.PathComputed
        if v143 then
            v143 = u121.AgentCanFollowPath
        end
        return v143
    end
    u121.Recomputing = false
    function u121.OnPathBlocked(_, p144) --[[Anonymous function at line 394]]
        --[[
        Upvalues:
            [1] = u121
            [2] = u14
            [3] = u21
        --]]
        if u121.CurrentPoint <= p144 and not u121.Recomputing then
            u121.Recomputing = true
            if u121.stopTraverseFunc then
                u121.stopTraverseFunc()
                u121.stopTraverseFunc = nil
            end
            u121.OriginPoint = u121.Humanoid.RootPart.CFrame.p
            u121.pathResult:ComputeAsync(u121.OriginPoint, u121.TargetPoint)
            u121.pointList = u121.pathResult:GetWaypoints()
            if #u121.pointList > 0 then
                u121.HumanoidOffsetFromPath = u121.pointList[1].Position - u121.OriginPoint
            end
            u121.PathComputed = u121.pathResult.Status == Enum.PathStatus.Success
            if u14 then
                local v145 = u121
                local v146 = u121
                local v147, v148 = u21.CreatePathDisplay(u121.pointList)
                v145.stopTraverseFunc = v147
                v146.setPointFunc = v148
            end
            if u121.PathComputed then
                u121.CurrentPoint = 1
                u121:OnPointReached(true)
            else
                u121.PathFailed:Fire()
                u121:Cleanup()
            end
            u121.Recomputing = false
        end
    end
    function u121.OnRenderStepped(_, p149) --[[Anonymous function at line 430]]
        --[[
        Upvalues:
            [1] = u121
            [2] = u18
        --]]
        if u121.Started and not u121.Cancelled then
            u121.Timeout = u121.Timeout + p149
            if u18 < u121.Timeout then
                u121:OnPointReached(false)
                return
            end
            u121.CurrentHumanoidPosition = u121.Humanoid.RootPart.Position + u121.HumanoidOffsetFromPath
            u121.CurrentHumanoidVelocity = u121.Humanoid.RootPart.Velocity
            while u121.Started and u121:IsCurrentWaypointReached() do
                u121:OnPointReached(true)
            end
            if u121.Started then
                u121.NextActionMoveDirection = u121.CurrentWaypointPosition - u121.CurrentHumanoidPosition
                if u121.NextActionMoveDirection.Magnitude > 1e-6 then
                    u121.NextActionMoveDirection = u121.NextActionMoveDirection.Unit
                else
                    u121.NextActionMoveDirection = Vector3.new(0, 0, 0)
                end
                if u121.CurrentWaypointNeedsJump then
                    u121.NextActionJump = true
                    u121.CurrentWaypointNeedsJump = false
                    return
                end
                u121.NextActionJump = false
            end
        end
    end
    function u121.IsCurrentWaypointReached(_) --[[Anonymous function at line 468]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        local v150
        if u121.CurrentWaypointPlaneNormal == Vector3.new(0, 0, 0) then
            v150 = true
        else
            local v151 = u121.CurrentWaypointPlaneNormal:Dot(u121.CurrentHumanoidPosition) - u121.CurrentWaypointPlaneDistance
            local v152 = 0.0625 * -u121.CurrentWaypointPlaneNormal:Dot(u121.CurrentHumanoidVelocity)
            v150 = v151 < math.max(1, v152)
        end
        if v150 then
            u121.CurrentWaypointPosition = nil
            u121.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
            u121.CurrentWaypointPlaneDistance = 0
        end
        return v150
    end
    function u121.OnPointReached(_, p153) --[[Anonymous function at line 494]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        if p153 and not u121.Cancelled then
            if u121.setPointFunc then
                u121.setPointFunc(u121.CurrentPoint)
            end
            local v154 = u121.CurrentPoint + 1
            if #u121.pointList < v154 then
                if u121.stopTraverseFunc then
                    u121.stopTraverseFunc()
                end
                u121.Finished:Fire()
                u121:Cleanup()
            else
                local v155 = u121.pointList[u121.CurrentPoint]
                local v156 = u121.pointList[v154]
                local v157 = u121.Humanoid:GetState()
                if (v157 == Enum.HumanoidStateType.FallingDown or v157 == Enum.HumanoidStateType.Freefall) and true or v157 == Enum.HumanoidStateType.Jumping then
                    local v158 = v156.Action == Enum.PathWaypointAction.Jump
                    if not v158 and u121.CurrentPoint > 1 then
                        local v159 = u121.pointList[u121.CurrentPoint - 1]
                        local v160 = v155.Position - v159.Position
                        local v161 = v156.Position - v155.Position
                        v158 = Vector2.new(v160.x, v160.z).Unit:Dot(Vector2.new(v161.x, v161.z).Unit) < 0.996
                    end
                    if v158 then
                        u121.Humanoid.FreeFalling:Wait()
                        wait(0.1)
                    end
                end
                u121:MoveToNextWayPoint(v155, v156, v154)
            end
        else
            u121.PathFailed:Fire()
            u121:Cleanup()
            return
        end
    end
    function u121.MoveToNextWayPoint(_, p162, p163, p164) --[[Anonymous function at line 557]]
        --[[
        Upvalues:
            [1] = u121
            [2] = u6
        --]]
        u121.CurrentWaypointPlaneNormal = p162.Position - p163.Position
        if not u6 or p163.Label ~= "Climb" then
            local v165 = u121
            local v166 = u121.CurrentWaypointPlaneNormal.X
            local v167 = u121.CurrentWaypointPlaneNormal.Z
            v165.CurrentWaypointPlaneNormal = Vector3.new(v166, 0, v167)
        end
        if u121.CurrentWaypointPlaneNormal.Magnitude > 1e-6 then
            u121.CurrentWaypointPlaneNormal = u121.CurrentWaypointPlaneNormal.Unit
            u121.CurrentWaypointPlaneDistance = u121.CurrentWaypointPlaneNormal:Dot(p163.Position)
        else
            u121.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0)
            u121.CurrentWaypointPlaneDistance = 0
        end
        u121.CurrentWaypointNeedsJump = p163.Action == Enum.PathWaypointAction.Jump
        u121.CurrentWaypointPosition = p163.Position
        u121.CurrentPoint = p164
        u121.Timeout = 0
    end
    function u121.Start(_, p168) --[[Anonymous function at line 589]]
        --[[
        Upvalues:
            [1] = u121
            [2] = u21
            [3] = u14
        --]]
        if u121.AgentCanFollowPath then
            if u121.Started then
                return
            else
                u121.Started = true
                u21.CancelFailureAnimation()
                if u14 and (p168 == nil or p168) then
                    local v169 = u121
                    local v170 = u121
                    local v171, v172 = u21.CreatePathDisplay(u121.pointList, u121.OriginalTargetPoint)
                    v169.stopTraverseFunc = v171
                    v170.setPointFunc = v172
                end
                if #u121.pointList > 0 then
                    local v173 = u121
                    local v174 = u121.pointList[1].Position.Y - u121.OriginPoint.Y
                    v173.HumanoidOffsetFromPath = Vector3.new(0, v174, 0)
                    u121.CurrentHumanoidPosition = u121.Humanoid.RootPart.Position + u121.HumanoidOffsetFromPath
                    u121.CurrentHumanoidVelocity = u121.Humanoid.RootPart.Velocity
                    u121.SeatedConn = u121.Humanoid.Seated:Connect(function(_, _) --[[Anonymous function at line 616]]
                        --[[
                        Upvalues:
                            [1] = u121
                        --]]
                        u121:OnPathInterrupted()
                    end)
                    u121.DiedConn = u121.Humanoid.Died:Connect(function() --[[Anonymous function at line 617]]
                        --[[
                        Upvalues:
                            [1] = u121
                        --]]
                        u121:OnPathInterrupted()
                    end)
                    u121.TeleportedConn = u121.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function() --[[Anonymous function at line 618]]
                        --[[
                        Upvalues:
                            [1] = u121
                        --]]
                        u121:OnPathInterrupted()
                    end)
                    u121.CurrentPoint = 1
                    u121:OnPointReached(true)
                else
                    u121.PathFailed:Fire()
                    if u121.stopTraverseFunc then
                        u121.stopTraverseFunc()
                    end
                end
            end
        else
            u121.PathFailed:Fire()
            return
        end
    end
    local v175 = u121.TargetPoint + u121.TargetSurfaceNormal * 1.5
    local v176 = Ray.new(v175, Vector3.new(0, -50, 0))
    local v177 = u11
    local v178
    if u38 then
        v178 = u38
    else
        u38 = {}
        local v179 = u38
        assert(v179, "")
        local v180 = u38
        local v181 = u20
        if v181 then
            v181 = u20.Character
        end
        table.insert(v180, v181)
        v178 = u38
    end
    local v182, v183 = v177:FindPartOnRayWithIgnoreList(v176, v178)
    if v182 then
        u121.TargetPoint = v183
    end
    u121:ComputePath()
    return u121
end
local function u187(p185) --[[Anonymous function at line 650]]
    if p185 ~= nil then
        for _, v186 in pairs(p185:GetChildren()) do
            if v186:IsA("Tool") then
                return v186
            end
        end
    end
end
local u188 = nil
local u189 = nil
local u190 = nil
local function u199(p191, u192, u193, u194, u195) --[[Anonymous function at line 683]]
    --[[
    Upvalues:
        [1] = u188
        [2] = u189
        [3] = u190
        [4] = u187
        [5] = u15
        [6] = u21
    --]]
    if u188 then
        if u188 then
            u188:Cancel()
            u188 = nil
        end
        if u189 then
            u189:Disconnect()
            u189 = nil
        end
        if u190 then
            u190:Disconnect()
            u190 = nil
        end
    end
    u188 = p191
    p191:Start(u195)
    u189 = p191.Finished.Event:Connect(function() --[[Anonymous function at line 690]]
        --[[
        Upvalues:
            [1] = u188
            [2] = u189
            [3] = u190
            [4] = u193
            [5] = u187
            [6] = u194
        --]]
        if u188 then
            u188:Cancel()
            u188 = nil
        end
        if u189 then
            u189:Disconnect()
            u189 = nil
        end
        if u190 then
            u190:Disconnect()
            u190 = nil
        end
        local v196 = u193 and u187(u194)
        if v196 then
            v196:Activate()
        end
    end)
    u190 = p191.PathFailed.Event:Connect(function() --[[Anonymous function at line 699]]
        --[[
        Upvalues:
            [1] = u188
            [2] = u189
            [3] = u190
            [4] = u195
            [5] = u15
            [6] = u21
            [7] = u192
        --]]
        if u188 then
            u188:Cancel()
            u188 = nil
        end
        if u189 then
            u189:Disconnect()
            u189 = nil
        end
        if u190 then
            u190:Disconnect()
            u190 = nil
        end
        if u195 == nil or u195 then
            local v197 = u15
            if v197 then
                local v198 = u188
                if v198 then
                    v198 = u188:IsActive()
                end
                v197 = not v198
            end
            if v197 then
                u21.PlayFailureAnimation()
            end
            u21.DisplayFailureWaypoint(u192)
        end
    end)
end
function OnTap(p200, p201, p202)
    --[[
    Upvalues:
        [1] = u11
        [2] = u20
        [3] = u37
        [4] = u22
        [5] = u38
        [6] = u10
        [7] = u9
        [8] = u188
        [9] = u189
        [10] = u190
        [11] = u184
        [12] = u199
        [13] = u15
        [14] = u21
        [15] = u187
    --]]
    local v203 = u11.CurrentCamera
    local v204 = u20.Character
    local v205 = u20
    local v206
    if v205 then
        v206 = v205.Character
    else
        v206 = v205
    end
    local v207
    if v206 then
        v207 = u37[v205]
        if not v207 or v207.Parent ~= v206 then
            u37[v205] = nil
            v207 = v206:FindFirstChildOfClass("Humanoid")
            if v207 then
                u37[v205] = v207
            end
        end
    else
        v207 = nil
    end
    local v208
    if v207 == nil then
        v208 = false
    else
        v208 = v207.Health > 0
    end
    if v208 then
        if #p200 == 1 or p201 then
            if v203 then
                local v209 = v203:ScreenPointToRay(p200[1].X, p200[1].Y)
                local v210 = Ray.new(v209.Origin, v209.Direction * 1000)
                local v211 = u20
                local v212
                if v211 then
                    v212 = v211.Character
                else
                    v212 = v211
                end
                if v212 then
                    local v213 = u37[v211]
                    if not v213 or v213.Parent ~= v212 then
                        u37[v211] = nil
                        local v214 = v212:FindFirstChildOfClass("Humanoid")
                        if v214 then
                            u37[v211] = v214
                        end
                    end
                end
                local v215 = u22.Raycast
                local v216 = true
                local v217
                if u38 then
                    v217 = u38
                else
                    u38 = {}
                    local v218 = u38
                    assert(v218, "")
                    local v219 = u38
                    local v220 = u20
                    if v220 then
                        v220 = u20.Character
                    end
                    table.insert(v219, v220)
                    v217 = u38
                end
                local v221, v222, v223 = v215(v210, v216, v217)
                local v224, v225 = u22.FindCharacterAncestor(v221)
                if p202 and (v225 and (u10:GetCore("AvatarContextMenuEnabled") and u9:GetPlayerFromCharacter(v225.Parent))) then
                    if u188 then
                        u188:Cancel()
                        u188 = nil
                    end
                    if u189 then
                        u189:Disconnect()
                        u189 = nil
                    end
                    if u190 then
                        u190:Disconnect()
                        u190 = nil
                    end
                    return
                end
                if p201 then
                    v224 = nil
                else
                    p201 = v222
                end
                if p201 and v204 then
                    if u188 then
                        u188:Cancel()
                        u188 = nil
                    end
                    if u189 then
                        u189:Disconnect()
                        u189 = nil
                    end
                    if u190 then
                        u190:Disconnect()
                        u190 = nil
                    end
                    local v226 = u184(p201, v223)
                    if v226:IsValidPath() then
                        u199(v226, p201, v224, v204)
                    else
                        v226:Cleanup()
                        if u188 and u188:IsActive() then
                            u188:Cancel()
                        end
                        if u15 then
                            u21.PlayFailureAnimation()
                        end
                        u21.DisplayFailureWaypoint(p201)
                    end
                end
            end
        else
            local v227 = #p200 >= 2 and (v203 and u187(v204))
            if v227 then
                v227:Activate()
            end
        end
    end
end
local u228 = require(script.Parent:WaitForChild("Keyboard"))
local u229 = setmetatable({}, u228)
u229.__index = u229
function u229.new(p230) --[[Anonymous function at line 785]]
    --[[
    Upvalues:
        [1] = u228
        [2] = u229
    --]]
    local v231 = u228.new(p230)
    local v232 = u229
    local v233 = setmetatable(v231, v232)
    v233.fingerTouches = {}
    v233.numUnsunkTouches = 0
    v233.mouse1Down = tick()
    v233.mouse1DownPos = Vector2.new()
    v233.mouse2DownTime = tick()
    v233.mouse2DownPos = Vector2.new()
    v233.mouse2UpTime = tick()
    v233.keyboardMoveVector = Vector3.new(0, 0, 0)
    v233.tapConn = nil
    v233.inputBeganConn = nil
    v233.inputChangedConn = nil
    v233.inputEndedConn = nil
    v233.humanoidDiedConn = nil
    v233.characterChildAddedConn = nil
    v233.onCharacterAddedConn = nil
    v233.characterChildRemovedConn = nil
    v233.renderSteppedConn = nil
    v233.menuOpenedConnection = nil
    v233.running = false
    v233.wasdEnabled = false
    return v233
end
function u229.DisconnectEvents(p234) --[[Anonymous function at line 817]]
    local v235 = p234.tapConn
    if v235 then
        v235:Disconnect()
    end
    local v236 = p234.inputBeganConn
    if v236 then
        v236:Disconnect()
    end
    local v237 = p234.inputChangedConn
    if v237 then
        v237:Disconnect()
    end
    local v238 = p234.inputEndedConn
    if v238 then
        v238:Disconnect()
    end
    local v239 = p234.humanoidDiedConn
    if v239 then
        v239:Disconnect()
    end
    local v240 = p234.characterChildAddedConn
    if v240 then
        v240:Disconnect()
    end
    local v241 = p234.onCharacterAddedConn
    if v241 then
        v241:Disconnect()
    end
    local v242 = p234.renderSteppedConn
    if v242 then
        v242:Disconnect()
    end
    local v243 = p234.characterChildRemovedConn
    if v243 then
        v243:Disconnect()
    end
    local v244 = p234.menuOpenedConnection
    if v244 then
        v244:Disconnect()
    end
end
function u229.OnTouchBegan(p245, p246, p247) --[[Anonymous function at line 830]]
    if p245.fingerTouches[p246] == nil and not p247 then
        p245.numUnsunkTouches = p245.numUnsunkTouches + 1
    end
    p245.fingerTouches[p246] = p247
end
function u229.OnTouchChanged(p248, p249, p250) --[[Anonymous function at line 837]]
    if p248.fingerTouches[p249] == nil then
        p248.fingerTouches[p249] = p250
        if not p250 then
            p248.numUnsunkTouches = p248.numUnsunkTouches + 1
        end
    end
end
function u229.OnTouchEnded(p251, p252, _) --[[Anonymous function at line 846]]
    if p251.fingerTouches[p252] ~= nil and p251.fingerTouches[p252] == false then
        p251.numUnsunkTouches = p251.numUnsunkTouches - 1
    end
    p251.fingerTouches[p252] = nil
end
function u229.OnCharacterAdded(u253, p254) --[[Anonymous function at line 854]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u19
        [3] = u188
        [4] = u189
        [5] = u190
        [6] = u21
        [7] = u13
    --]]
    u253:DisconnectEvents()
    u253.inputBeganConn = u7.InputBegan:Connect(function(p255, p256) --[[Anonymous function at line 857]]
        --[[
        Upvalues:
            [1] = u253
            [2] = u19
            [3] = u188
            [4] = u189
            [5] = u190
            [6] = u21
        --]]
        if p255.UserInputType == Enum.UserInputType.Touch then
            u253:OnTouchBegan(p255, p256)
        end
        if u253.wasdEnabled and (p256 == false and (p255.UserInputType == Enum.UserInputType.Keyboard and u19[p255.KeyCode])) then
            if u188 then
                u188:Cancel()
                u188 = nil
            end
            if u189 then
                u189:Disconnect()
                u189 = nil
            end
            if u190 then
                u190:Disconnect()
                u190 = nil
            end
            u21.CancelFailureAnimation()
        end
        if p255.UserInputType == Enum.UserInputType.MouseButton1 then
            u253.mouse1DownTime = tick()
            u253.mouse1DownPos = p255.Position
        end
        if p255.UserInputType == Enum.UserInputType.MouseButton2 then
            u253.mouse2DownTime = tick()
            u253.mouse2DownPos = p255.Position
        end
    end)
    u253.inputChangedConn = u7.InputChanged:Connect(function(p257, p258) --[[Anonymous function at line 878]]
        --[[
        Upvalues:
            [1] = u253
        --]]
        if p257.UserInputType == Enum.UserInputType.Touch then
            u253:OnTouchChanged(p257, p258)
        end
    end)
    u253.inputEndedConn = u7.InputEnded:Connect(function(p259, p260) --[[Anonymous function at line 884]]
        --[[
        Upvalues:
            [1] = u253
            [2] = u188
        --]]
        if p259.UserInputType == Enum.UserInputType.Touch then
            u253:OnTouchEnded(p259, p260)
        end
        if p259.UserInputType == Enum.UserInputType.MouseButton2 then
            u253.mouse2UpTime = tick()
            local v261 = p259.Position
            local v262 = u188 or u253.keyboardMoveVector.Magnitude <= 0
            if u253.mouse2UpTime - u253.mouse2DownTime < 0.25 and ((v261 - u253.mouse2DownPos).magnitude < 5 and v262) then
                OnTap({ v261 })
            end
        end
    end)
    u253.tapConn = u7.TouchTap:Connect(function(p263, p264) --[[Anonymous function at line 901]]
        if not p264 then
            OnTap(p263, nil, true)
        end
    end)
    u253.menuOpenedConnection = u13.MenuOpened:Connect(function() --[[Anonymous function at line 907]]
        --[[
        Upvalues:
            [1] = u188
            [2] = u189
            [3] = u190
        --]]
        if u188 then
            u188:Cancel()
            u188 = nil
        end
        if u189 then
            u189:Disconnect()
            u189 = nil
        end
        if u190 then
            u190:Disconnect()
            u190 = nil
        end
    end)
    local function u267(p265) --[[Anonymous function at line 911]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u253
        --]]
        if u7.TouchEnabled and p265:IsA("Tool") then
            p265.ManualActivationOnly = true
        end
        if p265:IsA("Humanoid") then
            local v266 = u253.humanoidDiedConn
            if v266 then
                v266:Disconnect()
            end
            u253.humanoidDiedConn = p265.Died:Connect(function() --[[Anonymous function at line 919]] end)
        end
    end
    u253.characterChildAddedConn = p254.ChildAdded:Connect(function(p268) --[[Anonymous function at line 927]]
        --[[
        Upvalues:
            [1] = u267
        --]]
        u267(p268)
    end)
    u253.characterChildRemovedConn = p254.ChildRemoved:Connect(function(p269) --[[Anonymous function at line 930]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        if u7.TouchEnabled and p269:IsA("Tool") then
            p269.ManualActivationOnly = false
        end
    end)
    for _, v270 in pairs(p254:GetChildren()) do
        u267(v270)
    end
end
function u229.Start(p271) --[[Anonymous function at line 942]]
    p271:Enable(true)
end
function u229.Stop(p272) --[[Anonymous function at line 946]]
    p272:Enable(false)
end
function u229.CleanupPath(_) --[[Anonymous function at line 950]]
    --[[
    Upvalues:
        [1] = u188
        [2] = u189
        [3] = u190
    --]]
    if u188 then
        u188:Cancel()
        u188 = nil
    end
    if u189 then
        u189:Disconnect()
        u189 = nil
    end
    if u190 then
        u190:Disconnect()
        u190 = nil
    end
end
function u229.Enable(u273, p274, p275, p276) --[[Anonymous function at line 954]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u188
        [3] = u189
        [4] = u190
        [5] = u7
    --]]
    if p274 then
        if not u273.running then
            if u20.Character then
                u273:OnCharacterAdded(u20.Character)
            end
            u273.onCharacterAddedConn = u20.CharacterAdded:Connect(function(p277) --[[Anonymous function at line 960]]
                --[[
                Upvalues:
                    [1] = u273
                --]]
                u273:OnCharacterAdded(p277)
            end)
            u273.running = true
        end
        u273.touchJumpController = p276
        if u273.touchJumpController then
            u273.touchJumpController:Enable(u273.jumpEnabled)
        end
    else
        if u273.running then
            u273:DisconnectEvents()
            if u188 then
                u188:Cancel()
                u188 = nil
            end
            if u189 then
                u189:Disconnect()
                u189 = nil
            end
            if u190 then
                u190:Disconnect()
                u190 = nil
            end
            if u7.TouchEnabled then
                local v278 = u20.Character
                if v278 then
                    for _, v279 in pairs(v278:GetChildren()) do
                        if v279:IsA("Tool") then
                            v279.ManualActivationOnly = false
                        end
                    end
                end
            end
            u273.running = false
        end
        if u273.touchJumpController and not u273.jumpEnabled then
            u273.touchJumpController:Enable(true)
        end
        u273.touchJumpController = nil
    end
    if u7.KeyboardEnabled and p274 ~= u273.enabled then
        u273.forwardValue = 0
        u273.backwardValue = 0
        u273.leftValue = 0
        u273.rightValue = 0
        u273.moveVector = Vector3.new(0, 0, 0)
        if p274 then
            u273:BindContextActions()
            u273:ConnectFocusEventListeners()
        else
            u273:UnbindContextActions()
            u273:DisconnectFocusEventListeners()
        end
    end
    u273.wasdEnabled = p274 and p275 and p275 or false
    u273.enabled = p274
end
function u229.OnRenderStepped(p280, p281) --[[Anonymous function at line 1015]]
    --[[
    Upvalues:
        [1] = u188
    --]]
    p280.isJumping = false
    if u188 then
        u188:OnRenderStepped(p281)
        if u188 then
            p280.moveVector = u188.NextActionMoveDirection
            p280.moveVectorIsCameraRelative = false
            if u188.NextActionJump then
                p280.isJumping = true
            end
        else
            p280.moveVector = p280.keyboardMoveVector
            p280.moveVectorIsCameraRelative = true
        end
    else
        p280.moveVector = p280.keyboardMoveVector
        p280.moveVectorIsCameraRelative = true
    end
    if p280.jumpRequested then
        p280.isJumping = true
    end
end
function u229.UpdateMovement(p282, p283) --[[Anonymous function at line 1050]]
    if p283 == Enum.UserInputState.Cancel then
        p282.keyboardMoveVector = Vector3.new(0, 0, 0)
    elseif p282.wasdEnabled then
        local v284 = p282.leftValue + p282.rightValue
        local v285 = p282.forwardValue + p282.backwardValue
        p282.keyboardMoveVector = Vector3.new(v284, 0, v285)
    end
end
function u229.UpdateJump(_) --[[Anonymous function at line 1059]] end
function u229.SetShowPath(_, p286) --[[Anonymous function at line 1064]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14 = p286
end
function u229.GetShowPath(_) --[[Anonymous function at line 1068]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return u14
end
function u229.SetWaypointTexture(_, p287) --[[Anonymous function at line 1072]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.SetWaypointTexture(p287)
end
function u229.GetWaypointTexture(_) --[[Anonymous function at line 1076]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return u21.GetWaypointTexture()
end
function u229.SetWaypointRadius(_, p288) --[[Anonymous function at line 1080]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.SetWaypointRadius(p288)
end
function u229.GetWaypointRadius(_) --[[Anonymous function at line 1084]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return u21.GetWaypointRadius()
end
function u229.SetEndWaypointTexture(_, p289) --[[Anonymous function at line 1088]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.SetEndWaypointTexture(p289)
end
function u229.GetEndWaypointTexture(_) --[[Anonymous function at line 1092]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return u21.GetEndWaypointTexture()
end
function u229.SetWaypointsAlwaysOnTop(_, p290) --[[Anonymous function at line 1096]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.SetWaypointsAlwaysOnTop(p290)
end
function u229.GetWaypointsAlwaysOnTop(_) --[[Anonymous function at line 1100]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return u21.GetWaypointsAlwaysOnTop()
end
function u229.SetFailureAnimationEnabled(_, p291) --[[Anonymous function at line 1104]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15 = p291
end
function u229.GetFailureAnimationEnabled(_) --[[Anonymous function at line 1108]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return u15
end
function u229.SetIgnoredPartsTag(_, p292) --[[Anonymous function at line 1112]]
    --[[
    Upvalues:
        [1] = u52
    --]]
    u52(p292)
end
function u229.GetIgnoredPartsTag(_) --[[Anonymous function at line 1116]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    return u39
end
function u229.SetUseDirectPath(_, p293) --[[Anonymous function at line 1120]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16 = p293
end
function u229.GetUseDirectPath(_) --[[Anonymous function at line 1124]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    return u16
end
function u229.SetAgentSizeIncreaseFactor(_, p294) --[[Anonymous function at line 1128]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17 = p294 / 100 + 1
end
function u229.GetAgentSizeIncreaseFactor(_) --[[Anonymous function at line 1132]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    return (u17 - 1) * 100
end
function u229.SetUnreachableWaypointTimeout(_, p295) --[[Anonymous function at line 1136]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18 = p295
end
function u229.GetUnreachableWaypointTimeout(_) --[[Anonymous function at line 1140]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    return u18
end
function u229.SetUserJumpEnabled(p296, p297) --[[Anonymous function at line 1144]]
    p296.jumpEnabled = p297
    if p296.touchJumpController then
        p296.touchJumpController:Enable(p297)
    end
end
function u229.GetUserJumpEnabled(p298) --[[Anonymous function at line 1151]]
    return p298.jumpEnabled
end
function u229.MoveTo(_, p299, p300, p301) --[[Anonymous function at line 1155]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u184
        [3] = u199
    --]]
    local v302 = u20.Character
    if v302 == nil then
        return false
    end
    local v303 = u184(p299, Vector3.new(0, 1, 0), p301)
    if not (v303 and v303:IsValidPath()) then
        return false
    end
    u199(v303, p299, nil, v302, p300)
    return true
end
return u229