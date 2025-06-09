-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    DisplayName = "Herobrine", 
    Quote = "\"Heh, I quite like that name, you wouldn't mind if I take it?\"", 
    Credits = "By: AndrewD0tWeb", 
    RenderImage = "rbxassetid://112594187", 
    Price = 7, 
    Exclusive = true, 
    Health = 1100, 
    Speed = 8, 
    SprintSpeed = 24, 
    StaminaLoss = 10, 
    StaminaGain = 20, 
    MaxStamina = 500, 
    SeeYouDMG = 30, 
    FoundYouDMG = 40, 
    StopDMG = 25, 
    Error404 = 25, 
    StopSpeed = 90, 
    Error404Speed = 100, 
    Flick = 20, 
    PizzaDeliveryGuyLifetime = 30, 
    PizzaDeliveryGuyAttackRadius = 6, 
    PizzaDeliveryGuySpeed = math.random(20, 30), 
    PizzaDeliveryGuyHealth = 20, 
    PizzaDeliveryGuyDamage = 10, 
    SteveRig = script.SteveRig, 
    PizzaDeliveryAnimations = {
		Idle = "rbxassetid://96621367873536", 
		Walk = "rbxassetid://118616615309135", 
		Hit = "rbxassetid://132275349256935"
    }, 
    Animations = {
		Idle = "rbxassetid://96621367873536", 
		Walk = "rbxassetid://118616615309135", 
		Run = "rbxassetid://132275349256935", 
        BetterIdle = "rbxassetid://107799240559806", 
        BetterWalk = "rbxassetid://136392249604185", 
        BetterRun = "rbxassetid://82769921419332", 
		FoundYou = "rbxassetid://89868200150226", 
		SeeYou = "rbxassetid://99138495437647", 
		Stop = "rbxassetid://110291432916506", 
        Stunned = {
            Start = "rbxassetid://109869078763813", 
            Loop = "rbxassetid://125337218572338", 
            End = "rbxassetid://83635673319417"
        }
    }, 
    Sounds = {
        Footsteps = {
            "rbxassetid://99809965759734", 
            "rbxassetid://79222929114377"
        }, 
        Swing = "rbxassetid://83336588073857", 
        Hit = "rbxassetid://133819228235701", 
        Hit2 = "rbxassetid://108809439689114", 
        Flick = "rbxassetid://121372260405316", 
        Stop = "rbxassetid://106841831666549", 
        TerrorRadiusThemes = {
            [30] = {
                ID = "rbxassetid://126022085662213", 
                BPM = 120.7, 
                Chase = true
            }
        }
    }
};