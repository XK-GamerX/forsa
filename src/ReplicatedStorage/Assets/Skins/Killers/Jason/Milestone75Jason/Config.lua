-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    DisplayName = "Milestone III", 
    Description = "Make mommy proud jason, don't let them escape.", 
    RenderImage = "rbxassetid://93659862494221", 
    Price = -4, 
    Exclusive = true, 
    Animations = {
        Execution = {
            KillerRig = "rbxassetid://97176944963316", 
            PlayerRig = "rbxassetid://101656269837601", 
            PlayerCFrameOffset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.75)
        }
    }, 
    Sounds = {
        Execution = false, 
        TerrorRadiusThemes = {
            [60] = {
                ID = "rbxassetid://132410957705890", 
                BPM = 145
            }, 
            [40] = {
                ID = "rbxassetid://110159320385013", 
                BPM = 145
            }, 
            [20] = {
                ID = "rbxassetid://88809604073112", 
                BPM = 145
            }, 
            [6] = {
                ID = "rbxassetid://90941930702601", 
                BPM = 145, 
                Chase = true
            }
        }
    }
};