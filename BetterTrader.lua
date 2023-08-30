local addonName, addon = ...

BetterTrader = LibStub("AceAddon-3.0"):NewAddon("BetterTrader")
AceConsole = LibStub("AceConsole-3.0")

function BetterTrader:Print(...)
	AceConsole:Print(DEFAULT_CHAT_FRAME, "|c0000ffBetterTrader|r:", ...)
end

function BetterTrader:OnInitialize()
	BetterTrader:Print("Initialized")
end

function BetterTrader:OnEnable()
	BetterTrader:Print("Enabled")
end

function BetterTrader:OnDisable()
	BetterTrader:Print("Disabled")
end
