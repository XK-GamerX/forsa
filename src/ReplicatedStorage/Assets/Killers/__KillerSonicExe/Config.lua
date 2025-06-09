-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    DisplayName = "Sonic.EXE", 
    Quote = "I AM GOD!!", 
    Credits = "Made By: sobbe & BruhMoment", 
    RenderImage = "rbxassetid://126745088439226", 
    Price = 400, 
    Exclusive = true, 
    Health = 900, 
    Speed = 6.5, 
    HipHeight = 2, 
    SprintSpeed = 34, 
    StaminaLoss = 10, 
    StaminaGain = 20, 
    MaxStamina = 110, 
    AttackDamage = 17.5, 
    GodspeedSpeedMultiplier = 25, 
    GodspeedTimeout = 16, 
    Animations = {
		Idle = "rbxassetid://72731524829675", 
		Walk = "rbxassetid://115388343395572", 
		Run = "rbxassetid://121052944572513", 
        Introduction = {
			KillerRig = "rbxassetid://98741548466507", 
			CameraRig = "rbxassetid://91868478839780"
        }, 
        Execution = {
			KillerRig = "rbxassetid://134950835713133", 
			PlayerRig = "rbxassetid://84401487106672", 
            PlayerCFrameOffset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 2.5)
        }, 
		Attack = "rbxassetid://84566730454860", 
		Fly = "rbxassetid://122340079405745", 
		FoundYou = "rbxassetid://102973229301800", 
        Hallucinations = {
			"rbxassetid://71509846934763", 
			"rbxassetid://103698468902156", 
			"rbxassetid://99339463326880", 
			"rbxassetid://84178290886743"
        }
    }, 
    Sounds = {
        Footsteps = {
            "rbxassetid://74143861617780", 
            "rbxassetid://108704374609564"
        }, 
        TerrorRadiusThemes = {
            [60] = {
				ID = "rbxassetid://117552760763934", 
                BPM = 120
            }, 
            [45] = {
				ID = "rbxassetid://86203188145044", 
                BPM = 120
            }, 
            [30] = {
				ID = "rbxassetid://80779197198326", 
                BPM = 120
            }, 
            [6] = {
				ID = "rbxassetid://137386873939073", 
                BPM = 120, 
                Chase = true
            }
        }, 
		Introduction = "rbxassetid://139606856733090", 
        Execution = "rbxassetid://102946562824825", 
        GodspeedLoop = "rbxassetid://110113824866574", 
        FoundYou = "rbxassetid://82532443067807", 
        Hit = "rbxassetid://115537810094042", 
        Swing = "rbxassetid://136695489790441"
    }
};