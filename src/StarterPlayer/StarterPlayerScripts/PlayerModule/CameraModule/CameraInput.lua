-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("ContextActionService")
local u2 = game:GetService("UserInputService")
local v3 = game:GetService("Players")
local v4 = game:GetService("RunService")
local u5 = UserSettings():GetService("UserGameSettings")
local u6 = game:GetService("VRService")
game:GetService("StarterGui")
local u7 = v3.LocalPlayer
local u8 = Enum.ContextActionPriority.Medium.Value
local u9 = Vector2.new(1, 0.77) * 0.008726646259971648
local u10 = Vector2.new(1, 0.77) * 0.12217304763960307
local u11 = Vector2.new(1, 0.66) * 0.017453292519943295
local u12 = Vector2.new(1, 0.77) * 0.06981317007977318
local v13, v14 = pcall(function() --[[Anonymous function at line 29]]
    return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen")
end)
local u15 = v13 and v14
local u16 = Instance.new("BindableEvent")
local u17 = Instance.new("BindableEvent")
local u18 = u16.Event
local u19 = u17.Event
u2.InputBegan:Connect(function(p20, p21) --[[Anonymous function at line 43]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    if not p21 and p20.UserInputType == Enum.UserInputType.MouseButton2 then
        u16:Fire()
    end
end)
u2.InputEnded:Connect(function(p22, _) --[[Anonymous function at line 49]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if p22.UserInputType == Enum.UserInputType.MouseButton2 then
        u17:Fire()
    end
end)
local function u26(p23) --[[Anonymous function at line 60]]
    local v24 = (math.abs(p23) - 0.1) / 0.9 * 2
    local v25 = (math.exp(v24) - 1) / 6.38905609893065
    return math.sign(p23) * math.clamp(v25, 0, 1)
end
local function u31(p27) --[[Anonymous function at line 74]]
    local v28 = workspace.CurrentCamera
    if not v28 then
        return p27
    end
    local v29 = v28.CFrame:ToEulerAnglesYXZ()
    if p27.Y * v29 >= 0 then
        return p27
    end
    local v30 = (1 - (math.abs(v29) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25
    return Vector2.new(1, v30) * p27
end
local function u38(p32) --[[Anonymous function at line 100]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v33 = u7:FindFirstChildOfClass("PlayerGui")
    if v33 then
        v33 = v33:FindFirstChild("TouchGui")
    end
    local v34
    if v33 then
        v34 = v33:FindFirstChild("TouchControlFrame")
    else
        v34 = v33
    end
    if v34 then
        v34 = v34:FindFirstChild("DynamicThumbstickFrame")
    end
    if not v34 then
        return false
    end
    if not v33.Enabled then
        return false
    end
    local v35 = v34.AbsolutePosition
    local v36 = v35 + v34.AbsoluteSize
    local v37
    if p32.X >= v35.X and (p32.Y >= v35.Y and p32.X <= v36.X) then
        v37 = p32.Y <= v36.Y
    else
        v37 = false
    end
    return v37
end
local u39 = 0.016666666666666666
v4.Stepped:Connect(function(_, p40) --[[Anonymous function at line 125]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    u39 = p40
end)
local v41 = {}
local u42 = {}
local u43 = 0
local u44 = {
    ["Thumbstick2"] = Vector2.new()
}
local u45 = {
    ["Left"] = 0,
    ["Right"] = 0,
    ["I"] = 0,
    ["O"] = 0
}
local u46 = {
    ["Movement"] = Vector2.new(),
    ["Wheel"] = 0,
    ["Pan"] = Vector2.new(),
    ["Pinch"] = 0
}
local u47 = {
    ["Move"] = Vector2.new(),
    ["Pinch"] = 0
}
local u48 = Instance.new("BindableEvent")
v41.gamepadZoomPress = u48.Event
local u49 = u6.VREnabled and Instance.new("BindableEvent") or nil
if u6.VREnabled then
    v41.gamepadReset = u49.Event
end
function v41.getRotationActivated() --[[Anonymous function at line 176]]
    --[[
    Upvalues:
        [1] = u43
        [2] = u44
    --]]
    return u43 > 0 and true or u44.Thumbstick2.Magnitude > 0
end
function v41.getRotation(p50) --[[Anonymous function at line 180]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u45
        [3] = u39
        [4] = u44
        [5] = u46
        [6] = u31
        [7] = u47
        [8] = u12
        [9] = u9
        [10] = u10
        [11] = u11
    --]]
    local v51 = Vector2.new(1, u5:GetCameraYInvertValue())
    local v52 = Vector2.new(u45.Right - u45.Left, 0) * u39
    local v53 = u44.Thumbstick2
    local v54 = u46.Movement
    local v55 = u46.Pan
    local v56 = u31(u47.Move)
    if p50 then
        v52 = Vector2.new()
    end
    return (v52 * 2.0943951023931953 + v53 * u12 + v54 * u9 + v55 * u10 + v56 * u11) * v51
end
function v41.getZoomDelta() --[[Anonymous function at line 204]]
    --[[
    Upvalues:
        [1] = u45
        [2] = u46
        [3] = u47
    --]]
    local v57 = u45.O - u45.I
    local v58 = -u46.Wheel + u46.Pinch
    local v59 = -u47.Pinch
    return v57 * 0.1 + v58 * 1 + v59 * 0.04
end
local function u62(_, _, p60) --[[Anonymous function at line 212]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u26
    --]]
    local v61 = p60.Position
    u44[p60.KeyCode.Name] = Vector2.new(u26(v61.X), -u26(v61.Y))
    return Enum.ContextActionResult.Pass
end
local function u65(_, p63, p64) --[[Anonymous function at line 228]]
    --[[
    Upvalues:
        [1] = u45
    --]]
    u45[p64.KeyCode.Name] = p63 == Enum.UserInputState.Begin and 1 or 0
end
local function u67(_, p66, _) --[[Anonymous function at line 232]]
    --[[
    Upvalues:
        [1] = u48
    --]]
    if p66 == Enum.UserInputState.Begin then
        u48:Fire()
    end
end
local function u69(_, p68, _) --[[Anonymous function at line 238]]
    --[[
    Upvalues:
        [1] = u49
    --]]
    if p68 == Enum.UserInputState.Begin then
        u49:Fire()
    end
end
local function u74() --[[Anonymous function at line 244]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u45
        [3] = u46
        [4] = u47
    --]]
    local v70 = {
        u44,
        u45,
        u46,
        u47
    }
    for _, v71 in pairs(v70) do
        for v72, v73 in pairs(v71) do
            if type(v73) == "boolean" then
                v71[v72] = false
            else
                v71[v72] = v71[v72] * 0
            end
        end
    end
end
local u75 = {}
local u76 = nil
local u77 = nil
local function u83(p78, p79) --[[Anonymous function at line 268]]
    --[[
    Upvalues:
        [1] = u76
        [2] = u38
        [3] = u43
        [4] = u75
    --]]
    local v80 = p78.UserInputType == Enum.UserInputType.Touch
    assert(v80)
    local v81 = p78.UserInputState == Enum.UserInputState.Begin
    assert(v81)
    if u76 == nil and (u38(p78.Position) and not p79) then
        u76 = p78
    else
        if not p79 then
            local v82 = u43 + 1
            u43 = math.max(0, v82)
        end
        u75[p78] = p79
    end
end
local function u88(p84, _) --[[Anonymous function at line 288]]
    --[[
    Upvalues:
        [1] = u76
        [2] = u75
        [3] = u77
        [4] = u43
    --]]
    local v85 = p84.UserInputType == Enum.UserInputType.Touch
    assert(v85)
    local v86 = p84.UserInputState == Enum.UserInputState.End
    assert(v86)
    if p84 == u76 then
        u76 = nil
    end
    if u75[p84] == false then
        u77 = nil
        local v87 = u43 - 1
        u43 = math.max(0, v87)
    end
    u75[p84] = nil
end
local function u100(p89, p90) --[[Anonymous function at line 307]]
    --[[
    Upvalues:
        [1] = u76
        [2] = u75
        [3] = u47
        [4] = u77
    --]]
    local v91 = p89.UserInputType == Enum.UserInputType.Touch
    assert(v91)
    local v92 = p89.UserInputState == Enum.UserInputState.Change
    assert(v92)
    if p89 == u76 then
        return
    else
        if u75[p89] == nil then
            u75[p89] = p90
        end
        local v93 = {}
        for v94, v95 in pairs(u75) do
            if not v95 then
                table.insert(v93, v94)
            end
        end
        if #v93 == 1 and u75[p89] == false then
            local v96 = p89.Delta
            local v97 = u47
            v97.Move = v97.Move + Vector2.new(v96.X, v96.Y)
        end
        if #v93 == 2 then
            local v98 = (v93[1].Position - v93[2].Position).Magnitude
            if u77 then
                local v99 = u47
                v99.Pinch = v99.Pinch + (v98 - u77)
            end
            u77 = v98
        else
            u77 = nil
        end
    end
end
local function u101() --[[Anonymous function at line 351]]
    --[[
    Upvalues:
        [1] = u75
        [2] = u76
        [3] = u77
        [4] = u15
        [5] = u43
    --]]
    u75 = {}
    u76 = nil
    u77 = nil
    if u15 then
        u43 = 0
    end
end
local function u106(p102, p103, p104, p105) --[[Anonymous function at line 361]]
    --[[
    Upvalues:
        [1] = u46
    --]]
    if not p105 then
        u46.Wheel = p102
        u46.Pan = p103
        u46.Pinch = -p104
    end
end
local function u110(p107, p108) --[[Anonymous function at line 369]]
    --[[
    Upvalues:
        [1] = u83
        [2] = u43
    --]]
    if p107.UserInputType == Enum.UserInputType.Touch then
        u83(p107, p108)
    elseif p107.UserInputType == Enum.UserInputType.MouseButton2 and not p108 then
        local v109 = u43 + 1
        u43 = math.max(0, v109)
    end
end
local function u114(p111, p112) --[[Anonymous function at line 378]]
    --[[
    Upvalues:
        [1] = u100
        [2] = u46
    --]]
    if p111.UserInputType == Enum.UserInputType.Touch then
        u100(p111, p112)
    elseif p111.UserInputType == Enum.UserInputType.MouseMovement then
        local v113 = p111.Delta
        u46.Movement = Vector2.new(v113.X, v113.Y)
    end
end
local function u118(p115, p116) --[[Anonymous function at line 387]]
    --[[
    Upvalues:
        [1] = u88
        [2] = u43
    --]]
    if p115.UserInputType == Enum.UserInputType.Touch then
        u88(p115, p116)
    elseif p115.UserInputType == Enum.UserInputType.MouseButton2 then
        local v117 = u43 - 1
        u43 = math.max(0, v117)
    end
end
local u119 = false
function v41.setInputEnabled(p120) --[[Anonymous function at line 398]]
    --[[
    Upvalues:
        [1] = u119
        [2] = u74
        [3] = u101
        [4] = u1
        [5] = u62
        [6] = u8
        [7] = u65
        [8] = u6
        [9] = u69
        [10] = u67
        [11] = u42
        [12] = u2
        [13] = u110
        [14] = u114
        [15] = u118
        [16] = u106
        [17] = u15
    --]]
    if u119 ~= p120 then
        u119 = p120
        u74()
        u101()
        if u119 then
            u1:BindActionAtPriority("RbxCameraThumbstick", u62, false, u8, Enum.KeyCode.Thumbstick2)
            u1:BindActionAtPriority("RbxCameraKeypress", u65, false, u8, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O)
            if u6.VREnabled then
                u1:BindAction("RbxCameraGamepadReset", u69, false, Enum.KeyCode.ButtonL3)
            end
            u1:BindAction("RbxCameraGamepadZoom", u67, false, Enum.KeyCode.ButtonR3)
            local v121 = u42
            local v122 = u2.InputBegan
            local v123 = u110
            table.insert(v121, v122:Connect(v123))
            local v124 = u42
            local v125 = u2.InputChanged
            local v126 = u114
            table.insert(v124, v125:Connect(v126))
            local v127 = u42
            local v128 = u2.InputEnded
            local v129 = u118
            table.insert(v127, v128:Connect(v129))
            local v130 = u42
            local v131 = u2.PointerAction
            local v132 = u106
            table.insert(v130, v131:Connect(v132))
            if u15 then
                local v133 = u42
                local v134 = game:GetService("GuiService").MenuOpened
                local v135 = u101
                table.insert(v133, v134:connect(v135))
                return
            end
        else
            u1:UnbindAction("RbxCameraThumbstick")
            u1:UnbindAction("RbxCameraMouseMove")
            u1:UnbindAction("RbxCameraMouseWheel")
            u1:UnbindAction("RbxCameraKeypress")
            u1:UnbindAction("RbxCameraGamepadZoom")
            if u6.VREnabled then
                u1:UnbindAction("RbxCameraGamepadReset")
            end
            for _, v136 in pairs(u42) do
                v136:Disconnect()
            end
            u42 = {}
        end
    end
end
function v41.getInputEnabled() --[[Anonymous function at line 470]]
    --[[
    Upvalues:
        [1] = u119
    --]]
    return u119
end
function v41.resetInputForFrameEnd() --[[Anonymous function at line 474]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u47
    --]]
    u46.Movement = Vector2.new()
    u47.Move = Vector2.new()
    u47.Pinch = 0
    u46.Wheel = 0
    u46.Pan = Vector2.new()
    u46.Pinch = 0
end
u2.WindowFocused:Connect(u74)
u2.WindowFocusReleased:Connect(u74)
local u137 = false
local u138 = false
local u139 = 0
function v41.getHoldPan() --[[Anonymous function at line 495]]
    --[[
    Upvalues:
        [1] = u137
    --]]
    return u137
end
function v41.getTogglePan() --[[Anonymous function at line 499]]
    --[[
    Upvalues:
        [1] = u138
    --]]
    return u138
end
function v41.getPanning() --[[Anonymous function at line 503]]
    --[[
    Upvalues:
        [1] = u138
        [2] = u137
    --]]
    return u138 or u137
end
function v41.setTogglePan(p140) --[[Anonymous function at line 507]]
    --[[
    Upvalues:
        [1] = u138
    --]]
    u138 = p140
end
local u141 = false
local u142 = nil
local u143 = nil
function v41.enableCameraToggleInput() --[[Anonymous function at line 515]]
    --[[
    Upvalues:
        [1] = u141
        [2] = u137
        [3] = u138
        [4] = u142
        [5] = u143
        [6] = u18
        [7] = u139
        [8] = u19
        [9] = u2
    --]]
    if not u141 then
        u141 = true
        u137 = false
        u138 = false
        if u142 then
            u142:Disconnect()
        end
        if u143 then
            u143:Disconnect()
        end
        u142 = u18:Connect(function() --[[Anonymous function at line 532]]
            --[[
            Upvalues:
                [1] = u137
                [2] = u139
            --]]
            u137 = true
            u139 = tick()
        end)
        u143 = u19:Connect(function() --[[Anonymous function at line 537]]
            --[[
            Upvalues:
                [1] = u137
                [2] = u139
                [3] = u138
                [4] = u2
            --]]
            u137 = false
            if tick() - u139 < 0.3 and (u138 or u2:GetMouseDelta().Magnitude < 2) then
                u138 = not u138
            end
        end)
    end
end
function v41.disableCameraToggleInput() --[[Anonymous function at line 545]]
    --[[
    Upvalues:
        [1] = u141
        [2] = u142
        [3] = u143
    --]]
    if u141 then
        u141 = false
        if u142 then
            u142:Disconnect()
            u142 = nil
        end
        if u143 then
            u143:Disconnect()
            u143 = nil
        end
    end
end
return v41