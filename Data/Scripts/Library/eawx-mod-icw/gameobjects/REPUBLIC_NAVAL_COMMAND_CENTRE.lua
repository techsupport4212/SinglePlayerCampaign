return {
	Fighters = {
		["LIGHT_FIGHTER"] = {
			DEFAULT = {Initial = 3, Reserve = 99}
		},
		["BOMBER_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["TIE_DEFENDER_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6}
		},
		["SKIRMISH_IMPERIAL_DHC"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["SKIRMISH_VICTORY_I_STAR_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_IMPERIAL_I_STAR_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_TECTOR_STAR_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		}
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}