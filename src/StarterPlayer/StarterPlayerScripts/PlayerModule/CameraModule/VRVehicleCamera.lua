-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1, v2 = pcall(function() --[[Anonymous function at line 9]]
    return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera2")
end)
local u3 = v1 and v2
local u4 = { 0, 30 }
local u5 = UserSettings():GetService("UserGameSettings")
local u6 = require(script.Parent:WaitForChild("VRBaseCamera"))
local u7 = require(script.Parent:WaitForChild("CameraInput"))
local u8 = require(script.Parent:WaitForChild("CameraUtils"))
require(script.Parent:WaitForChild("VehicleCamera"))
local u9 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"))
local u10 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"))
local v11 = game:GetService("Players")
local u12 = game:GetService("RunService")
local u13 = game:GetService("VRService")
local u14 = v11.LocalPlayer
local u15 = u8.Spring
local u16 = u8.mapClamp
local u17 = u8.sanitizeAngle
local u18 = 0.016666666666666666
local u19 = setmetatable({}, u6)
u19.__index = u19
function u19.new() --[[Anonymous function at line 59]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u19
        [3] = u12
        [4] = u18
    --]]
    local v20 = u6.new()
    local v21 = u19
    local v22 = setmetatable(v20, v21)
    v22:Reset()
    u12.Stepped:Connect(function(_, p23) --[[Anonymous function at line 64]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18 = p23
    end)
    return v22
end
function u19.Reset(p24) --[[Anonymous function at line 72]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u15
        [4] = u10
        [5] = u8
        [6] = u4
    --]]
    p24.vehicleCameraCore = u9.new(p24:GetSubjectCFrame())
    if u3 then
        p24.pitchSpring = u15.new(0, 0)
    else
        local v25 = u15.new
        local v26 = u10.pitchBaseAngle
        p24.pitchSpring = v25(0, -math.rad(v26))
    end
    p24.yawSpring = u15.new(0, 0)
    if u3 then
        p24.lastPanTick = 0
        p24.currentDriftAngle = 0
        p24.needsReset = true
    end
    local v27 = workspace.CurrentCamera
    local v28
    if v27 then
        v28 = v27.CameraSubject
    else
        v28 = v27
    end
    assert(v27, "VRVehicleCamera initialization error")
    assert(v28)
    assert(v28:IsA("VehicleSeat"))
    local v29 = v28:GetConnectedParts(true)
    local v30, v31 = u8.getLooseBoundingSphere(v29)
    p24.assemblyRadius = math.max(v31, 5)
    p24.assemblyOffset = v28.CFrame:Inverse() * v30
    p24.gamepadZoomLevels = {}
    for _, v32 in u4 do
        local v33 = p24.gamepadZoomLevels
        local v34 = v32 * p24.headScale * p24.assemblyRadius / 10
        table.insert(v33, v34)
    end
    p24.lastCameraFocus = nil
    p24:SetCameraToSubjectDistance(p24.gamepadZoomLevels[#p24.gamepadZoomLevels])
end
function u19._StepRotation(p35, p36, p37) --[[Anonymous function at line 112]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u7
        [3] = u10
        [4] = u16
    --]]
    local v38 = p35.yawSpring
    local v39 = p35.pitchSpring
    local v40 = -p35:getRotation(p36)
    v38.pos = u17(v38.pos + v40)
    local v41 = u17
    local v42 = v39.pos
    v39.pos = v41((math.clamp(v42, -1.3962634015954636, 1.3962634015954636)))
    if u7.getRotationActivated() then
        p35.lastPanTick = os.clock()
    end
    local v43 = u10.pitchDeadzoneAngle
    local v44 = math.rad(v43)
    if os.clock() - p35.lastPanTick > u10.autocorrectDelay then
        local v45 = u16(p37, u10.autocorrectMinCarSpeed, u10.autocorrectMaxCarSpeed, 0, u10.autocorrectResponse)
        v38.freq = v45
        v39.freq = v45
        if v38.freq < 0.001 then
            v38.vel = 0
        end
        if v39.freq < 0.001 then
            v39.vel = 0
        end
        local v46 = u17(0 - v39.pos)
        if math.abs(v46) <= v44 then
            v39.goal = v39.pos
        else
            v39.goal = 0
        end
    else
        v38.freq = 0
        v38.vel = 0
        v39.freq = 0
        v39.vel = 0
        v39.goal = 0
    end
    return CFrame.fromEulerAnglesYXZ(v39:step(p36), v38:step(p36), 0)
end
function u19._GetThirdPersonLocalOffset(p47) --[[Anonymous function at line 176]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v48 = p47.assemblyOffset
    local v49 = p47.assemblyRadius * u10.verticalCenterOffset
    return v48 + Vector3.new(0, v49, 0)
end
function u19._GetFirstPersonLocalOffset(p50, p51) --[[Anonymous function at line 180]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v52 = u14.Character
    if v52 and v52.Parent then
        local v53 = v52:FindFirstChild("Head")
        if v53 and v53:IsA("BasePart") then
            return p51:Inverse() * v53.Position
        end
    end
    return p50:_GetThirdPersonLocalOffset()
end
function u19.Update(p54) --[[Anonymous function at line 194]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u18
        [3] = u14
        [4] = u13
    --]]
    if u3 then
        local v55 = u18
        u18 = 0
        p54:UpdateFadeFromBlack(v55)
        p54:UpdateEdgeBlur(u14, v55)
        if u13.ThirdPersonFollowCamEnabled then
            local v56, v57 = p54:UpdateStepRotation(v55)
            return v56, v57
        else
            local v58, v59 = p54:UpdateComfortCamera(v55)
            return v58, v59
        end
    else
        return p54:UpdateComfortCamera()
    end
end
function u19.addDrift(p60, p61, p62) --[[Anonymous function at line 217]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
    --]]
    local v63 = workspace.CurrentCamera
    local v64 = p60:GetCameraToSubjectDistance()
    local v65 = p60:GetSubjectVelocity()
    local v66 = p60:GetSubjectCFrame()
    require(u14:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"))
    if v65.Magnitude > 0.1 then
        local v67 = u13:GetUserCFrame(Enum.UserCFrame.Head)
        local v68 = v67.Rotation + v67.Position * v63.HeadScale
        local v69 = v63.CFrame * v68
        local _, v70, _ = v69:ToEulerAnglesYXZ()
        local _, v71, _ = v66:ToEulerAnglesYXZ()
        local v72 = (v70 - p60.currentDriftAngle + 12.566370614359172) % 6.283185307179586
        if v72 > 3.141592653589793 then
            v72 = v72 - 6.283185307179586
        end
        local v73 = (v71 - p60.currentDriftAngle + 12.566370614359172) % 6.283185307179586
        if v73 > 3.141592653589793 then
            v73 = v73 - 6.283185307179586
        end
        local v74 = math.min(v73, v72)
        local v75 = math.max(v73, v72)
        local v76 = 0
        if v74 > 0 then
            v75 = v74
        elseif v75 >= 0 then
            v75 = v76
        end
        p60.currentDriftAngle = v75 + p60.currentDriftAngle
        local v77 = CFrame.fromEulerAnglesYXZ(0, p60.currentDriftAngle, 0).LookVector
        local v78 = v77.X
        local v79 = v77.Z
        local v80 = Vector3.new(v78, 0, v79).Unit * v64
        local v81 = p62.Position - v80
        p61 = p61:Lerp(CFrame.new(v63.CFrame.Position + v81 - v69.Position) * v63.CFrame.Rotation, 0.01)
    end
    return p61, p62
end
function u19.UpdateRotationCamera(p82, p83) --[[Anonymous function at line 275]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
    --]]
    local v84 = workspace.CurrentCamera
    local v85
    if v84 then
        v85 = v84.CameraSubject
    else
        v85 = v84
    end
    local v86 = p82.vehicleCameraCore
    assert(v84)
    assert(v85)
    assert(v85:IsA("VehicleSeat"))
    local v87 = p82:GetSubjectCFrame()
    local v88 = p82:GetSubjectVelocity()
    local v89 = p82:GetSubjectRotVelocity()
    local v90 = v88:Dot(v87.ZVector)
    local v91 = math.abs(v90)
    local v92 = v87.YVector:Dot(v89)
    local v93 = math.abs(v92)
    local v94 = v87.XVector:Dot(v89)
    local v95 = math.abs(v94)
    local v96 = p82:GetCameraToSubjectDistance()
    local v97 = u16(v96, 0.5, p82.assemblyRadius, 1, 0)
    local v98 = p82:_GetThirdPersonLocalOffset():Lerp(p82:_GetFirstPersonLocalOffset(v87), v97)
    v86:setTransform(v87)
    local v99 = v86:step(p83, v95, v93, v97)
    local v100 = p82:_StepRotation(p83, v91)
    local v101 = p82:GetVRFocus(v87 * v98, p83) * v99 * v100
    local v102 = v101 * CFrame.new(0, 0, v96)
    if v88.Magnitude > 0.1 then
        p82:StartVREdgeBlur(u14)
    end
    return v102, v101
end
function u19.UpdateStepRotation(p103, p104) --[[Anonymous function at line 322]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u5
        [3] = u13
        [4] = u14
    --]]
    local v105 = workspace.CurrentCamera
    local v106 = p103.lastSubjectCFrame
    local v107 = p103:GetSubjectCFrame()
    local v108 = p103:GetSubjectVelocity()
    local v109 = p103:GetCameraToSubjectDistance()
    local v110 = u16(v109, 0.5, p103.assemblyRadius, 1, 0)
    local v111 = p103:_GetThirdPersonLocalOffset():Lerp(p103:_GetFirstPersonLocalOffset(v107), v110)
    local v112 = p103:GetVRFocus(v107 * v111, p104)
    local v113, v114 = p103:addDrift(v112:ToWorldSpace(p103:GetVRFocus(v106 * v111, p104):ToObjectSpace(v105.CFrame)), v112)
    local v115 = p103:getRotation(p104)
    local v116
    if math.abs(v115) > 0 then
        local v117 = v114:ToObjectSpace(v113)
        v116 = v114 * CFrame.Angles(0, -v115, 0) * v117
        if not u5.VRSmoothRotationEnabled then
            local v118 = u13:GetUserCFrame(Enum.UserCFrame.Head)
            local v119 = v118.Rotation + v118.Position * v105.HeadScale
            local v120 = v114 * v107.Rotation
            local v121 = v120:ToObjectSpace(v113 * v119)
            local v122 = v121.X
            local v123 = v121.Z
            local v124 = Vector3.new(v122, 0, v123).Unit:Dot(Vector3.new(0, 0, 1))
            local v125 = math.acos(v124)
            local v126 = v120:ToObjectSpace(v116 * v119)
            local v127 = v126.X
            local v128 = v126.Z
            local v129 = Vector3.new(v127, 0, v128).Unit:Dot(Vector3.new(0, 0, 1))
            if math.acos(v129) < v125 then
                if v115 < 0 then
                    v125 = v125 * -1
                end
                v116 = v114 * CFrame.Angles(0, -v125, 0) * v117
            end
        end
    else
        v116 = v113
    end
    if v108.Magnitude > 0.1 then
        p103:StartVREdgeBlur(u14)
    end
    if p103.needsReset then
        p103.needsReset = false
        u13:RecenterUserHeadCFrame()
        p103:StartFadeFromBlack()
        p103:ResetZoom()
    end
    if p103.recentered then
        v116 = v114 * v107.Rotation * CFrame.new(0, 0, v109)
        p103.recentered = false
    end
    return v116, v116 * CFrame.new(0, 0, -v109)
