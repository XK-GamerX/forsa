-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    DisplayName = "Noli", 
    Quote = "\"And so darkness decends.\"", 
    Credits = "By: c2o & Marcy", 
    RenderImage = "rbxassetid://113686001078195", 
    Price = 1100, 
    Exclusive = true, 
    Health = 1111, 
    Speed = 24, 
    SprintSpeed = 28, 
    StaminaLoss = 10, 
    StaminaGain = 10, 
    MaxStamina = 60, 
    MinStamina = -30, 
    MovementAnimSpeed = 1.5, 
    AttackDamage = 40, 
    StabDamage = 25, 
    StabCooldown = 2, 
    StardrivenDamage1 = 12, 
    StardrivenDamage2 = 24, 
    StardrivenCooldown = 2, 
    StardrivenTimeout = 2, 
    StardrivenSpeed = 60, 
    ImplantDamage = 15, 
    ImplantKnockback = 2, 
    ImplantCooldown = 15, 
    ImplantTime = 30, 
    ImplantInjectKnockback = 15, 
    ImplantInjectKnockbackDestroyTime = 0.15, 
    HallucinationCooldown = 1, 
    HallucinationDuration = 5, 
    HallucinationAuraRevealDuration = 3, 
    HallucinationMaxDistance = 45, 
    IntroLighting = script.IntroLighting, 
    Animations = {
		Idle = "rbxassetid://126553529246534", 
		Walk = "rbxassetid://108297010230631", 
		Run = "rbxassetid://108297010230631", 
		Stab = "rbxassetid://119720825579722", 
		StardrivenTendrilStartup = "rbxassetid://88978743873591", 
		StardrivenTendrilLoop = "rbxassetid://111022253639051", 
		StardrivenCharge1Start = "rbxassetid://117899305556371", 
		StardrivenCharge1Loop = "rbxassetid://112933985862312", 
		StardrivenCharge1Hit = "rbxassetid://78724382719444", 
		StardrivenCharge2Start = "rbxassetid://82971532570177", 
		StardrivenCharge2Loop = "rbxassetid://114653179302649", 
		StardrivenCharge2HitNoli = "rbxassetid://88122016747586", 
		StardrivenCharge2HitVictim = "rbxassetid://84190221772175", 
		StardrivenChargeMiss = "rbxassetid://138171977155622", 
		Implant = "rbxassetid://75635682162310", 
		ImplantAttackNoli = "rbxassetid://102071266711933", 
		ImplantAttackVictim = "rbxassetid://133293451148142", 
		Hallucination = "rbxassetid://114740665295880", 
		Introduction = {
			KillerRig = "rbxassetid://104368604648088", 
			CameraRig = "rbxassetid://84131840223894"
		}, 
		Execution = {
			KillerRig = "rbxassetid://139969534776259", 
			PlayerRig = "rbxassetid://116544958644813", 
			PlayerCFrameOffset = CFrame.new(0, 0, -6)
		}, 
		Stunned = {
			Start = "rbxassetid://77502998111999", 
			Loop = "rbxassetid://104650727275694", 
			End = "rbxassetid://79338401693761"
		}
    }, 
    Sounds = {
        Idle = "rbxassetid://73235255020546", 
        Footsteps = {
            "rbxassetid://99809965759734", 
            "rbxassetid://79222929114377"
        }, 
        Execution = "rbxassetid://91549814855829", 
        Swing = "rbxassetid://118208498013260", 
        Hit = "rbxassetid://110759725172567", 
        Implant = "rbxassetid://90768093259753", 
        ImplantInject = "rbxassetid://114767134633867", 
        Explosion = "rbxassetid://99558901806521", 
        Hallucination = "rbxassetid://113926551867193", 
        TerrorRadiusThemes = {
            [60] = {
                ID = "rbxassetid://137984398736588", 
                BPM = 81
            }, 
            [40] = {
                ID = "rbxassetid://101639399549593", 
                BPM = 81
            }, 
            [20] = {
                ID = "rbxassetid://139278573219074", 
                BPM = 81
            }, 
            [6] = {
                ID = "rbxassetid://79001697227075", 
                BPM = 81, 
                Chase = true
            }
        }, 
        Introduction = "rbxassetid://97041392946745"
    }, 
    Assets = {
        DecayCC = script.Decay
    }
};