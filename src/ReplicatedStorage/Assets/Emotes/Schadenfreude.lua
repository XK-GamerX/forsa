-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    ScoutLaugh = "rbxassetid://99907172493781", 
    PyroLaugh = "rbxassetid://81881589472757", 
    SoldierLaugh = "rbxassetid://114584473003045", 
    DemoLaugh = "rbxassetid://129252779856972", 
    HeavyLaugh = "rbxassetid://112263797681728", 
    EngineerLaugh = "rbxassetid://132961737774004", 
    MedicLaugh = "rbxassetid://84212549244283", 
    SniperLaugh = "rbxassetid://127466333676577", 
    SpyLaugh = "rbxassetid://89571344981581"
};
return {
    DisplayName = "Schadenfreude", 
    Description = "neener neener", 
    Credits = "Made By: ffPrankster", 
    RenderImage = "rbxassetid://83576021763587", 
    Price = 1250, 
    AssetID = {
		"rbxassetid://91776570252727", 
		"rbxassetid://138637588584617", 
		"rbxassetid://139733573277153", 
		"rbxassetid://122910716907311", 
		"rbxassetid://109696732080040", 
		"rbxassetid://134044297634919", 
		"rbxassetid://104762354755030", 
		"rbxassetid://114070289149268", 
		"rbxassetid://73787797915034"
    }, 
    Created = function(v1) --[[ Line: 41 ]] --[[ Name: Created ]]
        -- upvalues: v0 (copy)
        local v2 = v1.Character and v1.Character.PrimaryPart;
        local l_Emote_0 = v1.Emote;
        if v2 and l_Emote_0 then
            for v4, v5 in pairs(v0) do
                l_Emote_0:GetMarkerReachedSignal(v4):Connect(function() --[[ Line: 46 ]]
                    -- upvalues: v1 (copy), v5 (copy)
                    v1.SFX = require(game.ReplicatedStorage.Modules.Sounds):Play(v5, v1.SFXProperties);
                end);
            end;
        end;
    end, 
    Destroyed = function(v6) --[[ Line: 54 ]] --[[ Name: Destroyed ]]
        local l_SFX_0 = v6.SFX;
        if l_SFX_0 then
            l_SFX_0:Destroy();
        end;
    end
};