local _, addon = ...

addon.Spells = {
	-- Death Knight
	-- -- Blood
	-- -- Frost
	-- -- -- Icebound Fortitude
	[48792] = {
		isDefensive = true,
		isOffensive = false,
		cooldown_seconds = 120,
		classID = addon.ClassIDs.DEATH_KNIGHT,
		specID = addon.SpecIDs.FROST,
		damageType = addon.DamageTypes.ALL,
	},
	-- -- -- Pillar of Frost
	[51271] = {
		isDefensive = false,
		isOffensive = true,
		cooldown_seconds = 60,
		classID = addon.ClassIDs.DEATH_KNIGHT,
		specID = addon.SpecIDs.FROST,
		damageType = Bit.bit32.bor(addon.DamageTypes.PHYSICAL, addon.DamageTypes.FROST),
	}
	-- -- Unholy
}
