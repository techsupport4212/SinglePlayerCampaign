return {
	Fighters = {
		["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99, TechLevel = LessThan(4)}
		},
		["TIE_DROID_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99, TechLevel = IsOneOf({4, 5})}
		},
		["SUPER_TIE_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99, TechLevel = GreaterOrEqualTo(6)}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["BETA_ETR_3_SQUADRON"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}