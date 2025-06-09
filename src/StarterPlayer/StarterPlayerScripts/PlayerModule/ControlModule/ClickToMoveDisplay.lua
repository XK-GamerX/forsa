-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = {}
local u2 = "rbxasset://textures/ui/traildot.png"
local u3 = "rbxasset://textures/ui/waypoint.png"
local u4 = false
local u5 = UDim2.new(0, 42, 0, 50)
local u6 = Vector2.new(0, 0.5)
local u7 = Vector2.new(0, 1)
local u8 = Vector2.new(0, 0.5)
local u9 = Vector2.new(0.1, 0.5)
local u10 = Vector2.new(-0.1, 0.5)
local u11 = Vector2.new(1.5, 1.5)
local v12 = game:GetService("Players")
local u13 = game:GetService("TweenService")
local u14 = game:GetService("RunService")
local u15 = game:GetService("Workspace")
local u16 = v12.LocalPlayer
local function u28() --[[Anonymous function at line 44]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u2
        [4] = u5
        [5] = u6
        [6] = u3
        [7] = u8
    --]]
    local v17 = Instance.new("Part")
    v17.Size = Vector3.new(1, 1, 1)
    v17.Anchored = true
    v17.CanCollide = false
    v17.Name = "TrailDot"
    v17.Transparency = 1
    local v18 = Instance.new("ImageHandleAdornment")
    v18.Name = "TrailDotImage"
    v18.Size = u11
    v18.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
    v18.AlwaysOnTop = u4
    v18.Image = u2
    v18.Adornee = v17
    v18.Parent = v17
    local v19 = Instance.new("Part")
    v19.Size = Vector3.new(2, 2, 2)
    v19.Anchored = true
    v19.CanCollide = false
    v19.Name = "EndWaypoint"
    v19.Transparency = 1
    local v20 = Instance.new("ImageHandleAdornment")
    v20.Name = "TrailDotImage"
    v20.Size = u11
    v20.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
    v20.AlwaysOnTop = u4
    v20.Image = u2
    v20.Adornee = v19
    v20.Parent = v19
    local v21 = Instance.new("BillboardGui")
    v21.Name = "EndWaypointBillboard"
    v21.Size = u5
    v21.LightInfluence = 0
    v21.SizeOffset = u6
    v21.AlwaysOnTop = true
    v21.Adornee = v19
    v21.Parent = v19
    local v22 = Instance.new("ImageLabel")
    v22.Image = u3
    v22.BackgroundTransparency = 1
    v22.Size = UDim2.new(1, 0, 1, 0)
    v22.Parent = v21
    local v23 = Instance.new("Part")
    v23.Size = Vector3.new(2, 2, 2)
    v23.Anchored = true
    v23.CanCollide = false
    v23.Name = "FailureWaypoint"
    v23.Transparency = 1
    local v24 = Instance.new("ImageHandleAdornment")
    v24.Name = "TrailDotImage"
    v24.Size = u11
    v24.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
    v24.AlwaysOnTop = u4
    v24.Image = u2
    v24.Adornee = v23
    v24.Parent = v23
    local v25 = Instance.new("BillboardGui")
    v25.Name = "FailureWaypointBillboard"
    v25.Size = u5
    v25.LightInfluence = 0
    v25.SizeOffset = u8
    v25.AlwaysOnTop = true
    v25.Adornee = v23
    v25.Parent = v23
    local v26 = Instance.new("Frame")
    v26.BackgroundTransparency = 1
    v26.Size = UDim2.new(0, 0, 0, 0)
    v26.Position = UDim2.new(0.5, 0, 1, 0)
    v26.Parent = v25
    local v27 = Instance.new("ImageLabel")
    v27.Image = u3
    v27.BackgroundTransparency = 1
    v27.Position = UDim2.new(0, -u5.X.Offset / 2, 0, -u5.Y.Offset)
    v27.Size = u5
    v27.Parent = v26
    return v17, v19, v23
