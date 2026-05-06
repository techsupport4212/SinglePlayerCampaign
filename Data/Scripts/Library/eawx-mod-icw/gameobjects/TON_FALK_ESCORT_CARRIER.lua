return {
	Ship_Crew_Requirement = 84,
	Fighters = {
		["LOADOUT_FULL_FIGHTERS"] = {
			DEFAULT = {Initial = 4, Reserve = 2}
		},
		["LOADOUT_MIXED_FIGHTERS"] = {
			DEFAULT = {Initial = 2, Reserve = 1},
		},
		["LOADOUT_MIXED_BOMBERS"] = {
			DEFAULT = {Initial = 1, Reserve = 1},
		},
		["LOADOUT_FULL_BOMBERS"] = {
			DEFAULT = {Initial = 2, Reserve = 3},
		},
	},
	Native = "IMPERIAL",
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}