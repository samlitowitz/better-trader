-- use GetSpellInfo for name and icons
-- https://wowpedia.fandom.com/wiki/API_GetSpellInfo
-- https://old.reddit.com/r/worldofpvp/comments/15tt3nk/need_help_with_learning_offensive_cds_1_per_spec/
local cdsBySpec = {
	-- DK
	-- -- Blood
	[250] = {},
	-- -- Frost
	[251] = {
		-- Pillar of Frost
		[51271] = {
			cooldown = 60,
			isTargeted = false
		}
	},
	-- -- Unholy
	[252] = {
		-- Dark Transformation
		[63560] = {
			cooldown = 60,
			isTargeted = false
		},
		-- Unholy Assault
		[207289] = {
			cooldown = 90,
			isTargeted = false
		}
	},

	-- DH
	-- -- Havoc
	[577] = {
		-- Essence Break
		[258860] = {
			cooldown = 40,
			isTargeted = false
		},
		-- Metamorphosis
		[191427] = {
			cooldown = 240,
			isTargeted = false
		},
		-- The Hunt
		[370965] = {
			cooldown = 90,
			isTargeted = true
		}
	},

	-- Druid
	-- -- Balance
	[102] = {
		-- Incarnation: Chosen of Elune
		[102560] = {
			cooldown = 180,
			isTargeted = false
		},
		-- Celestial Alignment
		[383410] = {
			cooldown = 180,
			isTargeted = false
		}
	},
	-- -- Feral
	[103] = {
		-- Incarnation: King of the Jungle
		[102543] = {
			cooldown = 180,
			isTargeted = false
		},
		-- Berserk
		[106951] = {
			cooldown = 180,
			isTargeted = false
		}
	},

	-- Evoker
	-- -- Augmentation
	[1473] = {
		-- Tip the Scales
		[370553] = {
			cooldown = 120,
			isTargeted = false
		},
		-- Breath of Eons
		[403631] = {
			cooldown = 120,
			isTargeted = false
		}
	},
	-- -- Devastation
	[1467] = {
		-- Tip the Scales
		[370553] = {
			cooldown = 120,
			isTargeted = false
		},
		-- Dragonrage
		[375087] = {
			cooldown = 120,
			isTargeted = false
		}
	},

	-- Hunter
	-- -- Beast Mastery
	[253] = {
		-- Bestial Wrath
		[19574] = {
			cooldown = 90,
			isTargeted = false
		}
	},
	-- -- Marksmanship
	[254] = {
		-- Trueshot
		[288613] = {
			cooldown = 120,
			isTargeted = false
		}
	},
	-- -- Survival
	[255] = {
		-- Coordinated Assault
		[360952] = {
			cooldown = 120,
			isTargeted = false
		}
	},

	-- Mage
	-- -- Arcane
	[62] = {
		-- Arcane Surge
		[365350] = {
			cooldown = 90,
			isTargeted = true
		}
	},
	-- -- Fire
	[63] = {
		-- Combustion
		[190319] = {
			cooldown = 120,
			isTargeted = false
		}
	},
	-- -- Frost
	[64] = {
		-- Icy Veins
		[12472] = {
			cooldown = 120,
			isTargeted = false
		}
	},

	-- Monk
	-- Windwalker
	[269] = {
		-- Invoke Xuen
		[123904] = {
			cooldown = 120,
			isTargeted = false
		},
		-- Serenity
		[152173] = {
			cooldown = 90,
			isTargeted = false
		}
	},

	-- Paladin
	-- -- Retribution
	[70] = {
		[31884] = {
			cooldown = 120,
			isTargeted = false
		}
	},

	-- Priest
	-- -- Shadow
	[258] = {
		-- Dark Ascension
		[391109] = {
			cooldown = 60,
			isTargeted = false
		},
		-- Void Eruption
		[228260] = {
			cooldown = 120,
			isTargeted = true
		}
	},

	-- Rogue
	-- -- Assassination
	[259] = {
		-- Deathmark
		[360194] = {
			cooldown = 120,
			isTargeted = true
		}
	},
	-- -- Outlaw
	[260] = {
		-- Adrenaline Rush
		[13750] = {
			cooldown = 180,
			isTargeted = false
		}
	},
	-- -- Subtlety
	[261] = {
		-- Shadow Dance
		[185313] = {
			cooldown = 60,
			isTargeted = false,
		},
		-- Cold Blood
		[382245] = {
			cooldown = 45,
			isTargeted = false
		},
		-- Secret Technique
		[280719] = {
			cooldown = 60,
			isTargeted = true
		}
	},

	-- Shaman
	-- -- Elemental
	[262] = {
		-- Ascendance/Storm Keeper
		[114050] = {
			cooldown = 180,
			isTargeted = false
		},
		[191634] = {
			cooldown = 60,
			isTargeted = false
		}
	},
	-- -- Enhancement
	[263] = {
		-- Ascendance + Doom Winds
		[114051] = {
			cooldown = 180,
			isTargeted = false
		},
		[384352] = {
			cooldown = 90,
			isTargeted = true
		}
	},

	-- Warlock
	-- -- Afflication
	[265] = {
		-- Rapid Contagion
		[344566] = {
			cooldown = 30,
			isTargeted = false
		},
		-- Phantom Singularity
		[205179] = {
			cooldown = 45,
			isTargeted = true
		}
	},
	-- -- Demonlogy
	[266] = {
		-- Summon Demonic Tyrant
		[265187] = {
			cooldown = 90,
			isTargeted = false
		}
	},
	-- -- Destruction
	[267] = {
		-- Summon Infernal
		[1122] = {
			cooldown = 90,
			isTargeted = false
		}
	},

	-- Warrior
	-- -- Arms
	[71] = {
		-- Avatar + Colossus Smash
		[401150] = {
			cooldown = 90,
			isTargeted = false
		},
		[167105] = {
			cooldown = 45,
			isTargeted = true
		}
	},
	-- -- Fury
	[72] = {
		-- Avatar
		[401150] = {
			cooldown = 90,
			isTargeted = false
		}
	}
}

