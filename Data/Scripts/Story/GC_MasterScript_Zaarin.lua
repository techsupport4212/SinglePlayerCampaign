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
	p_zsinj = Find_Player("Zsinj_Empire")
	crossplot:galactic()
	crossplot:publish("FACTION_DISPLAY_NAME_CHANGE", "WARLORDS", "Seperatist Holdouts", "CIS_ALLIES")
	crossplot:publish("FACTION_DISPLAY_NAME_CHANGE", "REBEL", "Rebel Alliance")
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
		crossplot:publish("INITIALIZE_AI", "empty")
	else
		crossplot:update()
	end
end
