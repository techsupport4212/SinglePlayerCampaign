--*****************************************************
--******  Thrawn's Revenge: Zaarin Insurrection  ******
--*****************************************************

require("PGStoryMode")
require("deepcore/crossplot/crossplot")
require("eawx-util/ChangeOwnerUtilities")
require("deepcore/std/class")
require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("CustomLibrary")
require("SetFighterResearch")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	StoryModeEvents = {
		Trigger_Determine_Faction = State_Determine_Faction,
		Trigger_Delayed_Initialize = State_Delayed_Initialize,
	}

	p_newrep = Find_Player("Rebel")
	p_empire = Find_Player("Empire")
	p_zann = Find_Player("Zsinj_Empire")
	p_senate = Find_Player("Warlords")
	p_sith = Find_Player("Killik_Hives")
	crossplot:galactic()
end

function State_Determine_Faction(message)
	if message == OnEnter then
		p_empire.Make_Enemy(p_senate)
		p_senate.Make_Enemy(p_empire)
		if p_empire.Is_Human() then
			Story_Event("GE_STORY_START")
		end
        senate_planet = FindPlanet("Coruscant")
        if senate_planet.Get_Owner() == p_senate then
            spawn_list = {"Emperor_Palpatine_Team"}
            SpawnList(spawn_list, senate_planet, p_senate, true, false)
        end
        empire_planet = FindPlanet("Parmel")
        if empire_planet.Get_Owner() == p_empire then
            spawn_list = {"Kuuztin_Couragous", "Thrawn_Commander_Stalwart", "Vader_Stealth_Team"}
            SpawnList(spawn_list, empire_planet, p_empire, true, false)
        end
        sith_planet = FindPlanet("Korriban")
        if sith_planet.Get_Owner() == p_sith then
            spawn_list = {"Jedgar_Team", "Kadann_Team"}
            SpawnList(spawn_list, sith_planet, p_sith, true, false)
        end
        zann_planet = FindPlanet("Axxila")
        if zann_planet.Get_Owner() == p_zann then
            spawn_list = {"Tyber_Zann_Merciless", "Urai_Fen_Team", "Sykes_EndofDays"}
            SpawnList(spawn_list, zann_planet, p_zann, true, false)
        end
	else
		crossplot:update()
	end
end

function State_Delayed_Initialize(message)
	if message == OnEnter then
		local dummies = Get_FTGU_Dummies()
		local EMPIRE_PLAYER_AVAILABLE_UNITS = {
			"Imperial_Army_Trooper_Company",
			"Imperial_AT_PT_Company",
			"Chariot_LAV_Company",
			"Imperial_TX130S_Company",
			"IPV1",
			"Strike_Cruiser",
			"Victory_I_Star_Destroyer",
			"Imperial_I_Star_Destroyer",
			"RTT_Company",
			"AT_DP_Company",
			"Imperial_TX130T_Company",
			"Imperial_APC_Company",
			"Imperial_Modified_LAAT_Company",
			"Imperial_AT_TE_Walker_Company",
			"Gozanti_Cruiser_Group",
			"Arquitens",
			"Active_Frigate",
			"Victory_I_Frigate",
			"Imperial_I_Frigate",
			"Ton_Falk_Escort_Carrier",
		}
		local SEP_HOLDOUT_AVAILABLE_UNITS = {
			"HMP_Company",
			"J1_Cannon_Company",
			"MTT_Company",
			"B2_Droid_Company",
			"AAT_Company",
			"CSA_B1_Droid_Company",
			"CSA_Destroyer_Droid_Company",
			"C9979_Carrier",
			"Munificent",
			"Munificent_C3",
			"Recusant_Light_Destroyer",
			"Lucrehulk_Core_Destroyer",
			"Providence_Carrier_Destroyer",
			"Lucrehulk_CSA",
			"Diamond_Frigate",
			"DH_Omni",
			"Recusant_Dreadnought",
		}
		local ZANN_AVAILABLE_UNITS = {
			"Light_Mercenary_Company",
			"Mercenary_Company",
			"Elite_Mercenary_Company",
			"Defiler_Company",
			"Destroyer_Droid_II_Company",
			"ISP_Company",
			"AT_ST_Company",
			"Imperial_AT_AP_Walker_Company",
			"Hutt_Pod_Walker_Company",
			"MZ8_Tank_Company",
			"MAL_Rocket_Vehicle_Company",
			"Canderous_Assault_Tank_Company",
			"Canderous_Assault_Tank_Lasers_Company",
			"B5_Juggernaut_Company",
			"Keldabe",
			"Aggressor_Star_Destroyer",
			"Refit_Venator_Star_Destroyer",
			"Acclamator_II",
			"Broadside_Cruiser",
			"Star_Galleon",
			"Vengeance_Frigate",
			"Nebulon_B_Frigate",
			"Tartan_Patrol_Cruiser",
			"Marauder_Missile_Cruiser",
			"Marauder_Cruiser",
			"Action_VI_Support",
			"Interceptor_III_Frigate",
			"Interceptor_IV_Frigate",
			"Crusader_Gunship",
			"CR90",
		}
		local EMPIRE_EXTRA_LOCKS = {
			"TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET",
			"RANDOM_BOUNTY_HUNTER",
			"EMPIRE_CAPITAL",
		}
		local ZANN_EXTRA_LOCKS = {
			"RASLAN_RAZORS_KISS_DUMMY",
			"ZSINJ_IRON_FIST_DUMMY",
		}
		if dummies.EMPIRE ~= nil and dummies.EMPIRE.RosterUnits ~= nil then
			UnitUtil.SetLockList("Empire", dummies.EMPIRE.RosterUnits, false)
			UnitUtil.SetLockList("Empire", EMPIRE_PLAYER_AVAILABLE_UNITS)
			UnitUtil.SetLockList("Empire", EMPIRE_EXTRA_LOCKS, false)
		end
		if dummies.PENTASTAR ~= nil and dummies.PENTASTAR.RosterUnits ~= nil then
			UnitUtil.SetLockList("Pentastar", dummies.PENTASTAR.RosterUnits, false)
			UnitUtil.SetLockList("Pentastar", SEP_HOLDOUT_AVAILABLE_UNITS)
		end
		if dummies.ZSINJ_EMPIRE ~= nil and dummies.ZSINJ_EMPIRE.RosterUnits ~= nil then
			UnitUtil.SetLockList("Zsinj_Empire", dummies.ZSINJ_EMPIRE.RosterUnits, false)
			UnitUtil.SetLockList("Zsinj_Empire", ZANN_AVAILABLE_UNITS)
			UnitUtil.SetLockList("Zsinj_Empire", ZANN_EXTRA_LOCKS, false)
		end
		p_empire.Unlock_Tech(Find_Object_Type("Dummy_Research_TIE_Defender"))
		p_empire.Unlock_Tech(Find_Object_Type("Dummy_Research_Skipray_Blastboat"))
		p_empire.Unlock_Tech(Find_Object_Type("Option_Change_Loadout"))
		GlobalValue.Set("CUSTOM_LOADOUT","MIXED")
		crossplot:publish("WARLORD_CHOICE_OPTION","ZAARIN_EMPIRE")
		crossplot:publish("INITIALIZE_AI", "empty")
	else
		crossplot:update()
	end
end