end
local u29, u30, u31 = u28()
local function u39(p32, p33) --[[Anonymous function at line 141]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
    --]]
    local v34, v35, v36 = u15:FindPartOnRayWithIgnoreList(Ray.new(p33 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { u15.CurrentCamera, u16.Character })
    if v34 then
        p32.CFrame = CFrame.new(v35, v35 + v36)
        local v37 = u15.CurrentCamera
        local v38 = v37:FindFirstChild("ClickToMoveDisplay")
        if not v38 then
            v38 = Instance.new("Model")
            v38.Name = "ClickToMoveDisplay"
            v38.Parent = v37
        end
        p32.Parent = v38
    end
end
local u40 = {}
u40.__index = u40
function u40.Destroy(p41) --[[Anonymous function at line 156]]
    p41.DisplayModel:Destroy()
end
function u40.NewDisplayModel(_, p42) --[[Anonymous function at line 160]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u39
    --]]
    local v43 = u29:Clone()
    u39(v43, p42)
    return v43
end
function u40.new(p44, p45) --[[Anonymous function at line 166]]
    --[[
    Upvalues:
        [1] = u40
    --]]
    local v46 = u40
    local v47 = setmetatable({}, v46)
    v47.DisplayModel = v47:NewDisplayModel(p44)
    v47.ClosestWayPoint = p45
    return v47
end
local u48 = {}
u48.__index = u48
function u48.Destroy(p49) --[[Anonymous function at line 178]]
    p49.Destroyed = true
    p49.Tween:Cancel()
    p49.DisplayModel:Destroy()
end
function u48.NewDisplayModel(_, p50) --[[Anonymous function at line 184]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u39
    --]]
    local v51 = u30:Clone()
    u39(v51, p50)
    return v51
end
function u48.CreateTween(p52) --[[Anonymous function at line 190]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
    --]]
    local v53 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true)
    local v54 = {
        ["SizeOffset"] = u7
    }
    local v55 = u13:Create(p52.DisplayModel.EndWaypointBillboard, v53, v54)
    v55:Play()
    return v55
end
function u48.TweenInFrom(p56, p57) --[[Anonymous function at line 201]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v58 = p57 - p56.DisplayModel.Position
    local v59 = p56.DisplayModel.EndWaypointBillboard
    local v60 = v58.Y
    v59.StudsOffset = Vector3.new(0, v60, 0)
    local v61 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v62 = u13:Create(p56.DisplayModel.EndWaypointBillboard, v61, {
        ["StudsOffset"] = Vector3.new(0, 0, 0)
    })
    v62:Play()
    return v62
end
function u48.new(p63, p64, p65) --[[Anonymous function at line 215]]
    --[[
    Upvalues:
        [1] = u48
    --]]
    local v66 = u48
    local u67 = setmetatable({}, v66)
    u67.DisplayModel = u67:NewDisplayModel(p63)
    u67.Destroyed = false
    if p65 and (p65 - p63).Magnitude > 5 then
        u67.Tween = u67:TweenInFrom(p65)
        coroutine.wrap(function() --[[Anonymous function at line 222]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            u67.Tween.Completed:Wait()
            if not u67.Destroyed then
                u67.Tween = u67:CreateTween()
            end
        end)()
    else
        u67.Tween = u67:CreateTween()
    end
    u67.ClosestWayPoint = p64
    return u67
end
local u68 = {}
u68.__index = u68
function u68.Hide(p69) --[[Anonymous function at line 239]]
    p69.DisplayModel.Parent = nil
end
function u68.Destroy(p70) --[[Anonymous function at line 243]]
    p70.DisplayModel:Destroy()
end
function u68.NewDisplayModel(_, p71) --[[Anonymous function at line 247]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u39
        [3] = u15
        [4] = u16
    --]]
    local v72 = u31:Clone()
    u39(v72, p71)
    local v73, v74, v75 = u15:FindPartOnRayWithIgnoreList(Ray.new(p71 + Vector3.new(0, 2.5, 0), Vector3.new(0, -10, 0)), { u15.CurrentCamera, u16.Character })
    if v73 then
        v72.CFrame = CFrame.new(v74, v74 + v75)
        local v76 = u15.CurrentCamera
        local v77 = v76:FindFirstChild("ClickToMoveDisplay")
        if not v77 then
            v77 = Instance.new("Model")
            v77.Name = "ClickToMoveDisplay"
            v77.Parent = v76
        end
        v72.Parent = v77
    end
    return v72
end
function u68.RunFailureTween(p78) --[[Anonymous function at line 261]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u10
        [4] = u8
    --]]
    wait(0.125)
    local v79 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v80 = {
        ["SizeOffset"] = u9
    }
    local v81 = u13:Create(p78.DisplayModel.FailureWaypointBillboard, v79, v80)
    v81:Play()
    u13:Create(p78.DisplayModel.FailureWaypointBillboard.Frame, v79, {
        ["Rotation"] = 10
    }):Play()
    v81.Completed:wait()
    local v82 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true)
    local v83 = {
        ["SizeOffset"] = u10
    }
    local v84 = u13:Create(p78.DisplayModel.FailureWaypointBillboard, v82, v83)
    v84:Play()
    local v85 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true)
    u13:Create(p78.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v85, {
        ["ImageColor3"] = Color3.new(0.75, 0.75, 0.75)
    }):Play()
    u13:Create(p78.DisplayModel.FailureWaypointBillboard.Frame, v85, {
        ["Rotation"] = -10
    }):Play()
    v84.Completed:wait()
    local v86 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v87 = {
        ["SizeOffset"] = u8
    }
    local v88 = u13:Create(p78.DisplayModel.FailureWaypointBillboard, v86, v87)
    v88:Play()
    u13:Create(p78.DisplayModel.FailureWaypointBillboard.Frame, v86, {
        ["Rotation"] = 0
    }):Play()
    v88.Completed:wait()
    wait(0.125)
