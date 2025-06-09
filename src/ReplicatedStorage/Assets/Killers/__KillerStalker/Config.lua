-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    DisplayName = "The Stalker", 
    Quote = "\"RAHHHHHHHHHHHHHHHHHH\"", 
    Credits = "By: AndrewD0tWeb", 
    RenderImage = "rbxassetid://97768888", 
    Price = 1100, 
    Exclusive = true, 
    Health = 1100, 
    Speed = 5, 
    SprintSpeed = 30, 
    StaminaLoss = 10, 
    StaminaGain = 45, 
    MaxStamina = 60, 
    AttackDamage = 40, 
    SlashDamage = 35, 
    EnragedSlashDamage = 35, 
    SlashCooldown = 0.75, 
    EnragedStaminaCap = 25, 
    EnragedStaminaCapLerpTime = 6.5, 
    EnragedTime = 20, 
    EnragedSlashLungeForce = 85, 
    RageCooldown = 10, 
    Animations = {
		Idle = "rbxassetid://135062676665039", 
		Walk = "rbxassetid://107900253909371", 
		Run = "rbxassetid://98800986293073", 
		Stab1 = "rbxassetid://132720717735993", 
		Stab2 = "rbxassetid://100519904781799", 
		Scream = "rbxassetid://82329579386823", 
        Stunned = {
			Start = "rbxassetid://90547571247538", 
			Loop = "rbxassetid://127578757988949", 
			End = "rbxassetid://107217829907514"
        }, 
		Rage = "rbxassetid://91110683749294", 
		EnragedWalk = "rbxassetid://122078360073431", 
		EnragedRun = "rbxassetid://122078360073431", 
		EnragedIdle = "rbxassetid://94555461054330"
    }, 
    Sounds = {
        Footsteps = {
            "rbxassetid://99809965759734", 
            "rbxassetid://79222929114377"
        }, 
        TerrorRadiusThemes = {
            [45] = {
                ID = "rbxassetid://127017993628155", 
                BPM = 72
            }, 
            [30] = {
                ID = "rbxassetid://124064215515361", 
                BPM = 72
            }, 
            [15] = {
                ID = "rbxassetid://113795434267266", 
                BPM = 72
            }, 
            [6] = {
                ID = "rbxassetid://100218181834917", 
                BPM = 72, 
                Chase = true
            }
        }, 
        Swing = "rbxassetid://12222216", 
        Hit = "rbxassetid://110759725172567", 
        EnragedStart = "rbxassetid://18564431123", 
        Enraged = "rbxassetid://94207556272752"
    }
};