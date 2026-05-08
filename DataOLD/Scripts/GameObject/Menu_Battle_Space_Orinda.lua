--*********** Main Menu Space Script ****************--
--***************************************************--

require("PGStateMachine")
require("PGStoryMode")
require("PGSpawnUnits")
require("PGMoveUnits")

function Definitions()

	DebugMessage("%s -- In Definitions", tostring(Script))

	Define_State("State_Init", State_Init)

	battle_active = false
	
	cinematic_cam_active = false

	-- Players
	p_new_republic = Find_Player("Rebel")
	p_empire = Find_Player("Empire")

end

function State_Init(message)
	if message == OnEnter then

		if Get_Game_Mode() ~= "Space" then
			return
		end

		new_republic_ship_1_marker = Find_Hint("MARKER_GENERIC_GREEN", "new_republic_ship_1")
		new_republic_lusankya_marker = Find_Hint("MARKER_GENERIC_GREEN", "new_republic_lusankya")
		new_republic_endurance_marker = Find_Hint("MARKER_GENERIC_GREEN", "new_republic_endurance")
		
		empire_ship_1_marker = Find_Hint("MARKER_GENERIC_GREEN", "empire_ship_1")
		empire_reaper_marker = Find_Hint("MARKER_GENERIC_GREEN", "empire_reaper")


		Create_Thread("State_List_Battle")
		
		Create_Thread("Battle_Begins")
	end
end

function Battle_Cinematic_Camera()
    Start_Cinematic_Mode()
end

function State_List_Battle()
	new_republic_spawn_list = 
	{
		"MC80B",
		"ALLIANCE_ASSAULT_FRIGATE",
	}
	
	empire_spawn_list = 
	{
		"IMPERIAL_II_STAR_DESTROYER",
		"IMPERIAL_II_STAR_DESTROYER",
		"IMPERIAL_II_STAR_DESTROYER",
	}
end

function State_Spawn_Battle()
	--New Republic fleet
	player_lusankya = Spawn_Unit(Find_Object_Type("Skirmish_Wedge_Lusankya"), new_republic_lusankya_marker, p_new_republic)
	player_lusankya = Find_Nearest(new_republic_lusankya_marker, p_new_republic, true)
	player_lusankya.Teleport_And_Face(new_republic_lusankya_marker)
	player_lusankya.Cinematic_Hyperspace_In(0.1)
	player_lusankya.Set_Importance(10)
	player_lusankya.Set_Cannot_Be_Killed(true)
	
	player_endurance = Spawn_Unit(Find_Object_Type("Endurance_Fleet_Carrier"), new_republic_endurance_marker, p_new_republic)
	player_endurance = Find_Nearest(new_republic_endurance_marker, p_new_republic, true)
	player_endurance.Teleport_And_Face(new_republic_endurance_marker)
	player_endurance.Cinematic_Hyperspace_In(100)
	
	New_Republic_Fleet = SpawnList(new_republic_spawn_list, new_republic_ship_1_marker.Get_Position(), p_new_republic, true, true)
	New_Republic_Fleet = New_Republic_Fleet[1]
	New_Republic_Fleet.Teleport_And_Face(new_republic_ship_1_marker)
	New_Republic_Fleet.Cinematic_Hyperspace_In(50)

	--Empire fleet
	player_reaper = Spawn_Unit(Find_Object_Type("Skirmish_Pellaeon_Reaper"), empire_reaper_marker, p_empire)
	player_reaper = Find_Nearest(empire_reaper_marker, p_empire, true)
	player_reaper.Teleport_And_Face(empire_reaper_marker)
	player_reaper.Cinematic_Hyperspace_In(0.1)
	player_reaper.Set_Importance(10)
	player_reaper.Set_Cannot_Be_Killed(true)
	
	Empire_Fleet = SpawnList(empire_spawn_list, empire_ship_1_marker.Get_Position(), p_empire, true, true)
	Empire_Fleet = Empire_Fleet[1]
	Empire_Fleet.Teleport_And_Face(empire_ship_1_marker)
	Empire_Fleet.Cinematic_Hyperspace_In(50)
end

function Battle_Begins()
	if not battle_active then
        battle_active = true
        Fade_On()


		Create_Thread("State_Spawn_Battle")

		if not cinematic_cam_active then
            Create_Thread("Battle_Cinematic_Camera")
            cinematic_cam_active = true
        end
		
		Fade_Screen_In(10)

        Sleep(5)

		local new_republic_attack_two_list = Find_All_Objects_Of_Type(p_new_republic, "SpaceHero | Corvette | Capital | Frigate | SuperCapital")
		for g,newrepattack02 in pairs(new_republic_attack_two_list) do
			if TestValid(newrepattack02) then
				if TestValid(player_reaper) then
					newrepattack02.Attack_Move(player_reaper)
				end
			end
		end

		local empire_attack_two_list = Find_All_Objects_Of_Type(p_empire, "SpaceHero | Corvette | Capital | Frigate | SuperCapital")
		for g,empireattack02 in pairs(empire_attack_two_list) do
			if TestValid(empireattack02) then
				if TestValid(player_lusankya) then
					empireattack02.Attack_Move(player_lusankya)
				end
			end
		end

		Sleep(120) -- Length of battle
	end
end