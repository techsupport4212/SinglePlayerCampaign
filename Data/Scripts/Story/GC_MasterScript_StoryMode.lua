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

EMPIRE_PLAYER_AVAILABLE_UNITS = {
	"Imperial_Army_Trooper_Company",
	"Imperial_Stormtrooper_Company",
	"Imperial_AT_PT_Company",
	"AT_ST_Company",
	"Chariot_LAV_Company",
	"Imperial_TX130S_Company",
	"Imperial_AT_AT_Walker_Company",
	"Raider_I_Corvette",
	"IPV1",
	"Lancer_Frigate",
	"Patrol_Nebulon_B",
	"Strike_Cruiser",
	"Victory_I_Star_Destroyer",
	"Imperial_I_Star_Destroyer",
}
IMPERIAL_PROTEUS_PLAYER_AVAILABLE_UNITS = {
	"Imperial_Army_Trooper_Company",
	"Imperial_Stormtrooper_Company",
	"Imperial_AT_PT_Company",
	"Imperial_Army_74Z_Bike_Company",
	"Imperial_TX130S_Company",
	"S_1_Firehawke_Company",
	"Imperial_A5_Juggernaut_Company",
	"Customs_Corvette",
	"Charger_C70",
	"Carrack_Cruiser",
	"Marauder_Cruiser",
	"Procursator_Star_Destroyer",
	"Venator_Star_Destroyer",
	"Imperial_I_Star_Destroyer_Patrol",
}
EMPIRE_EXTRA_LOCKS = {
	"TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET",
	"RANDOM_BOUNTY_HUNTER",
}

function State_Delayed_Lock()
	local dummies = Get_FTGU_Dummies()

	if dummies.EMPIRE ~= nil and dummies.EMPIRE.RosterUnits ~= nil then
		UnitUtil.SetLockList("Empire", dummies.EMPIRE.RosterUnits, false)
		UnitUtil.SetLockList("Empire", EMPIRE_PLAYER_AVAILABLE_UNITS)
		UnitUtil.SetLockList("Empire", EMPIRE_EXTRA_LOCKS, false)
	end

	if dummies.IMPERIAL_PROTEUS ~= nil and dummies.IMPERIAL_PROTEUS.RosterUnits ~= nil then
		UnitUtil.SetLockList("Imperial_Proteus", dummies.IMPERIAL_PROTEUS.RosterUnits, false)
		UnitUtil.SetLockList("Imperial_Proteus", IMPERIAL_PROTEUS_PLAYER_AVAILABLE_UNITS)
	end

	p_empire.Unlock_Tech(Find_Object_Type("Dummy_Research_TIE_Defender"))
	p_empire.Unlock_Tech(Find_Object_Type("Dummy_Research_Skipray_Blastboat"))
end

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	StoryModeEvents = {
		Trigger_Determine_Faction = State_Determine_Faction,
		Trigger_Delayed_Initialize = State_Delayed_Initialize,
		Trigger_Yonka_Defection_Prompt = State_Yonka_Defection_Prompt,
		Trigger_Yonka_Dies = State_Yonka_Dies,
		Trigger_Yonka_Bribe = State_Yonka_Bribe,
	}

	p_newrep = Find_Player("Rebel")
	p_empire = Find_Player("Empire")
	p_zsinj = Find_Player("Zsinj_Empire")

	crossplot:galactic()
end

function State_Determine_Faction(message)
	if message == OnEnter then
		if p_newrep.Is_Human() then
			Story_Event("NR_STORY_START")
		elseif p_empire.Is_Human() then
			Story_Event("GE_STORY_START")
		elseif p_zsinj.Is_Human() then
			Story_Event("ZE_STORY_START")
		end
	else
		crossplot:update()
	end
end

function State_Delayed_Initialize(message)
	if message == OnEnter then
		crossplot:publish("COMMAND_STAFF_INITIALIZE", {
			["SUPCOM"] = {
				["LOCKIN"] = {"Ackbar"},
			}
		})

		crossplot:publish("NR_FILTER_REMOVE", {"Salm_Location_Set"}, 2)
		Set_Fighter_Hero("SALM_Y_WING_SQUADRON", "ACKBAR_HOME_ONE")

		Clear_Fighter_Hero("VESSERY_STRANGER_SQUADRON")
		State_Delayed_Lock()
		-- crossplot:publish("WARLORD_CHOICE_OPTION","ZAARIN_EMPIRE")
		crossplot:publish("INITIALIZE_AI", "empty")
	else
		crossplot:update()
	end
end

function State_Yonka_Defection_Prompt(message)
	if message == OnEnter then
		local obj_yonka = Find_First_Object("YONKA_AVARICE")
		if TestValid(obj_yonka) ~= true then
			return
		end

		if p_newrep.Is_Human() == false then
			Set_Next_State("State_Yonka_Bribe")
			return
		end

		StoryUtil.Multimedia("TEXT_CONQUEST_BACTAWAR_YONKA_INTRO_NR", 10, nil, "Wedge_Loop", 0)
		UnitUtil.SetLockList("REBEL", {"DUMMY_YONKA_BRIBE"}, true)
	else
		crossplot:update()
	end
end

function State_Yonka_Dies(message)
	if message == OnEnter then
		UnitUtil.SetLockList("REBEL", {"DUMMY_YONKA_BRIBE"}, false)
	else
		crossplot:update()
	end
end

function State_Yonka_Bribe(message)
	if message == OnEnter then
		local obj_yonka = Find_First_Object("YONKA_AVARICE")
		if TestValid(obj_yonka) ~= true then
			return
		end

		UnitUtil.SetLockList("REBEL", {"DUMMY_YONKA_BRIBE"}, false)
		local obj_bribe = Find_First_Object("DUMMY_YONKA_BRIBE")
		if TestValid(obj_bribe) then
			obj_bribe.Despawn()
		end
		obj_yonka.Despawn()

		if p_newrep.Is_Human() then
			StoryUtil.Multimedia("TEXT_CONQUEST_BACTAWAR_YONKA_DEFECTS_NR", 10, nil, "Wedge_Loop", 0)
		elseif p_empire.Is_Human() then
			StoryUtil.Multimedia("TEXT_CONQUEST_BACTAWAR_YONKA_DEFECTS_GE", 10, nil, "Isard_Loop", 0)
		end
		StoryUtil.SpawnAtSafePlanet("RYLOTH", p_newrep, StoryUtil.GetSafePlanetTable(), {"YONKA_FREEDOM"}, true, false)
	else
		crossplot:update()
	end
end
