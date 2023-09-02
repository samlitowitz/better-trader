local _, addon = ...

local BetterTrader = LibStub("AceAddon-3.0"):GetAddon(addon.NAME)
local SecondsToTime = SecondsToTime
local Spell = Spell
local format = format
local nop = nop

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
						set = function(info, classID)

						end,
					},
					-- spec filter?
					typeFilter = {
						name = "Type Filter",
						type = "select",
						order = 2,
						values = typeList,
						sorting = typeListOrder,
						set = function(info, type)

						end
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
				args = {
					spellList = {
						name = "Spells",
						type = "group",
						order = 3,
						args = GetSpellList(),
					}
				},
			}
		},
	}
	LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.NAME, self.options)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon.NAME, addon.NAME)
end

function GetSpellList(classID, specID, isDefensive, isOffensive)
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
				get = function(info, spellID)

				end,
				set = function(info, spellID)

				end,
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

function GetSpell(spellID, spell, classID, specID, isDefensive, isOffensive)
	if spellID == nil then
		return nil
	end
	if spell == nil then
		return nil
	end
	if classID ~= nil then
		classID = tonumber(classID)
	end
	if spell.classID ~= classID then
		return nil
	end
	if specID ~= nil then
		specID = tonumber(specID)
	end
	if spell.specID ~= specID then
		return nil
	end

	if spell.isDefensive and spell.isDefensive ~= isDefensive then
		return nil
	end
	if spell.isOffensive and spell.isOffensive ~= isOffensive then
		return nil
	end

	local spellName = GetSpellInfo(spellID)
	if spellName == nil then
		return nil
	end
	end
