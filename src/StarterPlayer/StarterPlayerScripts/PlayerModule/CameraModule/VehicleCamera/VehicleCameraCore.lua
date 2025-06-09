-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(script.Parent.Parent.CameraUtils)
local u2 = require(script.Parent.VehicleCameraConfig)
local u3 = v1.map
local u4 = v1.mapClamp
local u5 = v1.sanitizeAngle
local u6 = {}
u6.__index = u6
function u6.new(p7, p8, p9) --[[Anonymous function at line 36]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v10 = {
        ["fRising"] = p7,
        ["fFalling"] = p8,
        ["g"] = p9,
        ["p"] = p9,
        ["v"] = p9 * 0
    }
    local v11 = u6
    return setmetatable(v10, v11)
end
function u6.step(p12, p13) --[[Anonymous function at line 46]]
    local v14 = p12.fRising
    local v15 = p12.fFalling
    local v16 = p12.g
    local v17 = p12.p
    local v18 = p12.v
    local v19 = 6.283185307179586
    if v18 > 0 then
        v15 = v14 or v15
    end
    local v20 = v19 * v15
    local v21 = v17 - v16
    local v22 = -v20 * p13
    local v23 = math.exp(v22)
    local v24 = (v21 * (1 + v20 * p13) + v18 * p13) * v23 + v16
    local v25 = (v18 * (1 - v20 * p13) - v21 * (v20 * v20 * p13)) * v23
    p12.p = v24
    p12.v = v25
    return v24
end
local u26 = {}
u26.__index = u26
function u26.new(p27) --[[Anonymous function at line 72]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u2
        [4] = u26
    --]]
    local v28 = typeof(p27) == "CFrame"
    assert(v28)
    local v29 = {}
    local _, v30 = p27:toEulerAnglesYXZ()
    v29.yawG = u5(v30)
    local _, v31 = p27:toEulerAnglesYXZ()
    v29.yawP = u5(v31)
    v29.yawV = 0
    v29.pitchG = u5((p27:toEulerAnglesYXZ()))
    v29.pitchP = u5((p27:toEulerAnglesYXZ()))
    v29.pitchV = 0
    v29.fSpringYaw = u6.new(u2.yawReponseDampingRising, u2.yawResponseDampingFalling, 0)
    v29.fSpringPitch = u6.new(u2.pitchReponseDampingRising, u2.pitchResponseDampingFalling, 0)
    local v32 = u26
    return setmetatable(v29, v32)
end
function u26.setGoal(p33, p34) --[[Anonymous function at line 99]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v35 = typeof(p34) == "CFrame"
    assert(v35)
    local _, v36 = p34:toEulerAnglesYXZ()
    p33.yawG = u5(v36)
    p33.pitchG = u5((p34:toEulerAnglesYXZ()))
end
function u26.getCFrame(p37) --[[Anonymous function at line 106]]
    return CFrame.fromEulerAnglesYXZ(p37.pitchP, p37.yawP, 0)
end
function u26.step(p38, p39, p40, p41, p42) --[[Anonymous function at line 110]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u2
        [4] = u5
    --]]
    local v43 = typeof(p39) == "number"
    assert(v43)
    local v44 = typeof(p41) == "number"
    assert(v44)
    local v45 = typeof(p40) == "number"
    assert(v45)
    local v46 = typeof(p42) == "number"
    assert(v46)
    local v47 = p38.fSpringYaw
    local v48 = p38.fSpringPitch
    local v49 = u4
    local v50 = u3(p42, 0, 1, p41, 0)
    local v51 = u2.cutoffMinAngularVelYaw
    local v52 = math.rad(v51)
    local v53 = u2.cutoffMaxAngularVelYaw
    v47.g = v49(v50, v52, math.rad(v53), 1, 0)
    local v54 = u4
    local v55 = u3(p42, 0, 1, p40, 0)
    local v56 = u2.cutoffMinAngularVelPitch
    local v57 = math.rad(v56)
    local v58 = u2.cutoffMaxAngularVelPitch
    v48.g = v54(v55, v57, math.rad(v58), 1, 0)
    local v59 = 6.283185307179586 * u2.yawStiffness * v47:step(p39)
    local v60 = 6.283185307179586 * u2.pitchStiffness * v48:step(p39) * u3(p42, 0, 1, 1, u2.firstPersonResponseMul)
    local v61 = v59 * u3(p42, 0, 1, 1, u2.firstPersonResponseMul)
    local v62 = p38.yawG
    local v63 = p38.yawP
    local v64 = p38.yawV
    local v65 = u5(v63 - v62)
    local v66 = -v61 * p39
    local v67 = math.exp(v66)
    local v68 = u5((v65 * (1 + v61 * p39) + v64 * p39) * v67 + v62)
    local v69 = (v64 * (1 - v61 * p39) - v65 * (v61 * v61 * p39)) * v67
    p38.yawP = v68
    p38.yawV = v69
    local v70 = p38.pitchG
    local v71 = p38.pitchP
    local v72 = p38.pitchV
    local v73 = u5(v71 - v70)
    local v74 = -v60 * p39
    local v75 = math.exp(v74)
    local v76 = u5((v73 * (1 + v60 * p39) + v72 * p39) * v75 + v70)
    local v77 = (v72 * (1 - v60 * p39) - v73 * (v60 * v60 * p39)) * v75
    p38.pitchP = v76
    p38.pitchV = v77
    return p38:getCFrame()
end
local u78 = {}
u78.__index = u78
function u78.new(p79) --[[Anonymous function at line 167]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u78
    --]]
    local v80 = {
        ["vrs"] = u26.new(p79)
    }
    local v81 = u78
    return setmetatable(v80, v81)
end
function u78.step(p82, p83, p84, p85, p86) --[[Anonymous function at line 173]]
    return p82.vrs:step(p83, p84, p85, p86)
end
function u78.setTransform(p87, p88) --[[Anonymous function at line 177]]
    p87.vrs:setGoal(p88)
end
return u78