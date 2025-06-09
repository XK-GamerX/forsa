-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    DisplayName = "Shedletsky", 
    Quote = "\"BLAME JOHN!\"", 
    Credits = "", 
    Class = "Sentinel", 
    RenderImage = "rbxassetid://90318481007675", 
    Price = 500, 
    Speed = 12, 
    SlashDamage = 30, 
    SlashWindupTime = 0.575, 
    SlashStunTime = 3, 
    SlashCooldown = 40, 
    FriedChickenCooldown = 70, 
    FriedChickenHealDelay = 1.75, 
    FriedChickenHealInitialAmount = 5, 
    FriedChickenHealOvertimeAmount = 35, 
    FriedChickenHealOvertimeDuration = 10, 
    Expressions = {
        Happy = "rbxassetid://128277497", 
        Default = "rbxassetid://97216249743044", 
        Hurt = "rbxassetid://114904253860911", 
        Injured = "rbxassetid://134323061188067", 
        Dead = "rbxassetid://113700503533465", 
        Drinking = "rbxassetid://90280461790500", 
        StunnedKiller = "rbxassetid://93712847953609"
    }, 
    Animations = {
		Slash = "rbxassetid://104067888990885", 
		EatChicken = "rbxassetid://98281332730204"
    }, 
    Sounds = {
        Unsheath = "rbxassetid://12222225", 
        Slash = "rbxassetid://12222208", 
        Hit = "rbxassetid://17837549788", 
        EatFriedChicken = ""
    }, 
    TextInteractions = {
        Requests = {
            ElliotPizza = {
                "It\226\128\153s no chicken, but pizza could do the job just fine!", 
                "Can a guy like me get some pizza?", 
                "A slice of pizza should get me going for a little while longer.", 
                "Pizza\226\128\153s something I could really use right now.", 
                "Gimme\226\128\153 a good slice if you\226\128\153ve got any!"
            }, 
            BuildermanSentry = {
                "Builderman, this spot\226\128\153s good for a sentry, don\226\128\153t you think?", 
                "A sentry over here would be nice, eh, Builderman?", 
                "Place a sentry here, Builderman.", 
                "Builderman, put down a sentry over here.", 
                "You gotta put a sentry here Builder, this spot\226\128\153s pretty good."
            }, 
            BuildermanDispenser = {
                "Hey Builderman! This spot\226\128\153s good for a dispenser, don\226\128\153t you think?", 
                "You can tuck away a dispenser over here, Builder.", 
                "The spot over here\226\128\153s a great place for a dispenser.", 
                "Put your dispenser over here!", 
                "A dispenser could be good over here. What do you think, Builderman?"
            }, 
            DusekkarProtection = {
                "Matt! I could use a little bit of your magic!", 
                "Mind if I get a quick force field casting, Matt?", 
                "Your spell-casting is pretty nice, can I get some of that?", 
                "Requesting a force field from you, pumpkin guy!", 
                "Hey, mind if I get a force field?"
            }
        }, 
        Thanks = {
            Regular = {
                "Thanks, buddy!", 
                "Thanks, now let me keep trying to help you guys.", 
                "Nice work, I knew you wouldn\226\128\153t let me down.", 
                "I\226\128\153m glad you\226\128\153re around to help.", 
                "Thanks, man. Appreciate it.", 
                "Thank you."
            }
        }
    }
};
v0.Information = {
    {
        Separator = "GENERAL INFO"
    }, 
    {
        Header = "SHEDLETSKY", 
        Text = "Blame John.\nAn important figure in Roblox history, he wields a historical Linked Sword to cut the killer in it's tracks.\n"
    }, 
    {
        Header = "STATS", 
        Text = "Difficulty: \226\152\133\226\152\133\226\152\133\226\152\134\226\152\134\n" .. ("Health: %*\n"):format(v0.Health or 100) .. ("Regular Speed: %*\n"):format(v0.Speed or 12) .. ("Sprinting Speed: %*\n"):format(v0.SprintSpeed or 24) .. ("Max Stamina: %*\n"):format(v0.MaxStamina or 100) .. ("Stamina Loss per sec: %*\n"):format(v0.StaminaLoss or 10) .. ("Stamina Gain per sec: %*\n"):format(v0.StaminaGain or 20)
    }, 
    {
        Separator = "ABILITIES"
    }, 
    {
        Image = "rbxassetid://85282571177550", 
        Header = "SLASH", 
        Quote = "\"Death before dishonor.\" - Shedletsky", 
        Text = ("Cooldown: %*s\n"):format(v0.SlashCooldown) .. ("Stun Time: %*\n"):format(v0.SlashStunTime) .. ("Damage: %*\n"):format(v0.SlashDamage) .. ("%* equips one of his many SFOTH swords and slashes forward, stunning the killer if the attack hits.\n"):format("Shedletsky") .. ("<b>Resistance II</b> is applied for %*s on activation."):format(v0.SlashWindupTime) .. ("Slows down the player by 75%% for %*s while in use.\n"):format(v0.SlashWindupTime + 1)
    }, 
    {
        Image = "rbxassetid://87451970500470", 
        Header = "FRIED CHICKEN", 
        Quote = "\"You won the annual chicken eat off hosted by Shedletsky!\" - Builderman", 
        Text = ("Cooldown: %*s\n"):format(v0.FriedChickenCooldown) .. ("%* pulls out a piece of fried chicken and takes a bite out of it, restoring %* HP upon consumption and %* HP over the span of %*s. If %* is hit by a Killer during the period of regaining HP, then the healing effect is cancelled.\n"):format("Shedletsky", v0.FriedChickenHealInitialAmount, v0.FriedChickenHealOvertimeAmount, v0.FriedChickenHealOvertimeDuration, "Shedletsky") .. "<b>This ability can only be used twice.</b>\n"
    }
};
return v0;