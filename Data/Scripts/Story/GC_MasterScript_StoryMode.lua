--*******************************************
--******  Thrawn's Revenge: Bacta War  ******
--*******************************************

require("PGStoryMode")
require("deepcore/crossplot/crossplot")
require("deepcore/std/class")
require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("SetFighterResearch")

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

			local list = {"Vorru_Team"}
			SpawnList(list,FindPlanet("THYFERRA"),p_empire,true,false)
		elseif p_zsinj.Is_Human() then
			Story_Event("ZE_STORY_START")
		end

		if p_empire.Is_Human() == false then
			local list = {"Krennel_Warlord","Phulik_Binder","Brothic_Team"}
			SpawnList(list,FindPlanet("CIUTRIC"),p_empire,true,false)
			list = {"Darron_Direption"}
			SpawnList(list,FindPlanet("LIINADE"),p_empire,true,false)
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

		p_empire.Lock_Tech(Find_Object_Type("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET"))
		Clear_Fighter_Hero("VESSERY_STRANGER_SQUADRON")
		Set_Fighter_Hero("ERISI_DLARIT_ELITE_SQUADRON", "ISARD_LUSANKYA")
		p_empire.Unlock_Tech(Find_Object_Type("ERISI_DLARIT_LOCATION_SET"))

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
