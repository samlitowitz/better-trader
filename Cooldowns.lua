local _, addon = ...

addon.Cooldowns = {
	-- Death Knight
	-- -- Blood
	-- -- Frost
	-- -- -- Icebound Fortitude
	[48792] = {
		isDefensive = true,
		isOffensive = false,
		cooldown_in_seconds = 120,
		classID = addon.ClassIDs.DEATH_KNIGHT,
		specID = addon.SpecIDs.FROST,
		damageType = addon.DamageTypes.ALL,
	},
	-- -- -- Pillar of Frost
	[51271] = {
		isDefensive = false,
		isOffensive = true,
		cooldown_in_seconds = 60,
		classID = addon.ClassIDs.DEATH_KNIGHT,
		specID = addon.SpecIDs.FROST,
		damageType = Bit.bit32.bor(addon.DamageTypes.PHYSICAL, addon.DamageTypes.FROST),
	}
	-- -- Unholy
}
