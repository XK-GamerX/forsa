-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local u2 = game:GetService("UserInputService")
local u3 = UserSettings():GetService("UserGameSettings")
local u4 = {}
local u5 = {}
u5.__index = u5
function u5.new(p6, p7) --[[Anonymous function at line 21]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v8 = u5
    return setmetatable({
        ["freq"] = p6,
        ["goal"] = p7,
        ["pos"] = p7,
        ["vel"] = 0
    }, v8)
end
function u5.step(p9, p10) --[[Anonymous function at line 31]]
    local v11 = p9.freq * 2 * 3.141592653589793
    local v12 = p9.goal
    local v13 = p9.pos
    local v14 = p9.vel
    local v15 = v13 - v12
    local v16 = -v11 * p10
    local v17 = math.exp(v16)
    local v18 = (v15 * (v11 * p10 + 1) + v14 * p10) * v17 + v12
    local v19 = (v14 * (1 - v11 * p10) - v15 * (v11 * v11 * p10)) * v17
    p9.pos = v18
    p9.vel = v19
    return v18
end
u4.Spring = u5
function u4.map(p20, p21, p22, p23, p24) --[[Anonymous function at line 53]]
    return (p20 - p21) * (p24 - p23) / (p22 - p21) + p23
end
function u4.mapClamp(p25, p26, p27, p28, p29) --[[Anonymous function at line 58]]
    local v30 = (p25 - p26) * (p29 - p28) / (p27 - p26) + p28
    local v31 = math.min(p28, p29)
    local v32 = math.max(p28, p29)
    return math.clamp(v30, v31, v32)
end
function u4.getLooseBoundingSphere(p33) --[[Anonymous function at line 67]]
    local v34 = table.create(#p33)
    for v35, v36 in pairs(p33) do
        v34[v35] = v36.Position
    end
    local v37 = v34[1]
    local v38 = v37
    local v39 = 0
    for _, v40 in ipairs(v34) do
        local v41 = (v40 - v37).Magnitude
        if v39 < v41 then
            v38 = v40
            v39 = v41
        end
    end
    local v42 = v38
    local v43 = 0
    for _, v44 in ipairs(v34) do
        local v45 = (v44 - v38).Magnitude
        if v43 < v45 then
            v42 = v44
            v43 = v45
        end
    end
    local v46 = (v38 + v42) * 0.5
    local v47 = (v38 - v42).Magnitude * 0.5
    for _, v48 in ipairs(v34) do
        local v49 = (v48 - v46).Magnitude
        if v47 < v49 then
            v46 = v46 + (v49 - v47) * 0.5 * (v48 - v46).Unit
            v47 = (v49 + v47) * 0.5
        end
    end
    return v46, v47
end
function u4.sanitizeAngle(p50) --[[Anonymous function at line 123]]
    return (p50 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793
end
function u4.Round(p51, p52) --[[Anonymous function at line 128]]
    local v53 = 10 ^ p52
    local v54 = p51 * v53 + 0.5
    return math.floor(v54) / v53
end
function u4.IsFinite(p55) --[[Anonymous function at line 133]]
    local v56
    if p55 == p55 and p55 ~= (1 / 0) then
        v56 = p55 ~= (-1 / 0)
    else
        v56 = false
    end
    return v56
end
function u4.IsFiniteVector3(p57) --[[Anonymous function at line 137]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v58 = u4.IsFinite(p57.X) and u4.IsFinite(p57.Y)
    if v58 then
        v58 = u4.IsFinite(p57.Z)
    end
    return v58
end
function u4.GetAngleBetweenXZVectors(p59, p60) --[[Anonymous function at line 142]]
    local v61 = p60.X * p59.Z - p60.Z * p59.X
    local v62 = p60.X * p59.X + p60.Z * p59.Z
    return math.atan2(v61, v62)
end
function u4.RotateVectorByAngleAndRound(p63, p64, p65) --[[Anonymous function at line 146]]
    if p63.Magnitude <= 0 then
        return 0
    end
    local v66 = p63.Unit
    local v67 = v66.Z
    local v68 = v66.X
    local v69 = math.atan2(v67, v68)
    local v70 = v66.Z
    local v71 = v66.X
    local v72 = (math.atan2(v70, v71) + p64) / p65 + 0.5
    return math.floor(v72) * p65 - v69
end
function u4.GamepadLinearToCurve(p73) --[[Anonymous function at line 177]]
    local v74 = Vector2.new
    local v75 = p73.X
    local v76 = v75 < 0 and -1 or 1
    local v77 = math.abs(v75)
    local v78 = (math.abs(v77) * 2 - 1) * 1.1 - 0.1
    local v79 = math.clamp(v78, -1, 1)
    local v80
    if v79 >= 0 then
        v80 = v79 * 0.35 / (0.35 - v79 + 1)
    else
        v80 = -(-v79 * 0.8 / (v79 + 0.8 + 1))
    end
    local v81 = (v80 / 2 + 0.5) * v76
    local v82 = math.clamp(v81, -1, 1)
    local v83 = p73.Y
    local v84 = v83 < 0 and -1 or 1
    local v85 = math.abs(v83)
    local v86 = (math.abs(v85) * 2 - 1) * 1.1 - 0.1
    local v87 = math.clamp(v86, -1, 1)
    local v88
    if v87 >= 0 then
        v88 = v87 * 0.35 / (0.35 - v87 + 1)
    else
        v88 = -(-v87 * 0.8 / (v87 + 0.8 + 1))
    end
    local v89 = (v88 / 2 + 0.5) * v84
    return v74(v82, (math.clamp(v89, -1, 1)))
end
function u4.ConvertCameraModeEnumToStandard(p90) --[[Anonymous function at line 191]]
    if p90 == Enum.TouchCameraMovementMode.Default then
        return Enum.ComputerCameraMovementMode.Follow
    elseif p90 == Enum.ComputerCameraMovementMode.Default then
        return Enum.ComputerCameraMovementMode.Classic
    elseif p90 == Enum.TouchCameraMovementMode.Classic or (p90 == Enum.DevTouchCameraMovementMode.Classic or (p90 == Enum.DevComputerCameraMovementMode.Classic or p90 == Enum.ComputerCameraMovementMode.Classic)) then
        return Enum.ComputerCameraMovementMode.Classic
    elseif p90 == Enum.TouchCameraMovementMode.Follow or (p90 == Enum.DevTouchCameraMovementMode.Follow or (p90 == Enum.DevComputerCameraMovementMode.Follow or p90 == Enum.ComputerCameraMovementMode.Follow)) then
        return Enum.ComputerCameraMovementMode.Follow
    elseif p90 == Enum.TouchCameraMovementMode.Orbital or (p90 == Enum.DevTouchCameraMovementMode.Orbital or (p90 == Enum.DevComputerCameraMovementMode.Orbital or p90 == Enum.ComputerCameraMovementMode.Orbital)) then
        return Enum.ComputerCameraMovementMode.Orbital
    elseif p90 == Enum.ComputerCameraMovementMode.CameraToggle or p90 == Enum.DevComputerCameraMovementMode.CameraToggle then
        return Enum.ComputerCameraMovementMode.CameraToggle
    elseif p90 == Enum.DevTouchCameraMovementMode.UserChoice or p90 == Enum.DevComputerCameraMovementMode.UserChoice then
        return Enum.DevComputerCameraMovementMode.UserChoice
    else
        return Enum.ComputerCameraMovementMode.Classic
    end
end
local u91 = ""
local u92 = nil
function u4.setMouseIconOverride(p93) --[[Anonymous function at line 252]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u92
        [3] = u91
    --]]
    local v94 = u1.LocalPlayer
    if not v94 then
        u1:GetPropertyChangedSignal("LocalPlayer"):Wait()
        v94 = u1.LocalPlayer
    end
    assert(v94)
    local v95 = v94:GetMouse()
    if v95.Icon ~= u92 then
        u91 = v95.Icon
    end
    v95.Icon = p93
    u92 = p93
end
function u4.restoreMouseIcon() --[[Anonymous function at line 263]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u92
        [3] = u91
    --]]
    local v96 = u1.LocalPlayer
    if not v96 then
        u1:GetPropertyChangedSignal("LocalPlayer"):Wait()
        v96 = u1.LocalPlayer
    end
    assert(v96)
    local v97 = v96:GetMouse()
    if v97.Icon == u92 then
        v97.Icon = u91
    end
    u92 = nil
end
local u98 = Enum.MouseBehavior.Default
local u99 = nil
function u4.setMouseBehaviorOverride(p100) --[[Anonymous function at line 274]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u99
        [3] = u98
    --]]
    if u2.MouseBehavior ~= u99 then
        u98 = u2.MouseBehavior
    end
    u2.MouseBehavior = p100
    u99 = p100
end
function u4.restoreMouseBehavior() --[[Anonymous function at line 283]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u99
        [3] = u98
    --]]
    if u2.MouseBehavior == u99 then
        u2.MouseBehavior = u98
    end
    u99 = nil
end
local u101 = Enum.RotationType.MovementRelative
local u102 = nil
function u4.setRotationTypeOverride(p103) --[[Anonymous function at line 292]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u102
        [3] = u101
    --]]
    if u3.RotationType ~= u102 then
        u101 = u3.RotationType
    end
    u3.RotationType = p103
    u102 = p103
end
function u4.restoreRotationType() --[[Anonymous function at line 301]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u102
        [3] = u101
    --]]
    if u3.RotationType == u102 then
        u3.RotationType = u101
    end
    u102 = nil
end
return u4