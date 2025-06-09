-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {}
u1.__index = u1
function u1.new() --[[Anonymous function at line 25]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    v3._connections = {}
    return v3
end
function u1.connect(p4, p5, p6, p7) --[[Anonymous function at line 33]]
    if p4._connections[p5] then
        p4._connections[p5]()
    end
    local u8 = p6:Connect(p7)
    p4._connections[p5] = function() --[[Anonymous function at line 39]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8:Disconnect()
    end
end
function u1.connectManual(p9, p10, p11) --[[Anonymous function at line 42]]
    if p9._connections[p10] then
        p9._connections[p10]()
    end
    p9._connections[p10] = p11
end
function u1.disconnect(p12, p13) --[[Anonymous function at line 49]]
    if p12._connections[p13] then
        p12._connections[p13]()
        p12._connections[p13] = nil
    end
end
function u1.disconnectAll(p14) --[[Anonymous function at line 56]]
    for _, v15 in pairs(p14._connections) do
        v15()
    end
    p14._connections = {}
end
return u1