end
function u68.new(p89) --[[Anonymous function at line 310]]
    --[[
    Upvalues:
        [1] = u68
    --]]
    local v90 = u68
    local v91 = setmetatable({}, v90)
    v91.DisplayModel = v91:NewDisplayModel(p89)
    return v91
end
local u92 = Instance.new("Animation")
u92.AnimationId = "rbxassetid://2874840706"
local u93 = nil
local function u105(p94, p95) --[[Anonymous function at line 342]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u48
    --]]
    local v96 = {}
    local v97 = 1
    for v98 = 1, #p94 - 1 do
        local v99 = (p94[v98].Position - p94[#p94].Position).Magnitude < 3
        local v100
        if v98 % 2 == 0 then
            v100 = not v99
        else
            v100 = false
        end
        if v100 then
            v96[v97] = u40.new(p94[v98].Position, v98)
            v97 = v97 + 1
        end
    end
    local v101 = u48.new(p94[#p94].Position, #p94, p95)
    table.insert(v96, v101)
    local v102 = {}
    local v103 = 1
    for v104 = #v96, 1, -1 do
        v102[v103] = v96[v104]
        v103 = v103 + 1
    end
    return v102
end
local u106 = 0
function v1.CreatePathDisplay(u107, p108) --[[Anonymous function at line 376]]
    --[[
    Upvalues:
        [1] = u106
        [2] = u105
        [3] = u14
        [4] = u15
        [5] = u11
    --]]
    u106 = u106 + 1
    local u109 = u105(u107, p108)
    local function u113(p110) --[[Anonymous function at line 380]]
        --[[
        Upvalues:
            [1] = u109
        --]]
        for v111 = #u109, 1, -1 do
            local v112 = u109[v111]
            if v112.ClosestWayPoint > p110 then
                break
            end
            v112:Destroy()
            u109[v111] = nil
        end
    end
    local u114 = "ClickToMoveResizeTrail" .. u106
    local function v120() --[[Anonymous function at line 394]]
        --[[
        Upvalues:
            [1] = u109
            [2] = u14
            [3] = u114
            [4] = u15
            [5] = u11
        --]]
        if #u109 == 0 then
            u14:UnbindFromRenderStep(u114)
        else
            local v115 = u15.CurrentCamera.CFrame.p
            for v116 = 1, #u109 do
                local v117 = u109[v116].DisplayModel:FindFirstChild("TrailDotImage")
                if v117 then
                    local v118 = u11
                    local v119 = (u109[v116].DisplayModel.Position - v115).Magnitude - 10
                    v117.Size = v118 * (math.clamp(v119, 0, 90) / 90 * 1.5 + 1)
                end
            end
        end
    end
    u14:BindToRenderStep(u114, Enum.RenderPriority.Camera.Value - 1, v120)
    return function() --[[Function name: removePath, line 410]]
        --[[
        Upvalues:
            [1] = u113
            [2] = u107
        --]]
        u113(#u107)
    end, u113
end
local u121 = nil
function v1.DisplayFailureWaypoint(p122) --[[Anonymous function at line 418]]
    --[[
    Upvalues:
        [1] = u121
        [2] = u68
    --]]
    if u121 then
        u121:Hide()
    end
    local u123 = u68.new(p122)
    u121 = u123
    coroutine.wrap(function() --[[Anonymous function at line 424]]
        --[[
        Upvalues:
            [1] = u123
        --]]
        u123:RunFailureTween()
        u123:Destroy()
        u123 = nil
    end)()
end
function v1.CreateEndWaypoint(p124) --[[Anonymous function at line 431]]
    --[[
    Upvalues:
        [1] = u48
    --]]
    return u48.new(p124)
end
function v1.PlayFailureAnimation() --[[Anonymous function at line 435]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u93
        [3] = u92
    --]]
    local v125 = u16.Character
    local v126
    if v125 then
        v126 = v125:FindFirstChildOfClass("Humanoid")
    else
        v126 = nil
    end
    if v126 then
        local v127
        if v126 == nil then
            v127 = u93
        else
            u93 = v126:LoadAnimation(u92)
            local v128 = u93
            assert(v128, "")
            u93.Priority = Enum.AnimationPriority.Action
            u93.Looped = false
            v127 = u93
        end
        v127:Play()
    end
end
function v1.CancelFailureAnimation() --[[Anonymous function at line 443]]
    --[[
    Upvalues:
        [1] = u93
    --]]
    if u93 ~= nil and u93.IsPlaying then
        u93:Stop()
    end
end
function v1.SetWaypointTexture(p129) --[[Anonymous function at line 449]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u29
        [3] = u30
        [4] = u31
        [5] = u28
    --]]
    u2 = p129
    local v130, v131, v132 = u28()
    u29 = v130
    u30 = v131
    u31 = v132
end
function v1.GetWaypointTexture() --[[Anonymous function at line 454]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2
end
function v1.SetWaypointRadius(p133) --[[Anonymous function at line 458]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u29
        [3] = u30
        [4] = u31
        [5] = u28
    --]]
    u11 = Vector2.new(p133, p133)
    local v134, v135, v136 = u28()
    u29 = v134
    u30 = v135
    u31 = v136
end
function v1.GetWaypointRadius() --[[Anonymous function at line 463]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return u11.X
end
function v1.SetEndWaypointTexture(p137) --[[Anonymous function at line 467]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u29
        [3] = u30
        [4] = u31
        [5] = u28
    --]]
    u3 = p137
    local v138, v139, v140 = u28()
    u29 = v138
    u30 = v139
    u31 = v140
end
function v1.GetEndWaypointTexture() --[[Anonymous function at line 472]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3
end
function v1.SetWaypointsAlwaysOnTop(p141) --[[Anonymous function at line 476]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u29
        [3] = u30
        [4] = u31
        [5] = u28
    --]]
    u4 = p141
    local v142, v143, v144 = u28()
    u29 = v142
    u30 = v143
    u31 = v144
end
function v1.GetWaypointsAlwaysOnTop() --[[Anonymous function at line 481]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4
end
return v1