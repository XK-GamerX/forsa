-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

Vector2.new(0, 0)
local u1 = 0
local u2 = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
local u3 = game:GetService("Players")
local u4 = game:GetService("VRService")
local u5 = require(script.Parent:WaitForChild("CameraInput"))
local u6 = require(script.Parent:WaitForChild("CameraUtils"))
local u7 = require(script.Parent:WaitForChild("BaseCamera"))
local u8 = setmetatable({}, u7)
u8.__index = u8
function u8.new() --[[Anonymous function at line 35]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u6
    --]]
    local v9 = u7.new()
    local v10 = u8
    local v11 = setmetatable(v9, v10)
    v11.isFollowCamera = false
    v11.isCameraToggle = false
    v11.lastUpdate = tick()
    v11.cameraToggleSpring = u6.Spring.new(5, 0)
    return v11
end
function u8.GetCameraToggleOffset(p12, p13) --[[Anonymous function at line 46]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    if not p12.isCameraToggle then
        return Vector3.new()
    end
    local v14 = p12.currentSubjectDistance
    if u5.getTogglePan() then
        local v15 = p12.cameraToggleSpring
        local v16 = u6.map(v14, 0.5, p12.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1)
        v15.goal = math.clamp(v16, 0, 1)
    else
        p12.cameraToggleSpring.goal = 0
    end
    local v17 = u6.map(v14, 0.5, 64, 0, 1)
    local v18 = math.clamp(v17, 0, 1) + 1
    local v19 = p12.cameraToggleSpring:step(p13) * v18
    return Vector3.new(0, v19, 0)
end
function u8.SetCameraMovementMode(p20, p21) --[[Anonymous function at line 64]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.SetCameraMovementMode(p20, p21)
    p20.isFollowCamera = p21 == Enum.ComputerCameraMovementMode.Follow
    p20.isCameraToggle = p21 == Enum.ComputerCameraMovementMode.CameraToggle
end
function u8.Update(p22) --[[Anonymous function at line 71]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u5
        [4] = u1
        [5] = u6
        [6] = u4
    --]]
    local v23 = tick()
    local v24 = v23 - p22.lastUpdate
    local v25 = workspace.CurrentCamera
    local v26 = v25.CFrame
    local v27 = v25.Focus
    local v28
    if p22.resetCameraAngle then
        local v29 = p22:GetHumanoidRootPart()
        if v29 then
            v28 = (v29.CFrame * u2).lookVector
        else
            v28 = u2.lookVector
        end
        p22.resetCameraAngle = false
    else
        v28 = nil
    end
    local v30 = u3.LocalPlayer
    local v31 = p22:GetHumanoid()
    local v32 = v25.CameraSubject
    local v33
    if v32 then
        v33 = v32:IsA("VehicleSeat")
    else
        v33 = v32
    end
    local v34
    if v32 then
        v34 = v32:IsA("SkateboardPlatform")
    else
        v34 = v32
    end
    local v35
    if v31 then
        v35 = v31:GetState() == Enum.HumanoidStateType.Climbing
    else
        v35 = v31
    end
    if p22.lastUpdate == nil or v24 > 1 then
        p22.lastCameraTransform = nil
    end
    local v36 = u5.getRotation()
    p22:StepZoom()
    local v37 = p22:GetCameraHeight()
    if u5.getRotation() ~= Vector2.new() then
        u1 = 0
        p22.lastUserPanCamera = tick()
    end
    local v38 = v23 - p22.lastUserPanCamera < 2
    local v39 = p22:GetSubjectPosition()
    if v39 and (v30 and v25) then
        local v40 = p22:GetCameraToSubjectDistance()
        local v41 = v40 < 0.5 and 0.5 or v40
        if p22:IsInFirstPerson() then
            if u5.getRotation() == Vector2.new() and p22.lastCameraTransform then
                local v42 = p22:IsInFirstPerson()
                if (v33 or (v34 or p22.isFollowCamera and v35)) and (p22.lastUpdate and (v31 and v31.Torso)) then
                    if v42 then
                        if p22.lastSubjectCFrame and (v33 or v34) and v32:IsA("BasePart") then
                            local v43 = -u6.GetAngleBetweenXZVectors(p22.lastSubjectCFrame.lookVector, v32.CFrame.lookVector)
                            if u6.IsFinite(v43) then
                                v36 = v36 + Vector2.new(v43, 0)
                            end
                            u1 = 0
                        end
                    elseif not v38 then
                        local v44 = v31.Torso.CFrame.lookVector
                        local v45 = u1 + 3.839724354387525 * v24
                        u1 = math.clamp(v45, 0, 4.363323129985824)
                        local v46 = u1 * v24
                        local v47 = math.clamp(v46, 0, 1)
                        local v48 = p22:IsInFirstPerson() and not (p22.isFollowCamera and p22.isClimbing) and 1 or v47
                        local v49 = u6.GetAngleBetweenXZVectors(v44, p22:GetCameraLookVector())
                        if u6.IsFinite(v49) and math.abs(v49) > 0.0001 then
                            v36 = v36 + Vector2.new(v49 * v48, 0)
                        end
                    end
                elseif p22.isFollowCamera and not (v42 or (v38 or u4.VREnabled)) then
                    local v50 = -(p22.lastCameraTransform.p - v39)
                    local v51 = u6.GetAngleBetweenXZVectors(v50, p22:GetCameraLookVector())
                    if u6.IsFinite(v51) and (math.abs(v51) > 0.0001 and math.abs(v51) > 0.4 * v24) then
                        v36 = v36 + Vector2.new(v51, 0)
                    end
                end
            end
        else
            local v52 = p22:CalculateNewLookCFrameFromArg(v28, v36)
            local v53 = Vector3.new()
            local v54 = v53.X * v52.RightVector + v53.Y * v52.UpVector + v53.Z * v52.LookVector
            if u6.IsFiniteVector3(v54) then
                v39 = v39 + v54
            end
        end
        local v55
        if p22.isFollowCamera then
            local v56 = p22:CalculateNewLookVectorFromArg(v28, v36)
            if u4.VREnabled then
                v55 = p22:GetVRFocus(v39, v24)
            else
                v55 = CFrame.new(v39)
            end
            v26 = CFrame.new(v55.p - v41 * v56, v55.p) + Vector3.new(0, v37, 0)
        else
            local v57 = u4.VREnabled
            if v57 then
                v55 = p22:GetVRFocus(v39, v24)
            else
                v55 = CFrame.new(v39)
            end
            local v58 = v55.p
            if v57 and not p22:IsInFirstPerson() then
                local v59 = (v39 - v25.CFrame.p).magnitude
                if v41 < v59 or v36.x ~= 0 then
                    local v60 = math.min(v59, v41)
                    local v61 = p22:CalculateNewLookVectorFromArg(nil, v36) * v60
                    local v62 = v58 - v61
                    local v63 = v25.CFrame.lookVector
                    if v36.x == 0 then
                        v61 = v63
                    end
                    local v64 = v62.x + v61.x
                    local v65 = v62.y
                    local v66 = v62.z + v61.z
                    local v67 = Vector3.new(v64, v65, v66)
                    v26 = CFrame.new(v62, v67) + Vector3.new(0, v37, 0)
                end
            else
                local v68 = p22:CalculateNewLookVectorFromArg(v28, v36)
                v26 = CFrame.new(v58 - v41 * v68, v58)
            end
        end
        local v69 = p22:GetCameraToggleOffset(v24)
        v27 = v55 + v69
        v26 = v26 + v69
        p22.lastCameraTransform = v26
        p22.lastCameraFocus = v27
        if (v33 or v34) and v32:IsA("BasePart") then
            p22.lastSubjectCFrame = v32.CFrame
        else
            p22.lastSubjectCFrame = nil
        end
    end
    p22.lastUpdate = v23
    return v26, v27
end
return u8