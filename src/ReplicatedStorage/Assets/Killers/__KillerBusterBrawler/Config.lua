-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    DisplayName = "buster brawler", 
    Quote = "im super iconic!", 
    Credits = "Made By: ME!", 
    RenderImage = "rbxassetid://18997973596", 
    Price = 18, 
    Exclusive = true, 
    Health = #game.Players:GetPlayers() * 1000 + 2000, 
    Speed = 32, 
    SprintSpeed = 46, 
    StaminaLoss = 50, 
    StaminaGain = 20, 
    MaxStamina = 100, 
    AttackDamage = 20, 
    RootPartDamage = 20, 
    EnragedSlashLungeForce = 65, 
    CycloneKickDamage = 30, 
    FalconPunchDamage = 30, 
    RunPunchDamage = 30, 
    StrongLeftForce = 75, 
    Animations = {
        Idle = "rbxassetid://96173779255396", 
        Walk = "rbxassetid://96194626828153", 
        Run = "rbxassetid://96194626828153", 
        Stunned = {
            Start = "rbxassetid://109869078763813", 
            Loop = "rbxassetid://125337218572338", 
            End = "rbxassetid://83635673319417"
        }, 
        Victory = {
            KillerRig = "rbxassetid://86968383017675", 
            CameraRig = "rbxassetid://112527946233530"
        }, 
        Execution = {
            KillerRig = "rbxassetid://89669118763885", 
            PlayerRig = "rbxassetid://78051806190478"
        }, 
        Attack = "rbxassetid://88258635004597", 
        CorruptNature = "rbxassetid://18885919947", 
        SummonPizzaDelivery = "rbxassetid://18885915433", 
        WalkspeedOverrideStart = "rbxassetid://18885932392", 
        WalkspeedOverrideLoop = "rbxassetid://18885939653", 
        WalkspeedOverrideHit = "rbxassetid://18885937766", 
        WalkspeedOverrideMiss = "rbxassetid://18885940850", 
        StrongLeft = "rbxassetid://129585227912060", 
        StrongLeftEnd = "rbxassetid://106156268449178"
    }, 
    Sounds = {
        Footsteps = {
            "rbxassetid://106029794447542", 
            "rbxassetid://96762479007469"
        }, 
        TerrorRadiusThemes = {
            [6] = {
                ID = "rbxassetid://0", 
                BPM = 81, 
                Chase = true
            }
        }, 
        Execution = "rbxassetid://79016487248667", 
        Ambience = "rbxassetid://14320498411", 
        CorruptThrow = "rbxassetid://111033845010938", 
        PizzaDeliveryGuySpawned = "rbxassetid://119993322066460", 
        PizzaDeliveryPunchGround = "rbxassetid://73139934333155", 
        WalkspeedOverrideLunge = "rbxassetid://105200830849301", 
        WalkspeedOverrideHit = "rbxassetid://116806980881542", 
        WalkspeedOverrideTimeout = "rbxassetid://123577398651116", 
        WalkspeedOverrideCollide = "rbxassetid://131584836684993", 
        Hit = "rbxassetid://110759725172567", 
        Swing = "rbxassetid://102228729296384", 
        Introduction = "rbxassetid://120121923711079"
    }
};