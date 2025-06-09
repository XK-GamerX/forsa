-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local u2 = game.Workspace.CurrentCamera
local u3 = math.min
local u4 = math.tan
local u5 = math.rad
local u6 = Ray.new
local u7 = nil
local u8 = nil
local function v12() --[[Anonymous function at line 28]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u8
        [4] = u4
        [5] = u7
    --]]
    local v9 = u5(u2.FieldOfView)
    local v10 = u2.ViewportSize
    local v11 = v10.X / v10.Y
    u8 = u4(v9 / 2) * 2
    u7 = v11 * u8
end
u2:GetPropertyChangedSignal("FieldOfView"):Connect(v12)
u2:GetPropertyChangedSignal("ViewportSize"):Connect(v12)
local v13 = u5(u2.FieldOfView)
local v14 = u2.ViewportSize
local v15 = v14.X / v14.Y
u8 = u4(v13 / 2) * 2
u7 = v15 * u8
local u16 = u2.NearPlaneZ
u2:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[Anonymous function at line 43]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u2
    --]]
    u16 = u2.NearPlaneZ
end)
local u17 = {}
local u18 = {}
local function v29(u19) --[[Anonymous function at line 60]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
    --]]
    local function v23(p20) --[[Anonymous function at line 61]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u19
            [3] = u17
        --]]
        u18[u19] = p20
        local v21 = 1
        u17 = {}
        for _, v22 in pairs(u18) do
            u17[v21] = v22
            v21 = v21 + 1
        end
    end
    local function v26() --[[Anonymous function at line 65]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u19
            [3] = u17
        --]]
        u18[u19] = nil
        local v24 = 1
        u17 = {}
        for _, v25 in pairs(u18) do
            u17[v24] = v25
            v24 = v24 + 1
        end
    end
    u19.CharacterAdded:Connect(v23)
    u19.CharacterRemoving:Connect(v26)
    if u19.Character then
        u18[u19] = u19.Character
        local v27 = 1
        u17 = {}
        for _, v28 in pairs(u18) do
            u17[v27] = v28
            v27 = v27 + 1
        end
    end
end
local function v33(p30) --[[Anonymous function at line 77]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
    --]]
    u18[p30] = nil
    local v31 = 1
    u17 = {}
    for _, v32 in pairs(u18) do
        u17[v31] = v32
        v31 = v31 + 1
    end
end
v1.PlayerAdded:Connect(v29)
v1.PlayerRemoving:Connect(v33)
local u34 = u8
local u35 = u7
local u36 = u16
for _, v37 in ipairs(v1:GetPlayers()) do
    v29(v37)
end
local v38 = 1
u17 = {}
local u39 = u17
for _, v40 in pairs(u18) do
    u39[v38] = v40
    v38 = v38 + 1
end
local u41 = nil
local u42 = nil
u2:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[Anonymous function at line 111]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u42
    --]]
    local v43 = u2.CameraSubject
    if v43:IsA("Humanoid") then
        u42 = v43.RootPart
        return
    elseif v43:IsA("BasePart") then
        u42 = v43
    else
        u42 = nil
    end
