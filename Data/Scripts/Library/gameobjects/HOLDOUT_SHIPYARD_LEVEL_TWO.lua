return {
	Fighters = {
		["VULTURE_SQUADRON"] = {
			DEFAULT = {Initial = 2, Reserve = 99, TechLevel = LessThan(4)}
		},
		["HYENA_SQUADRON"] = {
			DEFAULT = {Initial = 2, Reserve = 2}
		},
		["C9979_CARRIER"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["MUNIFICENT"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["MUNIFICENT_C3"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["PROVIDENCE_CARRIER_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}