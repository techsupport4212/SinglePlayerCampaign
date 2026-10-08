return {
	Fighters = {
		["VULTURE_SQUADRON"] = {
			DEFAULT = {Initial = 6, Reserve = 99}
		},
		["HYENA_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6}
		},
		["C9979_CARRIER"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["MUNIFICENT"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["MUNIFICENT_C3"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = GreaterOrEqualTo(3)}
		},
		["PROVIDENCE_CARRIER_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}