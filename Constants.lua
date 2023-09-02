local _, addon = ...

addon.NAME = "BetterTrader"

-- REFURL: https://wowpedia.fandom.com/wiki/ClassId
addon.ClassIDs = {
	WARRIOR = 1,
	PALADIN = 2,
	HUNTER = 3,
	ROGUE = 4,
	PRIEST = 5,
	DEATH_KNIGHT = 6,
	SHAMAN = 7,
	MAGE = 8,
	WARLOCK = 9,
	MONK = 10,
	DRUID = 11,
	DEMON_HUNTER = 12,
	EVOKER = 13,
}

-- REFURL: https://wowpedia.fandom.com/wiki/SpecializationID
addon.SpecIDs = {
	-- Death Knight
	BLOOD = 250,
	FROST = 251,
	UNHOLY = 252,
	-- Demon Hunter
	-- Druid
	-- Evoker
	-- Hunter
	-- Mage
	-- Monk
	-- Paladin
	-- Priest
	-- Rogue
	-- Shaman
	-- Warlock
	-- Warrior
}

-- REFURL: https://wowpedia.fandom.com/wiki/Magic_schools
addon.DamageTypes = {
	PHYSICAL = Bit.bit32.lshift(1, 0),
	ARCANCE = Bit.bit32.lshift(1, 1),
	FIRE = Bit.bit32.lshift(1, 2),
	FROST = Bit.bit32.lshift(1, 3),
	NATURE = Bit.bit32.lshift(1, 4),
	SHADOW = Bit.bit32.lshift(1, 5),
	HOLY = Bit.bit32.lshift(1, 6),
}

addon.DamageTypes.ALL = Bit.bit32.bor(
	addon.DamageTypes.PHYSICAL,
	addon.DamageTypes.ARCANCE,
	addon.DamageTypes.FIRE,
	addon.DamageTypes.FROST,
	addon.DamageTypes.NATURE,
	addon.DamageTypes.SHADOW,
	addon.DamageTypes.HOLY
)
