-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local u2 = {
    ["LIMBS"] = 2,
    ["MOVEMENT"] = 3,
    ["CORNERS"] = 4,
    ["CIRCLE1"] = 5,
    ["CIRCLE2"] = 6,
    ["LIMBMOVE"] = 7,
    ["SMART_CIRCLE"] = 8,
    ["CHAR_OUTLINE"] = 9
}
local u3 = {
    ["Head"] = true,
    ["Left Arm"] = true,
    ["Right Arm"] = true,
    ["Left Leg"] = true,
    ["Right Leg"] = true,
    ["LeftLowerArm"] = true,
    ["RightLowerArm"] = true,
    ["LeftUpperLeg"] = true,
    ["RightUpperLeg"] = true
}
local u4 = {
    Vector3.new(1, 1, -1),
    Vector3.new(1, -1, -1),
    Vector3.new(-1, -1, -1),
    Vector3.new(-1, 1, -1)
}
local function u12(p5, ...) --[[Anonymous function at line 59]]
    local v6 = {}
    local v7 = ""
    for _, v8 in pairs({ ... }) do
        v6[v8] = true
        v7 = v7 .. (v7 == "" and "" or " or ") .. v8
    end
    local v9 = type(p5)
    local v10 = v6[v9]
    local v11 = v7 .. " type expected, got: " .. v9
    assert(v10, v11)
end
local function u48(p13, p14, p15, p16) --[[Anonymous function at line 79]]
    local v17 = p14:Cross(p16)
    local v18 = p15.X - p13.X
    local v19 = p15.Y - p13.Y
    local v20 = p15.Z - p13.Z
    local v21 = p14.X
    local v22 = -p16.X
    local v23 = v17.X
    local v24 = p14.Y
    local v25 = -p16.Y
    local v26 = v17.Y
    local v27 = p14.Z
    local v28 = -p16.Z
    local v29 = v17.Z
    local v30 = v21 * (v25 * v29 - v26 * v28) - v22 * (v24 * v29 - v26 * v27) + v23 * (v24 * v28 - v25 * v27)
    if v30 == 0 then
        return Vector3.new(0, 0, 0)
    end
    local v31 = -p16.X
    local v32 = v17.X
    local v33 = -p16.Y
    local v34 = v17.Y
    local v35 = -p16.Z
    local v36 = v17.Z
    local v37 = (v18 * (v33 * v36 - v34 * v35) - v31 * (v19 * v36 - v34 * v20) + v32 * (v19 * v35 - v33 * v20)) / v30
    local v38 = p14.X
    local v39 = v17.X
    local v40 = p14.Y
    local v41 = v17.Y
    local v42 = p14.Z
    local v43 = v17.Z
    local v44 = (v38 * (v19 * v43 - v41 * v20) - v18 * (v40 * v43 - v41 * v42) + v39 * (v40 * v20 - v19 * v42)) / v30
    local v45 = p13 + v37 * p14
    local v46 = p15 + v44 * p16
    local v47 = v45 + 0.5 * (v46 - v45)
    return (v46 - v45).Magnitude >= 0.25 and Vector3.new(0, 0, 0) or v47
end
local u49 = require(script.Parent:WaitForChild("BaseOcclusion"))
local u50 = setmetatable({}, u49)
u50.__index = u50
function u50.new() --[[Anonymous function at line 112]]
    --[[
    Upvalues:
        [1] = u49
        [2] = u50
        [3] = u2
    --]]
    local v51 = u49.new()
    local v52 = u50
    local v53 = setmetatable(v51, v52)
    v53.char = nil
    v53.humanoidRootPart = nil
    v53.torsoPart = nil
    v53.headPart = nil
    v53.childAddedConn = nil
    v53.childRemovedConn = nil
    v53.behaviors = {}
    v53.behaviors[u2.LIMBS] = v53.LimbBehavior
    v53.behaviors[u2.MOVEMENT] = v53.MoveBehavior
    v53.behaviors[u2.CORNERS] = v53.CornerBehavior
    v53.behaviors[u2.CIRCLE1] = v53.CircleBehavior
    v53.behaviors[u2.CIRCLE2] = v53.CircleBehavior
    v53.behaviors[u2.LIMBMOVE] = v53.LimbMoveBehavior
    v53.behaviors[u2.SMART_CIRCLE] = v53.SmartCircleBehavior
    v53.behaviors[u2.CHAR_OUTLINE] = v53.CharacterOutlineBehavior
    v53.mode = u2.SMART_CIRCLE
    v53.behaviorFunction = v53.SmartCircleBehavior
    v53.savedHits = {}
    v53.trackedLimbs = {}
    v53.camera = game.Workspace.CurrentCamera
    v53.enabled = false
    return v53
