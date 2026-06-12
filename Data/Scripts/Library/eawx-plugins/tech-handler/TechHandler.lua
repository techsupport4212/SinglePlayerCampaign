require("deepcore/std/class")
require("eawx-events/GenericResearch")
require("eawx-events/GenericSwap")
require("eawx-util/StoryUtil")

---@class TechHandler
TechHandler = class()

function TechHandler:new(galactic_conquest, human_player, planets)
	self.galactic_conquest = galactic_conquest
	self.human_player = human_player
	self.planets = planets

		-- galactic_conquest,
		-- event_name,
		-- research_dummy,
		-- player,
		-- unlock_list,
		-- lock_list,
		-- spawn_list, spawn_planet,
		-- chained_effect
		-- required_planet

	self.RepublicStarDestroyerResearch = GenericResearch(self.galactic_conquest,
		"REPUBLIC_STAR_DESTROYER_RESEARCH",
		"Dummy_RepublicSD",
		{"Rebel"},
		{"Republic_Star_Destroyer","Snunb_Resolve_Dummy"}
		)

	self.ImperialStarDestroyerTwoResearch = GenericResearch(self.galactic_conquest,
		"IMPERIAL_STAR_DESTROYER_TWO_RESEARCH",
		"Dummy_Research_Star_Destroyer_Two",
		{"Empire"},
		{"Imperial_II_Star_Destroyer"}
		)

	self.IPV1Research = GenericResearch(self.galactic_conquest,
		"IPV1_RESEARCH",
		"Dummy_Research_IPV1",
		{"Empire"},
		{"IPV1"},
		{"Charger_C70","Dummy_Research_Raider_I"}
		)

	self.Raider1Research = GenericResearch(self.galactic_conquest,
		"RAIDER_I_RESEARCH",
		"Dummy_Research_Raider_I",
		{"Empire"},
		{"Raider_I_Corvette","Dummy_Research_Raider_II"},
		{"Charger_C70","Dummy_Research_IPV1"}
		)

	self.Raider2Research = GenericResearch(self.galactic_conquest,
		"RAIDER_II_RESEARCH",
		"Dummy_Research_Raider_II",
		{"Empire"},
		{"Raider_II_Corvette"}
		)

	self.AtAtResearch = GenericResearch(self.galactic_conquest,
		"AT_AT_RESEARCH",
		"Dummy_Research_AT_AT",
		{"Empire"},
		{"Imperial_AT_AT_Walker_Company"},
		{"Imperial_AT_TE_Walker_Company"}
		)

	self.NCMP1Research = GenericResearch(self.galactic_conquest,
		"NCMP1_RESEARCH",
		"Dummy_NewClass",
		{"Rebel"},
		{"Sacheen","Hajen","Corona","Belarus","REC_HQ"},
		{"Nebulon_B_Frigate","Nebulon_B_Tender"}
		)

	self.NCMP2Research = GenericResearch(self.galactic_conquest,
		"NCMP2_RESEARCH",
		"Dummy_NewClass_PhaseTwo",
		{"Rebel"},
		{"Agave_Corvette","Warrior_Gunship","Majestic","Defender_Carrier","Nebula_Star_Destroyer","Endurance_Fleet_Carrier","SovvDaunt2VP","Bell_Endurance_Dummy"},
		{"CR90","DP20","Quasar","Liberator_Cruiser"},
		nil,nil,
		{"NCMP2_HEROES"}
		)

	 self.AAC3Research = GenericResearch(self.galactic_conquest,
		"AAC3_RESEARCH",
		"Dummy_AAC3",
		{"Rebel"},
		{"AAC_3_Company"},
		{"New_Republic_AAC_2_Company"}
		)

	self.CoronaResearch = GenericResearch(self.galactic_conquest,
		"CORONA_RESEARCH",
		"Dummy_Research_Corona", {"Zsinj_Empire"},
		{"Corona"},
		{"Imperial_Nebulon_B"})

	self.GorathResearch = GenericResearch(self.galactic_conquest,
		"GORATH_RESEARCH",
		"Dummy_Research_Gorath", {"Greater_Maldrood"},
		{"Strike_Cruiser_Gorath"},
		{"Strike_Cruiser"})

	self.TempestResearch = GenericResearch(self.galactic_conquest,
		"TEMPEST_RESEARCH",
		"Dummy_Research_Tempest",
		{"Hutt_Cartels"},
		{"Tempest_Cruiser"},
		nil,
		{"Mika_Tempest"},"NAL_HUTTA",
		nil, nil,
		true
		)

	self.ViscountResearch = GenericResearch(self.galactic_conquest,
		"VISCOUNT_RESEARCH",
		"Dummy_Viscount",
		{"Rebel"},
		{"Viscount_Star_Defender"},
		nil,
		{"Mini_Viscount"},"MON_CALAMARI",
		nil,
		"MON_CALAMARI"
		)

	self.MediatorResearch = GenericResearch(self.galactic_conquest,
		"MEDIATOR_RESEARCH",
		"Dummy_Mediator",
		{"Rebel"},
		{"Mediator","Iblis_Selonian_Fire_Harbinger_Dummy","Iblis_Bail_Organa_Harbinger_Dummy"},
		{"Home_One_Type","Bulwark_III"},
		nil,nil,
		{"MEDIATOR_HEROES","MC_HEAVY_CARRIER_RESEARCH"},
		"MON_CALAMARI"
		)

	self.MCHeavyCarrierResearch = GenericResearch(self.galactic_conquest,
		"MC_HEAVY_CARRIER_RESEARCH",
		"Dummy_MC_Heavy_Carrier",
		{"Rebel"},
		{"MC_Heavy_Carrier"},
		nil,
		nil,nil,
		nil,
		"MON_CALAMARI"
		)
end

function TechHandler:update()
	--this space intentionally left blank
end

return TechHandler
