local _, addon = ...

local BetterTrader = LibStub("AceAddon-3.0"):GetAddon(addon.NAME)

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
		DEFENSIVE,
		OFFENSIVE,
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
					},
					-- spec filter?
					typeFilter = {
						name = "Type Filter",
						type = "select",
						order = 2,
						values = typeList,
						sorting = typeListOrder,
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
