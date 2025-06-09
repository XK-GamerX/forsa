-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    DisplayName = "Chance", 
    Quote = "\"99% of gamblers quit before they win big\"", 
    Credits = "", 
    Class = "Sentinel", 
    RenderImage = "rbxassetid://73962315923441", 
    Price = 777, 
    Speed = 12, 
    HealthMin = 60, 
    HealthMax = 120, 
    CoinFlipCooldown = 0.5, 
    CoinFlipWeaknessDuration = 15, 
    ShootSuccessChancePerCharge = 20, 
    ShootLessFailureChancePerCharge = 10, 
    ShootStunDurationDebuffPerChanceAlive = 15, 
    ShootCooldown = 40, 
    ShootHitboxSize = 2.5, 
    ShootHitboxRange = 90, 
    ShootMaxStunDuration = 4, 
    ShootMinStunDuration = 1, 
    ShootMaxKnockback = 14, 
    ShootMinKnockback = 5, 
    ShootDamage = 50, 
    ShootSelfDamage = 45, 
    CameraShakeMagnitude = 1.5, 
    CameraShakeDuration = 0.4, 
    RerollCooldown = 20, 
    RandomnessDifferencePerCharge = 3, 
    HatFixCooldown = 60, 
    Expressions = {
        Happy = "rbxassetid://81326908466861", 
        Default = "rbxassetid://75085810053616", 
        Hurt = "rbxassetid://90458441454406", 
        Injured = "rbxassetid://76847927707021", 
        Dead = "rbxassetid://117204117218380", 
        Drinking = "rbxassetid://117783050780238", 
        Gambling = "rbxassetid://90446109027240", 
        Sad = "rbxassetid://75676434716240", 
        Uhoh = "rbxassetid://91928965687553"
    }, 
    Animations = {
		FlipCoinHeads = "rbxassetid://136284498895707", 
		FlipCoinTails = "rbxassetid://101266005480347", 
		AimGun = "rbxassetid://121235056012853", 
		GunFire = "rbxassetid://99706353929258", 
		GunFail = "rbxassetid://136878687751996", 
		GunExplode = "rbxassetid://87404271787790", 
		HatFix = "rbxassetid://81587357454941"
    }, 
    Sounds = {
        FlipCoinHeadsSFX = "rbxassetid://104239877200025", 
        FlipCoinTailsSFX = "rbxassetid://101120969540575", 
        FlipCoinSFX = "rbxassetid://75899331923838", 
        StatRerollSFX = "rbxassetid://83163547903343", 
        GunWindUpSFX = "rbxassetid://139012439429121", 
        GunFireSuccessSFX = "rbxassetid://121120408563206", 
        GunExplodeSFX = "rbxassetid://2814355346", 
        GunHitSFX = "rbxassetid://124324777507465"
    }, 
    TextInteractions = {
        Requests = {
            ElliotPizza = {
                "Heyy! Can\226\128\153t a guy like me get some pizza \226\128\152round here?", 
                "Hey kid! Mind if I get a good slice of pizza?", 
                "Lady Luck\226\128\153s not on my side right now, mind if I get a slice as a good luck charm?", 
                "Some pizza should set me right back on my feet. Spare some, won\226\128\153tcha?", 
                "Your pizza\226\128\153s got something to it, kid! Hurry and throw one my way!"
            }, 
            BuildermanSentry = {
                "Heya\226\128\153, a sentry over here could do some quick work on those nutjobs.", 
                "One sentry over here, Builder bro!", 
                "Soo.. a sentry here should be fine, don\226\128\153tcha think?", 
                "Right here\226\128\153s a good spot for a sentry!", 
                "Buildin\226\128\153 a sentry over here should be good!"
            }, 
            BuildermanDispenser = {
                "Hey Doc\226\128\153, a dispenser over here should work wonders!", 
                "Work your dispenser over in this spot!", 
                "Dispenser over here! Quick!", 
                "I gotta use some of your dispensers here! Put \226\128\152er down!", 
                "Put your dispenser over here, Doc!"
            }, 
            DusekkarProtection = {
                "Pumpkin fella\226\128\153, I could use some of your magic!", 
                "A little help over here with your magic?", 
                "That magical force field of yours would be nice to have, you know?", 
                "Your force field might keep me safe in case my flintlock explodes!", 
                "A force field would be useful right about now!"
            }
        }, 
        Thanks = {
            Regular = {
                "Heh, thanks pal!", 
                "You won\226\128\153t regret this one bit!", 
                "Glad to have received the help, pal!", 
                "Thanks! This should be useful.", 
                "Thanks! Now to get back to shootin\226\128\153.", 
                "Alright, thanks pal!"
            }
        }
    }
};
v0.Information = {
    {
        Separator = "GENERAL INFO"
    }, 
    {
        Header = "CHANCE", 
        Text = "The sounds of machines promising great rewards spiral within his ears. Gambling with his life, his potential lies inside of the result of his coin. He also wields a shoddy flintlock that feels like it could break at any moment, but it's one that he'll take to his death.\n"
    }, 
    {
        Header = "STATS", 
        Text = "Difficulty: \240\159\142\176 \240\159\142\176 \240\159\142\176 never stop gambling\n" .. ("Health: %*-%*\n"):format(v0.HealthMin, v0.HealthMax) .. ("Regular Speed: %*\n"):format(v0.Speed or 12) .. ("Sprinting Speed: %*\n"):format(v0.SprintSpeed or 24) .. ("Max Stamina: %*\n"):format(v0.MaxStamina or 100) .. ("Stamina Loss per sec: %*\n"):format(v0.StaminaLoss or 10) .. ("Stamina Gain per sec: %*\n"):format(v0.StaminaGain or 20)
    }, 
    {
        Separator = "PASSIVES"
    }, 
    {
        Header = "UNPREDICTABLE FATE", 
        Quote = "\"TAKE A CHANCE WITH CHAAAANCE BABY\" - Chance", 
        Text = ("%*'s Max HP stat is set to be a random value of 70-90.\n"):format("Chance")
    }, 
    {
        Separator = "ABILITIES"
    }, 
    {
        Image = "rbxassetid://91225744028483", 
        Header = "CHANCE'S FAVOR", 
        Quote = "\"I gambled with my LIFE\" - ???     \"did you win though\" - Chance", 
        Text = ("Cooldown: %*s\n"):format(v0.CoinFlipCooldown) .. ("%* flips a coin.\n"):format("Chance") .. "If the coin lands on heads, gain a charge for all other abilities.\n" .. ("If the coin lands on tails, gain <b>Weakness</b> for %*s.\n"):format(v0.CoinFlipWeaknessDuration) .. "For every time the coin lands on tails, the level of <b>Weakness</b> that gets inflicted on you goes up by 1.\n" .. "<b>The Weakness that gets inflicted has no cap.</b>\n"
    }, 
    {
        Image = "rbxassetid://78498256535383", 
        Header = "ONE SHOT", 
        Quote = "\"You only have one shot.\" - Talking Cat", 
        Text = ("Cooldown: %*s\n"):format(v0.ShootCooldown) .. ("%* pulls out an unreliable flintlock, and after a windup of 1s, pulls the trigger.\n"):format("Chance") .. "Upon the flintlock being triggered, all of the possible outcomes can occur:\n" .. "  * (25% chance) Nothing happens.\n" .. ("  * (25%% chance) The flintlock explodes, dealing %* damage to the user & disables the ability indefinitely.\n"):format(v0.ShootSelfDamage) .. ("  * (50%% chance) The flintlock fires, stunning any killer that gets shot at within %* studs for %*-%*s. The shot linearly becomes less effective depending on how far away %* is from the killer.\n"):format(v0.ShootHitboxRange, v0.ShootMinStunDuration, v0.ShootMaxStunDuration, "Chance") .. ("For every additional charge that this ability has, the chance of a successful shot will go up by %*%% while every other outcome's chance will decrease by %*%%.\n"):format(v0.ShootSuccessChancePerCharge, v0.ShootLessFailureChancePerCharge) .. ("For every additional %* that's ingame, the duration of the flintlock's stun is decreased by %*%%.\n"):format("Chance", v0.ShootStunDurationDebuffPerChanceAlive) .. "This ability starts off with 0 charges and has a cap of 3 charges.\n" .. "Using this ability removes all charges on every ability.\n"
    }, 
    {
        Image = "rbxassetid://80029151869083", 
        Header = "REROLL", 
        Quote = "\"Just one more go at it and I'll be a millionaire!\" - A College Student in Debt", 
        Text = ("Cooldown: %*s\n"):format(v0.RerollCooldown) .. ("%* rerolls the value of his Max HP stat.\n"):format("Chance") .. ("Upon activation, a random number between %* to %* is chosen.\n"):format(v0.HealthMin, v0.HealthMax) .. ("For every charge that this ability has, that number will be intensified by %*%%, and then it'll become Chance's Max HP.\n"):format(v0.RandomnessDifferencePerCharge) .. "This ability starts off with 0 charges and has a cap of 3 charges.\n" .. "Using this ability removes all charges on every ability.\n"
    }, 
    {
        Image = "rbxassetid://93434599531478", 
        Header = "HAT FIX", 
        Quote = "\"This hat demonstrates good taste and exudes class.\" - Roblox", 
        Text = ("Cooldown: %*s\n"):format(v0.HatFixCooldown) .. "Upon activating this ability, all <b>Weakness</b> stacks that were inflicted onto you through using <b>Chance's Favor</b> are removed.\n" .. "This ability can only be used after reaching 3 charges for all other abilities.\n" .. "Using this ability removes all charges on every ability & re-enabled the <b>One Shot</b> ability if it's disabled.\n"
    }
};
return v0;