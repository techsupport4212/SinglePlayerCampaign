return {
	Fighters = {
		["Z95_HEADHUNTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99, TechLevel = LessThan(6)}
		},
		["DEFENDER_STARFIGHTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99, TechLevel = GreaterOrEqualTo(6)}
		},
		["X_WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["Y_WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = LessThan(6)}
		},
		["B_WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(6)}
		},
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}