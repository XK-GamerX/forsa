-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = require(script.Parent:WaitForChild("CameraUtils"))
local u2 = {}
u2.__index = u2
function u2.new() --[[Anonymous function at line 14]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    v4.transparencyDirty = false
    v4.enabled = false
    v4.lastTransparency = nil
    v4.descendantAddedConn = nil
    v4.descendantRemovingConn = nil
    v4.toolDescendantAddedConns = {}
    v4.toolDescendantRemovingConns = {}
    v4.cachedParts = {}
    return v4
end
local u5 = { "Left Arm", "Right Arm", "Gun" }
function u2.HasToolAncestor(p6, p7) --[[Anonymous function at line 31]]
    if p7.Parent == nil then
        return false
    end
    local v8 = p7.Parent
    assert(v8, "")
    return p7.Parent:IsA("Tool") or p6:HasToolAncestor(p7.Parent)
end
function u2.IsValidPartToModify(p9, p10) --[[Anonymous function at line 37]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p10:IsA("BasePart") or p10:IsA("Decal") then
        if table.find(u5, p10.Name) == nil then
            return not p9:HasToolAncestor(p10)
        else
            return false
        end
    else
        return false
    end
end
function u2.CachePartsRecursive(p11, p12) --[[Anonymous function at line 45]]
    if p12 then
        if p11:IsValidPartToModify(p12) then
            p11.cachedParts[p12] = true
            p11.transparencyDirty = true
        end
        for _, v13 in pairs(p12:GetChildren()) do
            p11:CachePartsRecursive(v13)
        end
    end
end
function u2.TeardownTransparency(p14) --[[Anonymous function at line 57]]
    for v15, _ in pairs(p14.cachedParts) do
        v15.LocalTransparencyModifier = 0
    end
    p14.cachedParts = {}
    p14.transparencyDirty = true
    p14.lastTransparency = nil
    if p14.descendantAddedConn then
        p14.descendantAddedConn:disconnect()
        p14.descendantAddedConn = nil
    end
    if p14.descendantRemovingConn then
        p14.descendantRemovingConn:disconnect()
        p14.descendantRemovingConn = nil
    end
    for v16, v17 in pairs(p14.toolDescendantAddedConns) do
        v17:Disconnect()
        p14.toolDescendantAddedConns[v16] = nil
    end
    for v18, v19 in pairs(p14.toolDescendantRemovingConns) do
        v19:Disconnect()
        p14.toolDescendantRemovingConns[v18] = nil
    end
end
function u2.SetupTransparency(u20, u21) --[[Anonymous function at line 83]]
    u20:TeardownTransparency()
    if u20.descendantAddedConn then
        u20.descendantAddedConn:disconnect()
    end
    u20.descendantAddedConn = u21.DescendantAdded:Connect(function(p22) --[[Anonymous function at line 87]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u21
        --]]
        if u20:IsValidPartToModify(p22) then
            u20.cachedParts[p22] = true
            u20.transparencyDirty = true
        elseif p22:IsA("Tool") then
            if u20.toolDescendantAddedConns[p22] then
                u20.toolDescendantAddedConns[p22]:Disconnect()
            end
            u20.toolDescendantAddedConns[p22] = p22.DescendantAdded:Connect(function(p23) --[[Anonymous function at line 95]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20.cachedParts[p23] = nil
                if p23:IsA("BasePart") or p23:IsA("Decal") then
                    p23.LocalTransparencyModifier = 0
                end
            end)
            if u20.toolDescendantRemovingConns[p22] then
                u20.toolDescendantRemovingConns[p22]:disconnect()
            end
            u20.toolDescendantRemovingConns[p22] = p22.DescendantRemoving:Connect(function(p24) --[[Anonymous function at line 103]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u20
                --]]
                wait()
                if u21 and (p24 and (p24:IsDescendantOf(u21) and u20:IsValidPartToModify(p24))) then
                    u20.cachedParts[p24] = true
                    u20.transparencyDirty = true
                end
            end)
        end
    end)
    if u20.descendantRemovingConn then
        u20.descendantRemovingConn:disconnect()
    end
    u20.descendantRemovingConn = u21.DescendantRemoving:connect(function(p25) --[[Anonymous function at line 115]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if u20.cachedParts[p25] then
            u20.cachedParts[p25] = nil
            p25.LocalTransparencyModifier = 0
        end
    end)
    u20:CachePartsRecursive(u21)
end
function u2.Enable(p26, p27) --[[Anonymous function at line 126]]
    if p26.enabled ~= p27 then
        p26.enabled = p27
    end
end
function u2.SetSubject(p28, p29) --[[Anonymous function at line 132]]
    local v30
    if p29 and p29:IsA("Humanoid") then
        v30 = p29.Parent
    else
        v30 = nil
    end
    if p29 and (p29:IsA("VehicleSeat") and p29.Occupant) then
        v30 = p29.Occupant.Parent
    end
    if v30 then
        p28:SetupTransparency(v30)
    else
        p28:TeardownTransparency()
    end
end
function u2.Update(p31, p32) --[[Anonymous function at line 147]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v33 = workspace.CurrentCamera
    if v33 and p31.enabled then
        local v34 = (v33.Focus.p - v33.CoordinateFrame.p).magnitude
        local v35 = v34 < 2 and 1 - (v34 - 0.5) / 1.5 or 0
        local v36 = v35 < 0.5 and 0 or v35
        if p31.lastTransparency and (v36 < 1 and p31.lastTransparency < 0.95) then
            local v37 = v36 - p31.lastTransparency
            local v38 = 2.8 * p32
            local v39 = -v38
            local v40 = math.clamp(v37, v39, v38)
            v36 = p31.lastTransparency + v40
        else
            p31.transparencyDirty = true
        end
        local v41 = u1.Round(v36, 2)
        local v42 = math.clamp(v41, 0, 1)
        if p31.transparencyDirty or p31.lastTransparency ~= v42 then
            for v43, _ in pairs(p31.cachedParts) do
                v43.LocalTransparencyModifier = v42
            end
            p31.transparencyDirty = false
            p31.lastTransparency = v42
        end
    end
end
return u2