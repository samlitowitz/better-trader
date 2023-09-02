local _, addon = ...

local BetterTrader = LibStub("AceAddon-3.0"):GetAddon(addon.NAME)
local SecondsToTime = SecondsToTime
local Spell = Spell
local format = format
local nop = nop

local function getSetDebug(info, ...)
	local args = {...}
	BetterTrader:Print(BetterTrader:ToString(info))
	BetterTrader:Print(BetterTrader:ToString(args))
end

function BetterTrader:SetupOptions()
	local classList = {
		[0] = "All"
	}
	local classListOrder = {
		0,
	}
	for k, v in pairs(addon.ClassIDsByClassNameMap) do
		classList[v] = k
		table.insert(classListOrder, v)
	end

	local typeList = {
		DEFENSIVE = "Defensive",
		OFFENSIVE = "Offensive",
	}
	local typeListOrder = {
		"DEFENSIVE",
		"OFFENSIVE",
	}

	self.options = {
		name = addon.NAME,
		descStyle = "inline",
		type = "group",
		plugins = {
			profiles = {
				profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db),
			}
		},
		childGroups = "tab",
		args = {
			version = {
				order = 1,
				type = "description",
				name = "Version: " .. self.version.string .. "\n",
				cmdHidden = true,
			},
			author = {
				order = 2,
				type = "description",
				name = "Author: " .. self.author .. "\n",
				cmdHidden = true,
			},
			cooldowns = {
				name = "Cooldowns",
				type = "group",
				order = 3,
				childGroups = "tab",
				args = {
					classFilter = {
						name = "Class Filter",
						type = "select",
						order = 1,
						values = classList,
						sorting = classListOrder,
						set = getSetDebug,
					},
					-- spec filter?
					typeFilter = {
						name = "Type Filter",
						type = "select",
						order = 2,
						values = typeList,
						sorting = typeListOrder,
					},
					spellList = {
						name = "Spells",
						type = "group",
						order = 3,
						args = GetSpellList(),
					}
				},
			},
			test = {
				name = "Test",
				type = "group",
				order = 4,
				childGroups = "tab",
				args = {},
			}
		},
	}
	LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.NAME, self.options)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon.NAME, addon.NAME)
end

function GetSpellList()
	local spells = {}
	local descriptions = {}

	for spellID, spell in pairs(addon.Spells) do
		local spellName = GetSpellInfo(spellID)
		if spellName then
			local spellTexture = BetterTrader:GetSpellTexture(spellID) or ""
			local s = Spell:CreateFromSpellID(spellID)
			s:ContinueOnSpellLoad(function()
				descriptions[spellID] = s:GetSpellDescription()
			end)
			spells[tostring(spellID)] = {
				type = "toggle",
				width = "full",
				hidden = nop,
				arg = spellID,
				get = getSetDebug,
				set = getSetDebug,
				desc = function()
					local cooldown_seconds = "unknown"
					if type(spell.cooldown_seconds) == "number" and spell.cooldown_seconds then
						cooldown_seconds = SecondsToTime(spell.cooldown_seconds)
					end
					local spellDesc = descriptions[spellID] or ""
					return format(
						"%s\n\n|cffffd700 Spell ID|r %d\n\n|cffffd700 Cooldown|r %s",
						spellDesc,
						spellID,
						cooldown_seconds
					)
				end,
				name = function()
					return format("|T%s:20|t %s", spellTexture, spellName)
				end
			}
		end
	end
	return spells
end


