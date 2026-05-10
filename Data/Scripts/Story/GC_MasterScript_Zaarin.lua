--*****************************************************
--******  Thrawn's Revenge: Zaarin Insurrection  ******
--*****************************************************

require("PGStoryMode")
require("deepcore/crossplot/crossplot")
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
	crossplot:galactic()
	crossplot:publish("FACTION_DISPLAY_NAME_CHANGE", "WARLORDS", "Seperatist Holdouts", "CIS_ALLIES")
	crossplot:publish("FACTION_DISPLAY_NAME_CHANGE", "REBEL", "Rebel Alliance")
end

function State_Determine_Faction(message)
	if message == OnEnter then
		if p_empire.Is_Human() then
			Story_Event("GE_STORY_START")
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
			"AT_ST_Company",
			"Chariot_LAV_Company",
			"Imperial_TX130S_Company",
			"IPV1",
			"Lancer_Frigate",
			"Strike_Cruiser",
			"Victory_I_Star_Destroyer",
			"Imperial_I_Star_Destroyer",
			"RTT_Company",
			"AT_DP_Company",
			"Imperial_TX130T_Company",
			"Imperial_APC_Company",
			"Deathhawk_Company",
			"Repulsor_Tank_Mark_II_Company",
			"Imperial_Modified_LAAT_Company",
			"MAAT_Company",
			"Lancet_Air_Artillery_Company",
			"Imperial_AT_TE_Walker_Company",
			"Imperial_A6_Juggernaut_Company",
			"Gozanti_Cruiser_Group",
			"Raider_I_Corvette",
			"Raider_II_Corvette",
			"Vigil",
			"Surveyor_Frigate",
			"Arquitens",
			"Active_Frigate",
			"Victory_I_Frigate",
			"Victory_II_Frigate",
			"Imperial_I_Frigate",
			"Imperial_II_Frigate",
			"Immobilizer_418",
		}
		local EMPIRE_EXTRA_LOCKS = {
			"TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET",
			"RANDOM_BOUNTY_HUNTER",
		}
		if dummies.EMPIRE ~= nil and dummies.EMPIRE.RosterUnits ~= nil then
			UnitUtil.SetLockList("Empire", dummies.EMPIRE.RosterUnits, false)
			UnitUtil.SetLockList("Empire", EMPIRE_PLAYER_AVAILABLE_UNITS)
			UnitUtil.SetLockList("Empire", EMPIRE_EXTRA_LOCKS, false)
		end
		p_empire.Unlock_Tech(Find_Object_Type("Option_Change_Loadout"))
		GlobalValue.Set("CUSTOM_LOADOUT","MIXED")
		crossplot:publish("INITIALIZE_AI", "empty")
	else
		crossplot:update()
	end
end
