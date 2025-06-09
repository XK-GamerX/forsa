-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    Config = {
        FacePlayer = false, 
        PlayIdleOutsideOfDialog = true, 
        Poses = {
            Idle = "rbxassetid://82221753254937"
        }
    }, 
    Interacted = function(v0) --[[ Line: 12 ]]
        v0:CreateDialog({
            Text = "I ordered a pizza before I was taken into this place... it was taking a while tho."
        });
    end
};