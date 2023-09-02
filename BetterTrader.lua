local addonName, addon = ...

local GetAddOnMetadata = GetAddOnMetadata
local GetSpellTexture = GetSpellTexture
local format = format

BetterTrader = LibStub("AceAddon-3.0"):NewAddon(addon.NAME)

local DB_VERSION = 1

function BetterTrader:Print(...)
	self.console:Print(DEFAULT_CHAT_FRAME, "|c000000ff" .. addon.NAME .. "|r:", ...)
end

function BetterTrader:ToString(input)
	local typeCases = {
		["boolean"] = function(v)
			return v and "true" or "false"
		end,
		["function"] = function()
			return "function"
		end,
		["nil"] = function()
			return "nil"
		end,
		["number"] = function(v)
			return tostring(v)
		end,
		["string"] = function(v)
			return v
		end,
		["table"] = function(t)
			local buf = "{\n"
			for k, v in pairs(t) do
				buf = buf .. k .. ": " .. BetterTrader:ToString(v) .. "\n"
			end
			buf = buf .. "}"
			return buf
		end,
	}
	local vFn = typeCases[type(input)]
	if vFn == nil then
		return "<UNKNOWN_TYPE>"
	end
	return vFn(input)
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
	if addon.Spells[spellID] and addon.Spells[spellID].icon then
		return addon.Spells[spellID].icon
	end
	return GetSpellTexture(spellID)
end
