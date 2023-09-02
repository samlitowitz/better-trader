local _, addon = ...

local BetterTrader = LibStub("AceAddon-3.0"):GetAddon(addon.NAME)

function BetterTrader:SetupOptions()
	local classList = {}
	local classListOrder = {}
	for k,v in pairs(addon.ClassIDsByClassNameMap) do
		classList[v] = k
		table.insert(classListOrder, v)
	end

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
					-- class filter
					classFilter = {
						name = "Class Filter",
						type = "select",
						order = 1,
						values = classList,
						sorting = classListOrder,
					}
					-- spec filter?
					-- offensive/defensive filter
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