end
function u19.UpdateComfortCamera(p130, p131) --[[Anonymous function at line 408]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u18
        [3] = u16
        [4] = u14
    --]]
    local v132 = workspace.CurrentCamera
    local v133
    if v132 then
        v133 = v132.CameraSubject
    else
        v133 = v132
    end
    local v134 = p130.vehicleCameraCore
    assert(v132)
    assert(v133)
    assert(v133:IsA("VehicleSeat"))
    if not u3 then
        p131 = u18
        u18 = 0
    end
    local v135 = p130:GetSubjectCFrame()
    local v136 = p130:GetSubjectVelocity()
    local v137 = p130:GetSubjectRotVelocity()
    local v138 = v136:Dot(v135.ZVector)
    math.abs(v138)
    local v139 = v135.YVector:Dot(v137)
    local v140 = math.abs(v139)
    local v141 = v135.XVector:Dot(v137)
    local v142 = math.abs(v141)
    local v143 = p130:StepZoom()
    local v144 = u16(v143, 0.5, p130.assemblyRadius, 1, 0)
    local v145 = p130:_GetThirdPersonLocalOffset():Lerp(p130:_GetFirstPersonLocalOffset(v135), v144)
    v134:setTransform(v135)
    local v146 = v134:step(p131, v142, v140, v144)
    if not u3 then
        p130:UpdateFadeFromBlack(p131)
    end
    local v147, v148
    if p130:IsInFirstPerson() then
        local v149 = v146.LookVector.X
        local v150 = v146.LookVector.Z
        local v151 = Vector3.new(v149, 0, v150).Unit
        local v152 = CFrame.new(v146.Position, v151)
        v147 = CFrame.new(v135 * v145) * v152
        v148 = v147 * CFrame.new(0, 0, v143)
        if u3 then
            if v136.Magnitude > 0.1 then
                p130:StartVREdgeBlur(u14)
            end
        else
            p130:StartVREdgeBlur(u14)
        end
    else
        v147 = CFrame.new(v135 * v145) * v146
        v148 = v147 * CFrame.new(0, 0, v143)
        if not p130.lastCameraFocus then
            p130.lastCameraFocus = v147
            p130.needsReset = true
        end
        local v153 = v147.Position - v132.CFrame.Position
        local v154 = v153.magnitude
        if v153.Unit:Dot(v132.CFrame.LookVector) > 0.56 and (v154 < 200 and not p130.needsReset) then
            v147 = p130.lastCameraFocus
            local v155 = v147.p
            local v156 = p130:GetCameraLookVector()
            local v157 = v156.X
            local v158 = v156.Z
            local v159 = p130:CalculateNewLookVectorFromArg(Vector3.new(v157, 0, v158).Unit, Vector2.new(0, 0))
            v148 = CFrame.new(v155 - v143 * v159, v155)
        else
            p130.lastCameraFocus = p130:GetVRFocus(v135.Position, p131)
            p130.needsReset = false
            p130:StartFadeFromBlack()
            p130:ResetZoom()
        end
        if not u3 then
            p130:UpdateEdgeBlur(u14, p131)
        end
    end
    return v148, v147
end
return u19