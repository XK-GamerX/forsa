-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    DisplayName = "Flashlight", 
    Description = "check out my new night light", 
    Icon = "rbxassetid://105017542674842", 
    Motor6D = script.FlashlightJoint, 
    Motor6DPart0 = "Right Arm", 
    SpawnInfo = {
        SpawnChance = 50, 
        MinSpawned = 0, 
        MaxSpawned = 0
    }, 
    ToggleCooldown = 0.1, 
    Animations = {
        Equipped = "rbxassetid://75921969924135", 
        Idle = "rbxassetid://139192256531824", 
        Activated = "rbxassetid://127528562101219"
    }, 
    Sounds = {
        On = "rbxassetid://9114481260", 
        Off = "rbxassetid://9114479857"
    }
};