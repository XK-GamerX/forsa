-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {}
u1.__index = u1
function u1.new() --[[Anonymous function at line 14]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    v3.enabled = false
    v3.moveVector = Vector3.new(0, 0, 0)
    v3.moveVectorIsCameraRelative = true
    v3.isJumping = false
    return v3
end
function u1.OnRenderStepped(_, _) --[[Anonymous function at line 23]] end
function u1.GetMoveVector(p4) --[[Anonymous function at line 27]]
    return p4.moveVector
end
function u1.IsMoveVectorCameraRelative(p5) --[[Anonymous function at line 31]]
    return p5.moveVectorIsCameraRelative
end
function u1.GetIsJumping(p6) --[[Anonymous function at line 35]]
    return p6.isJumping
end
function u1.Enable(_, _) --[[Anonymous function at line 41]]
    error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.")
    return false
end
return u1