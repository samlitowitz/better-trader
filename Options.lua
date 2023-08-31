local addonName, addon = ...

local BetterTrader = LibStub("AceAddon-3.0"):GetAddon(addon.NAME)

function BetterTrader:SetupOptions()
	self.options = {
		name = addon.NAME,
		descStyle = "inline",
		type = "group",
		args = {},
	}
	LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.NAME, self.options)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon.NAME, addon.NAME)
end