end)
local u44 = {
    Vector2.new(0.4, 0),
    Vector2.new(-0.4, 0),
    Vector2.new(0, -0.4),
    Vector2.new(0, 0.4),
    Vector2.new(0, 0.2)
}
local function u54(p45, p46) --[[Anonymous function at line 150]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u6
    --]]
    local v47 = #u39
    while true do
        local v48, v49 = workspace:FindPartOnRayWithIgnoreList(u6(p45, p46), u39, false, true)
        if v48 then
            if v48.CanCollide then
                local v50 = u39
                for v51 = #v50, v47 + 1, -1 do
                    v50[v51] = nil
                end
                return v49, true
            end
            u39[#u39 + 1] = v48
        end
        if not v48 then
            local v52 = u39
            for v53 = #v52, v47 + 1, -1 do
                v52[v53] = nil
            end
            return p45 + p46, false
        end
    end
end
local function u76(p55, p56, p57, p58) --[[Anonymous function at line 172]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u36
        [3] = u6
        [4] = u41
    --]]
    debug.profilebegin("queryPoint")
    local v59 = #u39
    local v60 = p57 + u36
    local v61 = p55 + p56 * v60
    local v62 = p55
    local v63 = 0
    local v64 = (1 / 0)
    local v65 = (1 / 0)
    while true do
        local v66, v67 = workspace:FindPartOnRayWithIgnoreList(u6(p55, v61 - p55), u39, false, true)
        v63 = v63 + 1
        local v68
        if v66 then
            local v69 = v63 >= 64
            local v70 = 1 - (1 - v66.Transparency) * (1 - v66.LocalTransparencyModifier) < 0.25 and v66.CanCollide
            if v70 then
                if u41 == (v66:GetRootPart() or v66) then
                    v70 = false
                else
                    v70 = not v66:IsA("TrussPart")
                end
            end
            if v70 or v69 then
                local v71 = { v66 }
                local v72 = workspace:FindPartOnRayWithWhitelist(u6(v61, v67 - v61), v71, true)
                v68 = (v67 - v62).Magnitude
                if v72 and not v69 then
                    local v73
                    if p58 then
                        v73 = workspace:FindPartOnRayWithWhitelist(u6(p58, v61 - p58), v71, true) or workspace:FindPartOnRayWithWhitelist(u6(v61, p58 - v61), v71, true)
                    else
                        v73 = false
                    end
                    if v73 then
                        v64 = v68
                        v68 = v65
                    elseif v60 >= v65 then
                        v68 = v65
                    end
                else
                    v64 = v68
                    v68 = v65
                end
            else
                v68 = v65
            end
            u39[#u39 + 1] = v66
            p55 = v67 - p56 * 0.001
        else
            v68 = v65
        end
        if v64 < (1 / 0) or not v66 then
            local v74 = u39
            for v75 = #v74, v59 + 1, -1 do
                v74[v75] = nil
            end
            debug.profileend()
            return v68 - u36, v64 - u36
        end
        v65 = v68
    end
end
local function u91(p77, p78) --[[Anonymous function at line 232]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u35
        [3] = u34
        [4] = u36
        [5] = u76
    --]]
    debug.profilebegin("queryViewport")
    local v79 = p77.p
    local v80 = p77.rightVector
    local v81 = p77.upVector
    local v82 = -p77.lookVector
    local v83 = u2.ViewportSize
    local v84 = (1 / 0)
    local v85 = (1 / 0)
    for v86 = 0, 1 do
        local v87 = v80 * ((v86 - 0.5) * u35)
        for v88 = 0, 1 do
            local v89, v90 = u76(v79 + u36 * (v87 + v81 * ((v88 - 0.5) * u34)), v82, p78, u2:ViewportPointToRay(v83.x * v86, v83.y * v88).Origin)
            if v90 >= v84 then
                v90 = v84
            end
            if v89 < v85 then
                v85 = v89
                v84 = v90
            else
                v84 = v90
            end
        end
    end
    debug.profileend()
    return v85, v84
end
local function u105(p92, p93, p94) --[[Anonymous function at line 273]]
    --[[
    Upvalues:
        [1] = u54
        [2] = u3
        [3] = u76
        [4] = u44
    --]]
    debug.profilebegin("testPromotion")
    local v95 = p92.p
    local v96 = p92.rightVector
    local v97 = p92.upVector
    local v98 = -p92.lookVector
    debug.profilebegin("extrapolate")
    local v99 = (u54(v95, p94.posVelocity * 1.25) - v95).Magnitude
    local v100 = p94.posVelocity.magnitude
    for v101 = 0, u3(1.25, p94.rotVelocity.magnitude + v99 / v100), 0.0625 do
        local v102 = p94.extrapolate(v101)
        if p93 <= u76(v102.p, -v102.lookVector, p93) then
            return false
        end
    end
    debug.profileend()
    debug.profilebegin("testOffsets")
    for _, v103 in ipairs(u44) do
        local v104 = u54(v95, v96 * v103.x + v97 * v103.y)
        if u76(v104, (v95 + v98 * p93 - v104).Unit, p93) == (1 / 0) then
            return false
        end
    end
    debug.profileend()
    debug.profileend()
    return true
end
return function(p106, p107, p108) --[[Function name: Popper, line 322]]
    --[[
    Upvalues:
        [1] = u41
        [2] = u42
        [3] = u91
        [4] = u105
    --]]
    debug.profilebegin("popper")
    u41 = u42 and u42:GetRootPart() or u42
    local v109, v110 = u91(p106, p107)
    if v110 >= p107 then
        v110 = p107
    end
    if v109 < v110 then
        if not u105(p106, p107, p108) then
            v109 = v110
        end
    else
        v109 = v110
    end
    u41 = nil
    debug.profileend()
    return v109
end