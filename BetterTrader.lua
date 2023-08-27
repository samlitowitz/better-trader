local cdsBySpec = {
	-- DK
	-- -- Blood
	[250] = {},
	-- -- Frost
	[251] = {
		-- Pillar of Frost
		{
			spellID = 51271,
			cooldown = 60,
			isTargeted = false
		}
	},
	-- -- Unholy
	[252] = {
		-- Dark Transformation
		{
			spellID = 63560,
			cooldown = 60,
			isTargeted = false
		},
		-- Unholy Assault
		{
			spellID = 207289,
			cooldown = 90,
			isTargeted = false
		}
	},

	-- DH
	-- -- Havoc
	[577] = {
		-- Essence Break
		{
			spellID = 258860,
			cooldown = 40,
			isTargeted = false
		},
		-- Metamorphosis
		{
			spellID = 191427,
			cooldown = 240,
			isTargeted = false
		},
		-- The Hunt
		{
			spellID = 370965,
			cooldown = 90,
			isTargeted = true
		}
	},

	-- Druid
	-- -- Balance
	[102] = {
		-- Incarnation: Chosen of Elune
		{
			spellID = 102560,
			cooldown = 180,
			isTargeted = false
		},
		-- Celestial Alignment
		{
			spellID = 383410,
			cooldown = 180,
			isTargeted = false
		}
	},
	-- -- Feral
	[103] = {
		-- Incarnation: King of the Jungle
		{
			spellID = 102543,
			cooldown = 180,
			isTargeted = false
		},
		-- Berserk
		{
			spellID = 106951,
			cooldown = 180,
			isTargeted = false
		}
	},

	-- Evoker
	-- -- Augmentation
	[1473] = {
		-- Tip the Scales
		{
			spellID = 370553,
			cooldown = 120,
			isTargeted = false
		},
		-- Breath of Eons
		{
			spellID = 403631,
			cooldown = 120,
			isTargeted = false
		}
	},
	-- -- Devastation
	[1467] = {
		-- Tip the Scales
		{
			spellID = 370553,
			cooldown = 120,
			isTargeted = false
		},
		-- Dragonrage
		{
			spellID = 375087,
			cooldown = 120,
			isTargeted = false
		}
	},

	-- Hunter
	-- -- Beast Mastery
	[253] = {
		-- Bestial Wrath
		{
			spellID = 19574,
			cooldown = 90,
			isTargeted = false
		}
	},
	-- -- Marksmanship
	[254] = {
		-- Trueshot
		{
			spellID = 288613,
			cooldown = 120,
			isTargeted = false
		}
	},
	-- -- Survival
	[255] = {
		-- Coordinated Assault
		{
			spellID = 360952,
			cooldown = 120,
			isTargeted = false
		}
	},

	-- Mage
	-- -- Arcane
	[62] = {
		-- Arcane Surge
		{
			spellID = 365350,
			cooldown = 90,
			isTargeted = true
		}
	},
	-- -- Fire
	[63] = {
		-- Combustion
		{
			spellID = 190319,
			cooldown = 120,
			isTargeted = false
		}
	},
	-- -- Frost
	[64] = {
		-- Icy Veins
		{
			spellID = 12472,
			cooldown = 120,
			isTargeted = false
		}
	},

	-- Monk
	-- Windwalker
	[269] = {
		-- Invoke Xuen
		{
			spellID = 123904,
			cooldown = 120,
			isTargeted = false
		},
		-- Serenity
		{
			spellID = 152173,
			cooldown = 90,
			isTargeted = false
		}
	},

	-- Paladin
	-- -- Retribution
	[70] = {
		{
			spellID = 31884,
			cooldown = 120,
			isTargeted = false
		}
	},

	-- Priest
	-- -- Shadow
	[258] = {
		-- Dark Ascension
		{
			spellID = 391109,
			cooldown = 60,
			isTargeted = false
		},
		-- Void Eruption
		{
			spellID = 228260,
			cooldown = 120,
			isTargeted = true
		}
	},

	-- Rogue
	-- -- Assassination
	[259] = {
		-- Deathmark
		{
			spellID = 360194,
			cooldown = 120,
			isTargeted = true
		}
	},
	-- -- Outlaw
	[260] = {
		-- Adrenaline Rush
		{
			spellID = 13750,
			cooldown = 180,
			isTargeted = false
		}
	},
	-- -- Subtlety
	[261] = {
		-- Shadow Dance
		{
			spellID = 185313,
			cooldown = 60,
			isTargeted = false,
		},
		-- Cold Blood
		{
			spellID = 382245,
			cooldown = 45,
			isTargeted = false
		},
		-- Secret Technique
		{
			spellID = 280719,
			cooldown = 60,
			isTargeted = true
		}
	},

	-- Shaman
	-- -- Elemental
	[262] = {
		-- Ascendance/Storm Keeper
		{
			spellID = 114050,
			cooldown = 180,
			isTargeted = false
		},
		{
			spellID = 191634,
			cooldown = 60,
			isTargeted = false
		}
	},
	-- -- Enhancement
	[263] = {
		-- Ascendance + Doom Winds
		{
			spellID = 114051,
			cooldown = 180,
			isTargeted = false
		},
		{
			spellID = 384352,
			cooldown = 90,
			isTargeted = true
		}
	},

	-- Warlock
	-- -- Afflication
	[265] = {
		-- Rapid Contagion
		{
			spellID = 344566,
			cooldown = 30,
			isTargeted = false
		},
		-- Phantom Singularity
		{
			spellID = 205179,
			cooldown = 45,
			isTargeted = true
		}
	},
	-- -- Demonlogy
	[266] = {
		-- Summon Demonic Tyrant
		{
			spellID = 265187,
			cooldown = 90,
			isTargeted = false
		}
	},
	-- -- Destruction
	[267] = {
		-- Summon Infernal
		{
			spellID = 1122,
			cooldown = 90,
			isTargeted = false
		}
	},

	-- Warrior
	-- -- Arms
	[71] = {
		-- Avatar + Colossus Smash
		{
			spellID = 401150,
			cooldown = 90,
			isTargeted = false
		},
		{
			spellID = 167105,
			cooldown = 45,
			isTargeted = true
		}
	},
	-- -- Fury
	[72] = {
		-- Avatar
		{
			spellID = 401150,
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
BT.Frame:SetPoint("TOPLEFT", UIParent, 8, -8)
BT.Frame:Show()

BT.Frame:RegisterEvent("ARENA_OPPONENT_UPDATE")
BT.Frame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
BT.Frame:RegisterEvent("PLAYER_ENTERING_WORLD")

BT.Frame:SetScript("OnEvent", function(self, event)
	BT:ShowArenaCDs()
end)

function BT:ShowArenaCDs()
	local _, instanceType = IsInInstance()
	if instanceType ~= "arena" then
		BT:HideCDs()
		return
	end
	local specIDs = BT:GetArenaSpecs()
	if specIDs == nil then
		return
	end
	BT:DrawButtonsForSpecIDs(unpack(specIDs))
end

function BT:DrawButtonsForSpecIDs(...)
	BT:HideCDs()

	local allCDs, allCDsLen = BT:GetCDsForSpecIDs(...)
	table.sort(allCDs, function(a, b)
		return a.cooldown > b.cooldown
	end)

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
		BT.CDButtons[i]:SetPoint("TOPLEFT", 0, ICON_HEIGHT - i * (ICON_HEIGHT + 4))
		BT.CDButtons[i]:Show()
	end
end

function BT:HideCDs()
	for _, frame in ipairs(BT.CDButtons) do
		frame:Hide()
	end
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

function BT:GetCDsForSpecIDs(...)
	local args = { ... }
	local cds = {}
	local cdsLen = 0
	for _, specID in ipairs(args) do
		local specCDs = BT:GetCDsForSpecID(specID)
		for _, cd in ipairs(specCDs) do
			if cd ~= nil then
				table.insert(cds, cd)
				cdsLen = cdsLen + 1
			end
		end
	end
	return cds, cdsLen
end

function BT:GetCDsForSpecID(specID)
	if cdsBySpec[specID] == nil then
		return {}
	end
	return cdsBySpec[specID]
end
