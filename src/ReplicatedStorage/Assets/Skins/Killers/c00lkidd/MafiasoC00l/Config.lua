-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    DisplayName = "Mafioso", 
    Description = "\"I didn't really expect to find one of our targets here.\"", 
    RenderImage = "rbxassetid://118885317814535", 
    Price = 1750, 
    Mafiasos = {
        [1] = script.Mafiaso1, 
        [2] = script.Mafiaso2, 
        [3] = script.Mafiaso3
    }, 
    Sign = script.Debth, 
    PizzaDeliveryAnimations = {
		Summoned = "rbxassetid://74486458305023", 
		Idle = "rbxassetid://74486458305023", 
		Walk = "rbxassetid://92058719045394", 
		Hit = "rbxassetid://104342857709941"
    }, 
    Animations = {
		Idle = "rbxassetid://93367441485604", 
		Walk = "rbxassetid://74486458305023", 
		Run = "rbxassetid://74486458305023", 
        Introduction = {
			KillerRig = "rbxassetid://105719634513116", 
			CameraRig = "rbxassetid://119618258107466"
        }, 
        Execution = {
			KillerRig = "rbxassetid://132447001266888", 
			PlayerRig = "rbxassetid://139122082087132"
        }, 
        Execution007n7 = false, 
		WalkspeedOverrideLoop = "rbxassetid://112042693465004", 
		WalkspeedOverrideHit = "rbxassetid://113891793417510", 
		WalkspeedOverrideMiss = "rbxassetid://80457714135004", 
		Attack = "rbxassetid://111969045546824", 
		SummonPizzaDelivery = "rbxassetid://129016229354331"
    }, 
    Sounds = {
        MafiasoSpawn = {
            [1] = "rbxassetid://123948182337855", 
            [2] = "rbxassetid://93659656839634", 
            [3] = "rbxassetid://93952540545104"
        }, 
        TerrorRadiusThemes = {
            [60] = {
                ID = "rbxassetid://75554737667196", 
                BPM = 140
            }, 
            [40] = {
                ID = "rbxassetid://121567985915317", 
                BPM = 140
            }, 
            [20] = {
                ID = "rbxassetid://133222944971198", 
                BPM = 140
            }, 
            [6] = {
                ID = "rbxassetid://84250831671130", 
                BPM = 140, 
                Chase = true, 
                LoopRegion = NumberRange.new(3.64, 130.5)
            }
        }, 
        PizzaDeliveryGuySpawned = "rbxassetid://12221944", 
        IntroductionSound = "rbxassetid://87207560431801", 
        Introduction = "rbxassetid://1", 
        Bunny = "rbxassetid://6715870978", 
        CorruptThrow = "rbxassetid://106484876889079", 
        WalkspeedOverrideHit = "rbxassetid://12222208", 
        WalkspeedOverrideCollide = "rbxassetid://109397400639910", 
        WalkspeedOverrideTimeout = "rbxassetid://109397400639910", 
        SwordUnsheath = "rbxassetid://12222225", 
        Swing = "rbxassetid://12222216"
    }, 
    Voicelines = {
        Idle = false, 
        LastSurvivorEmotional = false, 
        LastSurvivor = false, 
        KillNoob = false, 
        KillElliot = false, 
        KillGuest1337 = false, 
        Kill007n7 = false, 
        CorruptNature = false, 
        PizzaDelivery = false, 
        PizzaDeliveryHit = false, 
        WalkspeedOverride = false, 
        WalkspeedOverrideHit = {
            "rbxassetid://97981944414502"
        }, 
        WalkspeedOverrideCollide = {
            "rbxassetid://118437725423583"
        }, 
        WalkspeedOverrideTimeout = {
            "rbxassetid://118437725423583"
        }, 
        KillNashatraShedletsky = {
            "rbxassetid://119069863150852", 
            "rbxassetid://121292981713587"
        }, 
        Kill = {
            [1] = "rbxassetid://77256557251496", 
            [2] = "rbxassetid://126485367406048", 
            [3] = "rbxassetid://88498119897840"
        }, 
        Stunned = {
            "rbxassetid://81573614952080"
        }
    }, 
    TerrorRadiusThemes = {
        [60] = {
            ID = "rbxassetid://118235532103625", 
            BPM = 132
        }, 
        [40] = {
            ID = "rbxassetid://117916926328775", 
            BPM = 132
        }, 
        [20] = {
            ID = "rbxassetid://75425168734218", 
            BPM = 132
        }, 
        [6] = {
            ID = "rbxassetid://88325606095183", 
            BPM = 132, 
            Chase = true
        }
    }
};