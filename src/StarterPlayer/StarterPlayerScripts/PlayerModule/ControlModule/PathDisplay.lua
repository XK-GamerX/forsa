-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = {
    ["spacing"] = 8,
    ["image"] = "rbxasset://textures/Cursors/Gamepad/Pointer.png",
    ["imageSize"] = Vector2.new(2, 2)
}
local u2 = Instance.new("Model")
u2.Name = "PathDisplayPoints"
local v3 = Instance.new("Part")
v3.Anchored = true
v3.CanCollide = false
v3.Transparency = 1
v3.Name = "PathDisplayAdornee"
v3.CFrame = CFrame.new(0, 0, 0)
v3.Parent = u2
local u4 = 30
local u5 = {}
local u6 = {}
local u7 = {}
for v8 = 1, u4 do
    local v9 = Instance.new("ImageHandleAdornment")
    v9.Archivable = false
    v9.Adornee = v3
    v9.Image = u1.image
    v9.Size = u1.imageSize
    u5[v8] = v9
end
local function u19(p10, _) --[[Anonymous function at line 50]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
    --]]
    if u4 == 0 then
        return nil
    end
    local v11 = Ray.new(p10 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0))
    local v12, v13, v14 = workspace:FindPartOnRayWithIgnoreList(v11, { game.Players.LocalPlayer.Character, workspace.CurrentCamera })
    if not v12 then
        return nil
    end
    local v15 = CFrame.new(v13, v13 + v14)
    local v16 = u5[1]
    if v16 then
        local v17 = u5
        local v18 = u4
        u5[1] = u5[u4]
        v17[v18] = nil
        u4 = u4 - 1
    else
        v16 = nil
    end
    v16.CFrame = v15
    v16.Parent = u2
    return v16
end
function u1.setCurrentPoints(p20) --[[Anonymous function at line 69]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if typeof(p20) == "table" then
        u6 = p20
    else
        u6 = {}
    end
end
function u1.clearRenderedPath() --[[Anonymous function at line 77]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u5
        [4] = u2
    --]]
    for _, v21 in ipairs(u7) do
        v21.Parent = nil
        u4 = u4 + 1
        u5[u4] = v21
    end
    u7 = {}
    u2.Parent = nil
end
function u1.renderPath() --[[Anonymous function at line 86]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u6
        [3] = u7
        [4] = u19
        [5] = u2
    --]]
    u1.clearRenderedPath()
    if u6 and #u6 ~= 0 then
        local v22 = #u6
        u7[1] = u19(u6[v22], true)
        if u7[1] then
            local v23 = 0
            while true do
                local v24 = u6[v22]
                local v25 = u6[v22 - 1]
                if v22 < 2 then
                    break
                end
                local v26 = v25 - v24
                local v27 = v26.magnitude
                if v27 < v23 then
                    v23 = v23 - v27
                    v22 = v22 - 1
                else
                    local v28 = u19(v24 + v26.unit * v23, false)
                    if v28 then
                        u7[#u7 + 1] = v28
                    end
                    v23 = v23 + u1.spacing
                end
            end
            u2.Parent = workspace.CurrentCamera
        end
    else
        return
    end
end
return u1