end
function u50.Enable(p54, p55) --[[Anonymous function at line 145]]
    p54.enabled = p55
    if not p55 then
        p54:Cleanup()
    end
end
function u50.GetOcclusionMode(_) --[[Anonymous function at line 153]]
    return Enum.DevCameraOcclusionMode.Invisicam
end
function u50.LimbBehavior(p56, p57) --[[Anonymous function at line 158]]
    for v58, _ in pairs(p56.trackedLimbs) do
        p57[#p57 + 1] = v58.Position
    end
end
function u50.MoveBehavior(p59, p60) --[[Anonymous function at line 164]]
    for v61 = 1, 3 do
        local v62 = p59.humanoidRootPart.Position
        local v63 = p59.humanoidRootPart.Velocity
        local v64 = v63.X
        local v65 = v63.Z
        local v66 = Vector3.new(v64, 0, v65).Magnitude / 2
        local v67 = (v61 - 1) * p59.humanoidRootPart.CFrame.lookVector * v66
        p60[#p60 + 1] = v62 + v67
    end
end
function u50.CornerBehavior(p68, p69) --[[Anonymous function at line 173]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v70 = p68.humanoidRootPart.CFrame
    local v71 = v70.Position
    local v72 = v70 - v71
    local v73 = p68.char:GetExtentsSize() / 2
    p69[#p69 + 1] = v71
    for v74 = 1, #u4 do
        p69[#p69 + 1] = v71 + v72 * (v73 * u4[v74])
    end
end
function u50.CircleBehavior(p75, p76) --[[Anonymous function at line 184]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v77
    if p75.mode == u2.CIRCLE1 then
        v77 = p75.humanoidRootPart.CFrame
    else
        local v78 = p75.camera.CoordinateFrame
        v77 = v78 - v78.Position + p75.humanoidRootPart.Position
    end
    p76[#p76 + 1] = v77.Position
    for v79 = 0, 9 do
        local v80 = 0.6283185307179586 * v79
        local v81 = math.cos(v80)
        local v82 = math.sin(v80)
        local v83 = 3 * Vector3.new(v81, v82, 0)
        p76[#p76 + 1] = v77 * v83
    end
end
function u50.LimbMoveBehavior(p84, p85) --[[Anonymous function at line 200]]
    p84:LimbBehavior(p85)
    p84:MoveBehavior(p85)
end
function u50.CharacterOutlineBehavior(p86, p87) --[[Anonymous function at line 205]]
    local v88 = p86.torsoPart.CFrame.upVector.unit
    local v89 = p86.torsoPart.CFrame.rightVector.unit
    p87[#p87 + 1] = p86.torsoPart.CFrame.p
    p87[#p87 + 1] = p86.torsoPart.CFrame.p + v88
    p87[#p87 + 1] = p86.torsoPart.CFrame.p - v88
    p87[#p87 + 1] = p86.torsoPart.CFrame.p + v89
    p87[#p87 + 1] = p86.torsoPart.CFrame.p - v89
    if p86.headPart then
        p87[#p87 + 1] = p86.headPart.CFrame.p
    end
    local v90 = CFrame.new
    local v91 = p86.camera.CoordinateFrame.lookVector.X
    local v92 = p86.camera.CoordinateFrame.lookVector.Z
    local v93 = v90(Vector3.new(0, 0, 0), (Vector3.new(v91, 0, v92)))
    local v94 = p86.torsoPart and p86.torsoPart.Position or p86.humanoidRootPart.Position
    local v95 = { p86.torsoPart }
    if p86.headPart then
        v95[#v95 + 1] = p86.headPart
    end
    for v96 = 1, 24 do
        local v97 = 6.283185307179586 * v96 / 24
        local v98 = math.cos(v97)
        local v99 = math.sin(v97)
        local v100 = v93 * (3 * Vector3.new(v98, v99, 0))
        local v101 = v100.X
        local v102 = v100.Y
        local v103 = math.max(v102, -2.25)
        local v104 = v100.Z
        local v105 = Vector3.new(v101, v103, v104)
        local v106 = Ray.new(v94 + v105, -3 * v105)
        local v107, v108 = game.Workspace:FindPartOnRayWithWhitelist(v106, v95, false)
        if v107 then
            p87[#p87 + 1] = v108 + 0.2 * (v94 - v108).unit
        end
    end
end
function u50.SmartCircleBehavior(p109, p110) --[[Anonymous function at line 244]]
    --[[
    Upvalues:
        [1] = u48
    --]]
    local v111 = p109.torsoPart.CFrame.upVector.unit
    local v112 = p109.torsoPart.CFrame.rightVector.unit
    p110[#p110 + 1] = p109.torsoPart.CFrame.p
    p110[#p110 + 1] = p109.torsoPart.CFrame.p + v111
    p110[#p110 + 1] = p109.torsoPart.CFrame.p - v111
    p110[#p110 + 1] = p109.torsoPart.CFrame.p + v112
    p110[#p110 + 1] = p109.torsoPart.CFrame.p - v112
    if p109.headPart then
        p110[#p110 + 1] = p109.headPart.CFrame.p
    end
    local v113 = p109.camera.CFrame - p109.camera.CFrame.p
    local v114 = Vector3.new(0, 0.5, 0) + (p109.torsoPart and p109.torsoPart.Position or p109.humanoidRootPart.Position)
    for v115 = 1, 24 do
        local v116 = 0.2617993877991494 * v115 - 1.5707963267948966
        local v117 = math.cos(v116)
        local v118 = math.sin(v116)
        local v119 = v114 + v113 * (2.5 * Vector3.new(v117, v118, 0))
        local v120 = v119 - p109.camera.CFrame.p
        local v121 = Ray.new(v114, v119 - v114)
        local v122, v123, v124 = game.Workspace:FindPartOnRayWithIgnoreList(v121, { p109.char }, false, false)
        if v122 then
            local v125 = v123 + 0.1 * v124.unit
            local v126 = v125 - v114
            local v127 = v126:Cross(v120).unit:Cross(v124).unit
            local v128 = (v125 - p109.camera.CFrame.p).unit
            if v126.unit:Dot(-v127) < v126.unit:Dot(v128) then
                v119 = u48(v125, v127, v119, v120)
                if v119.Magnitude > 0 then
                    local v129 = Ray.new(v125, v119 - v125)
                    local v130, v131, v132 = game.Workspace:FindPartOnRayWithIgnoreList(v129, { p109.char }, false, false)
                    if v130 then
                        v119 = v131 + 0.1 * v132.unit
                    end
                else
                    v119 = v125
                end
            else
                v119 = v125
            end
            local v133 = Ray.new(v114, v119 - v114)
            local v134, v135, _ = game.Workspace:FindPartOnRayWithIgnoreList(v133, { p109.char }, false, false)
            if v134 then
                v119 = v135 - 0.1 * (v119 - v114).unit
            end
        end
        p110[#p110 + 1] = v119
    end
end
function u50.CheckTorsoReference(p136) --[[Anonymous function at line 329]]
    if p136.char then
        p136.torsoPart = p136.char:FindFirstChild("Torso")
        if not p136.torsoPart then
            p136.torsoPart = p136.char:FindFirstChild("UpperTorso")
            if not p136.torsoPart then
                p136.torsoPart = p136.char:FindFirstChild("HumanoidRootPart")
            end
        end
        p136.headPart = p136.char:FindFirstChild("Head")
    end
end
function u50.CharacterAdded(u137, p138, p139) --[[Anonymous function at line 343]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    if p139 == u1.LocalPlayer then
        if u137.childAddedConn then
            u137.childAddedConn:Disconnect()
            u137.childAddedConn = nil
        end
        if u137.childRemovedConn then
            u137.childRemovedConn:Disconnect()
            u137.childRemovedConn = nil
        end
        u137.char = p138
        u137.trackedLimbs = {}
        local function v141(p140) --[[Anonymous function at line 359]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u137
            --]]
            if p140:IsA("BasePart") then
                if u3[p140.Name] then
                    u137.trackedLimbs[p140] = true
                end
                if p140.Name == "Torso" or p140.Name == "UpperTorso" then
                    u137.torsoPart = p140
                end
                if p140.Name == "Head" then
                    u137.headPart = p140
                end
            end
        end
        u137.childAddedConn = p138.ChildAdded:Connect(v141)
        u137.childRemovedConn = p138.ChildRemoved:Connect(function(p142) --[[Function name: childRemoved, line 375]]
            --[[
            Upvalues:
                [1] = u137
            --]]
            u137.trackedLimbs[p142] = nil
            u137:CheckTorsoReference()
        end)
        for _, v143 in pairs(u137.char:GetChildren()) do
            if v143:IsA("BasePart") then
                if u3[v143.Name] then
                    u137.trackedLimbs[v143] = true
                end
                if v143.Name == "Torso" or v143.Name == "UpperTorso" then
                    u137.torsoPart = v143
                end
                if v143.Name == "Head" then
                    u137.headPart = v143
                end
            end
        end
    end
end
function u50.SetMode(p144, p145) --[[Anonymous function at line 389]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
    --]]
    u12(p145, "number")
    for _, v146 in pairs(u2) do
        if v146 == p145 then
            p144.mode = p145
            p144.behaviorFunction = p144.behaviors[p144.mode]
            return
        end
    end
    error("Invalid mode number")
end
function u50.GetObscuredParts(p147) --[[Anonymous function at line 401]]
    return p147.savedHits
end
function u50.Cleanup(p148) --[[Anonymous function at line 406]]
    for v149, v150 in pairs(p148.savedHits) do
        v149.LocalTransparencyModifier = v150
    end
end
function u50.Update(u151, _, p152, p153) --[[Anonymous function at line 412]]
    if not (u151.enabled and u151.char) then
        return p152, p153
    end
    u151.camera = game.Workspace.CurrentCamera
    if not u151.humanoidRootPart then
        local v154 = u151.char:FindFirstChildOfClass("Humanoid")
        if v154 and v154.RootPart then
            u151.humanoidRootPart = v154.RootPart
        else
            u151.humanoidRootPart = u151.char:FindFirstChild("HumanoidRootPart")
            if not u151.humanoidRootPart then
                return p152, p153
            end
        end
        local u155 = nil
        u155 = u151.humanoidRootPart.AncestryChanged:Connect(function(p156, p157) --[[Anonymous function at line 435]]
            --[[
            Upvalues:
                [1] = u151
                [2] = u155
            --]]
            if p156 == u151.humanoidRootPart and not p157 then
                u151.humanoidRootPart = nil
                if u155 and u155.Connected then
                    u155:Disconnect()
                    u155 = nil
                end
            end
        end)
    end
    if not u151.torsoPart then
        u151:CheckTorsoReference()
        if not u151.torsoPart then
            return p152, p153
        end
    end
    local v158 = {}
    u151.behaviorFunction(u151, v158)
    local v159 = { u151.char }
    local v160 = u151.headPart and u151.headPart.CFrame.p or v158[1]
    local v161 = u151.torsoPart and u151.torsoPart.CFrame.p or v158[2]
    local v162 = u151.camera:GetPartsObscuringTarget({ v160, v161 }, v159)
    local v163 = 0
    local v164 = {}
    local v165 = 0.75
    local v166 = {}
    local v167 = 0.75
    for v168 = 1, #v162 do
        local v169 = v162[v168]
        v163 = v163 + 1
        v164[v169] = true
        for _, v170 in pairs(v169:GetChildren()) do
            if v170:IsA("Decal") or v170:IsA("Texture") then
                v163 = v163 + 1
                break
            end
        end
    end
    if v163 > 0 then
        local v171 = 0.375 / v163 + 0.375
        local v172 = 1 / v163
        v165 = math.pow(v171, v172)
        local v173 = 0.25 / v163 + 0.25
        local v174 = 1 / v163
        v167 = math.pow(v173, v174)
    end
    local v175 = u151.camera:GetPartsObscuringTarget(v158, v159)
    local v176 = {}
    for v177 = 1, #v175 do
        local v178 = v175[v177]
        v176[v178] = v164[v178] and v165 and v165 or v167
        if v178.Transparency < v176[v178] then
            v166[v178] = true
            if not u151.savedHits[v178] then
                u151.savedHits[v178] = v178.LocalTransparencyModifier
            end
        end
        for _, v179 in pairs(v178:GetChildren()) do
            if (v179:IsA("Decal") or v179:IsA("Texture")) and v179.Transparency < v176[v178] then
                v176[v179] = v176[v178]
                v166[v179] = true
                if not u151.savedHits[v179] then
                    u151.savedHits[v179] = v179.LocalTransparencyModifier
                end
            end
        end
    end
    for v180, v181 in pairs(u151.savedHits) do
        if v166[v180] then
            v180.LocalTransparencyModifier = v180.Transparency < 1 and ((v176[v180] - v180.Transparency) / (1 - v180.Transparency) or 0) or 0
        else
            v180.LocalTransparencyModifier = v181
            u151.savedHits[v180] = nil
        end
    end
    return p152, p153
end
return u50