local ICON_HEIGHT = 64
local ICON_WIDTH = 64

local BT = {
	Frame = nil,
	CDButtons = {}
}

BT.Frame = CreateFrame("Frame", nil, UIParent)
BT.Frame:SetPoint("CENTER", 0, 0)

function BT:DrawButtonsForSpecIDs(...)
	BT:HideAllCDs()

	local allCDs = {}
	local allCDsLen = 0
	for _, specID in ipairs(args) do
		local specCDs = BT:GetSortableListBySpecID(specID)
		for _, specCD in ipairs(specCDs) do
			table.insert(allCDs, specCD)
			allCDsLen = allCDsLen + 1
		end
	end
	table.sort(allCDs, BT.CDSort)

	-- Resize frame for new icons
	BT.Frame:SetSize(ICON_WIDTH, allCDsLen * (ICON_HEIGHT + 4))

	-- Build and draw new icons
	for i, cd in ipairs(allCDs) do
		if BT.CDButtons[i] == nil then
			BT.CDButtons[i] = CreateFrame("Button", nil, BT.Frame)
		end
		BT.CDButtons[i]:SetSize(ICON_WIDTH, ICON_HEIGHT)
		BT.CDButtons[i].Icon = BT.CDButtons[i]:CreateTexture(nil, "ARTWORK")
		BT.CDButtons[i].Icon:SetSize(ICON_WIDTH, ICON_HEIGHT)
		BT.CDButtons[i].Icon:SetPoint("TOPLEFT", 0, 0)
		--BT.CDButtons[i].Text = BT.CDButtons[i]:CreateFontString(nil, "ARTWORK", "GameFontNormal")

		-- Position icon and show
		BT.CDButtons[i]:SetPoint("TOPLEFT", 0, i * (ICON_HEIGHT + 4))
		BT.CDButtons[i]:Show()
	end
end

function BT:HideAllCDs()
	for _,frame in ipairs(BT.CDButtons) do
		frame:Hide()
	end
end

function BT:GetSortableListBySpecID(specID)
	if cdsBySpec[specID] == nil then
		return {}
	end
	local sortable = {}
	for k, v in pairs(cdsBySpec[specID]) do
		v.spellID = k
		table.insert(sortable, v)
	end
	return sortable
end

function BT:CDSort(a, b)
	return a.cooldown < b.cooldown
end

local enterWorldFrame = CreateFrame("Frame", nil, UIParent)
enterWorldFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
enterWorldFrame:SetScript("OnEvent", function(self, event)

	-- Run once per load
	enterWorldFrame:UnregisterAllEvents()
end)

-- Testing only
local targetChangedFrame = CreateFrame("Frame", nil, UIParent)
targetChangedFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
targetChangedFrame:RegisterEvent("INSPECT_READY")
targetChangedFrame:SetScript("OnEvent", function(self, event, ...)
	print("EVENT: " .. event)
	if event == "PLAYER_TARGET_CHANGED" then
		return HandlePlayerTargetChanged(self, event)
	end
	if event == "INSPECT_READY" then
		HandleInspectReady(self, ...)
	end
end)

function HandlePlayerTargetChanged(self, event)
	if not UnitExists("target") then
		return
	end
	local className, classFilename, classID = UnitClass("target")

	if not CheckInteractDistance("target", 1) or not CanInspect("target") then
		print("Cant check")
		return
	end
	NotifyInspect("target");
end

function HandleInspectReady(self, guid)
	print("inspect ready: " .. guid)
	local specID = GetInspectSpecialization("target")
	-- local id, name, _, icon, role, classFile, className = GetSpecializationInfoByID(specID)
	-- print("[" .. id .. "] " .. name .. " (" .. role .. ", " .. className .. "): ")
	print("SpecID: " .. specID)
	BT:DrawButtonsForSpecIDs(specID)
	ClearInspectPlayer()
end
