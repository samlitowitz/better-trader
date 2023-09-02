local addonName, addon = ...

local GetAddOnMetadata = GetAddOnMetadata
local GetSpellTexture = GetSpellTexture

BetterTrader = LibStub("AceAddon-3.0"):NewAddon(addon.NAME)

local DB_VERSION = 1

function BetterTrader:Print(...)
	self.console:Print(DEFAULT_CHAT_FRAME, "|c000000ff" .. addon.NAME .. "|r:", ...)
end

function BetterTrader:OnInitialize()
	self.console = LibStub("AceConsole-3.0")
	self.db = LibStub("AceDB-3.0"):New("BetterTraderDB", {
		global = { version = DB_VERSION },
		profile = { }
	}, true)

	self.author = GetAddOnMetadata(addonName, "Author") or ""
	self.version = { string = GetAddOnMetadata(addonName, "Version") or "" }
	self.version.major, self.version.minor = self.version.string:match("(%d+)%.(%d+)")

	self.version.major = tonumber(self.version.major)
	self.version.minor = tonumber(self.version.minor)

	self:SetupOptions()

	self:Print("Initialized")
	self:Print("Addon Name: " .. addonName)
end

function BetterTrader:OnEnable()
	self:Print("Enabled")
end

function BetterTrader:OnDisable()
	self:Print("Disabled")
end

function BetterTrader:GetSpellTexture(spellID)
	spellID = tonumber(spellID)
	if addon.Cooldowns[spellID] and addon.Cooldowns[spellID].icon then
		return addon.Cooldowns[spellID].icon
	end
	return GetSpellTexture(spellID)
end
