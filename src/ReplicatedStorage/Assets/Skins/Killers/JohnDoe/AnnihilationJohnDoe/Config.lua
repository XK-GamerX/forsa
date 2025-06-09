-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
	DisplayName = "Annihilation John", 
	Description = "gaminnggggggg.", 
	RenderImage = "rbxassetid://86869607861662", 
	Price = 2000, 
	Exclusive = false, 
	Spike = script.Spike, 
	Shadow = script.Shadow, 
	Trail = script.Trail, 
	Relations = {
		"FriendElliot"
	}, 
	LastManStandingEmotionalData = {
		ThemeID = "rbxassetid://90022574613230", 
		RoundTime = 77
	}, 
	Emotes = {
		Animations = {
			AnnhilationGuitar = {
				DisplayName = "Guitar", 
				Description = "Guitar", 
				AssetID = "rbxassetid://77434400165211", 
				SFX = "rbxassetid://101986282901846", 
				SFXProperties = {
					Looped = false
				}, 
				Created = function(v0) --[[ Line: 32 ]] --[[ Name: Created ]]
					local l_Character_0 = v0.Character;
					if l_Character_0 then
						local l_Guitar_0 = l_Character_0:FindFirstChild("Guitar");
						if l_Guitar_0 then
							l_Guitar_0.Transparency = 0;
						end;
					end;
				end, 
				Destroyed = function(v3) --[[ Line: 40 ]] --[[ Name: Destroyed ]]
					local l_Character_1 = v3.Character;
					if l_Character_1 then
						local l_Guitar_1 = l_Character_1:FindFirstChild("Guitar");
						if l_Guitar_1 then
							l_Guitar_1.Transparency = 1;
						end;
					end;
				end
			}
		}
	}, 
	Animations = {
		Idle = "rbxassetid://136958580657780", 
		Walk = "rbxassetid://109324237912701", 
		Run = "rbxassetid://76432724739307", 
		Stunned = "rbxassetid://137129092861384", 
		Slash = "rbxassetid://87334721682238", 
		CorruptEnergy = "rbxassetid://107388012970556", 
		DigitalFootprint = "rbxassetid://83603327011397", 
		Execution = {
			KillerRig = "rbxassetid://103505204667701", 
			PlayerRig = "rbxassetid://125594637463928"
		}, 
		Introduction = {
			KillerRig = "rbxassetid://95885713470091", 
			CameraRig = "rbxassetid://119973355701029"
		}
	}, 
	Sounds = {
		TerrorRadiusThemes = {
			[60] = {
				ID = "rbxassetid://111767637350170", 
				BPM = 90
			}, 
			[40] = {
				ID = "rbxassetid://126430999676388", 
				BPM = 90
			}, 
			[20] = {
				ID = "rbxassetid://75170611478832", 
				BPM = 90
			}, 
			[6] = {
				ID = "rbxassetid://131883067723721", 
				BPM = 90, 
				Chase = true
			}
		}, 
		Introduction = "rbxassetid://130684926926550"
	}
};