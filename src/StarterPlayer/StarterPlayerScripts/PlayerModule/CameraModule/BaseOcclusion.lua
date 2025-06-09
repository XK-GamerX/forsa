-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {}
u1.__index = u1
setmetatable(u1, {
    ["__call"] = function(_, ...) --[[Function name: __call, line 10]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1.new(...)
    end
})
function u1.new() --[[Anonymous function at line 15]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    return setmetatable({}, v2)
end
function u1.CharacterAdded(_, _, _) --[[Anonymous function at line 21]] end
function u1.CharacterRemoving(_, _, _) --[[Anonymous function at line 25]] end
function u1.OnCameraSubjectChanged(_, _) --[[Anonymous function at line 28]] end
function u1.GetOcclusionMode(_) --[[Anonymous function at line 32]]
    warn("BaseOcclusion GetOcclusionMode must be overridden by derived classes")
    return nil
end
function u1.Enable(_, _) --[[Anonymous function at line 38]]
    warn("BaseOcclusion Enable must be overridden by derived classes")
end
function u1.Update(_, _, p3, p4) --[[Anonymous function at line 42]]
    warn("BaseOcclusion Update must be overridden by derived classes")
    return p3, p4
end
return u1