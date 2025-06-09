-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("StarterGui")
local u2 = false
local u6 = {
    ["setCameraModeToastEnabled"] = function(p3) --[[Function name: setCameraModeToastEnabled, line 10]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        if p3 or u2 then
            if not u2 then
                u2 = true
            end
            if not p3 then
                u6.setCameraModeToastOpen(false)
            end
        end
    end,
    ["setCameraModeToastOpen"] = function(p4) --[[Function name: setCameraModeToastOpen, line 24]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        local v5 = u2
        assert(v5)
        if p4 then
            u1:SetCore("SendNotification", {
                ["Title"] = "Camera Control Enabled",
                ["Text"] = "Right click to toggle",
                ["Duration"] = 3
            })
        end
    end
}
return u6