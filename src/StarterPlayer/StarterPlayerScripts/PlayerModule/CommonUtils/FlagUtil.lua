-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    ["getUserFlag"] = function(u1) --[[Function name: getUserFlag, line 11]]
        local v2, v3 = pcall(function() --[[Anonymous function at line 12]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            return UserSettings():IsUserFeatureEnabled(u1)
        end)
        return v2 and v3
    end
}