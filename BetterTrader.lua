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

local ICON_HEIGHT = 48
local ICON_WIDTH = 48

local BT = {
	Frame = nil,
	CDButtons = {}
}

BT.Frame = CreateFrame("Frame", nil, UIParent)
BT.Frame:SetPoint("TOPLEFT", 8, 8)
BT.Frame:Hide()

BT.Frame:RegisterEvent("ARENA_OPPONENT_UPDATE")
BT.Frame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")

function BT.Frame:OnEvent(event, eventUnit)
	local unit = self.unit
	if not eventUnit or eventUnit ~= unit then
		return
	end
	BT:ShowArenaCDs()
end

function BT:ShowArenaCDs()
	local _, instanceType = IsInInstance()
	if instanceType ~= "arena" then
		BT:HideCDs()
		return
	end
	BT:DrawButtonsForSpecIDs(BT:GetArenaSpecs())
end

function BT:GetArenaSpecs()
	local specIDs = {}
	local numOpps = GetNumArenaOpponentSpecs()
	for i = 1, numOpps do
		local specID = GetArenaOpponentSpec(i)
		if specID > 0 then
			table.insert(specIDs, specID)
		end
	end
	return specIDs
end

function BT:DrawButtonsForSpecIDs(...)
	local args = { ... }
	BT:HideCDs()

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
		local _, _, icon = GetSpellInfo(cd.spellID)

		-- Setup Icon Parent
		if BT.CDButtons[i] == nil then
			BT.CDButtons[i] = CreateFrame("Button", nil, BT.Frame)
		end
		BT.CDButtons[i]:SetSize(ICON_WIDTH, ICON_HEIGHT)

		-- Icon
		BT.CDButtons[i].Icon = BT.CDButtons[i]:CreateTexture(nil, "ARTWORK")
		BT.CDButtons[i].Icon:SetTexture(icon)
		BT.CDButtons[i].Icon:SetSize(ICON_WIDTH, ICON_HEIGHT)
		BT.CDButtons[i].Icon:SetPoint("TOPLEFT", 0, 0)
		-- Text
		BT.CDButtons[i].Text = BT.CDButtons[i]:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		BT.CDButtons[i].Text:SetPoint("CENTER", 0, 0)
		BT.CDButtons[i].Text:SetText(cd.cooldown)

		-- Position icon and show
		BT.CDButtons[i]:SetPoint("TOPLEFT", 0, i * (ICON_HEIGHT + 4))
		BT.CDButtons[i]:Show()
	end
end

function BT:HideCDs()
	for _, frame in ipairs(BT.CDButtons) do
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
	if b == nil then
		return a
	end
	return a.cooldown < b.cooldown
end
