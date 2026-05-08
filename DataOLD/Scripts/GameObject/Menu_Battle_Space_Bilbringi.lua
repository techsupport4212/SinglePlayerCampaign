--***************************************************--
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

		new_republic_ship_1_marker = Find_Hint("MARKER_GENERIC_RED", "new_republic_ship_1")
		new_republic_ship_2_marker = Find_Hint("MARKER_GENERIC_RED", "new_republic_ship_2")
		new_republic_ship_3_marker = Find_Hint("MARKER_GENERIC_RED", "new_republic_ship_3")
		new_republic_homeone_marker = Find_Hint("MARKER_GENERIC_RED", "new_republic_homeone")
		new_republic_isdii_marker = Find_Hint("MARKER_GENERIC_RED", "new_republic_isdii")
		
		empire_ship_1_marker = Find_Hint("MARKER_GENERIC_RED", "empire_ship_1")
		empire_ship_2_marker = Find_Hint("MARKER_GENERIC_RED", "empire_ship_2")
		empire_ship_3_marker = Find_Hint("MARKER_GENERIC_RED", "empire_ship_3")
		empire_golan2_1_marker = Find_Hint("MARKER_GENERIC_RED", "empire_golan2_1")
		empire_golan2_2_marker = Find_Hint("MARKER_GENERIC_RED", "empire_golan2_2")
		empire_greywolf_marker = Find_Hint("MARKER_GENERIC_RED", "empire_greywolf")

		Create_Thread("State_List_Battle")
		
		Create_Thread("Battle_Begins")
	end
end

function Battle_Cinematic_Camera()
    Start_Cinematic_Mode()
end

function State_List_Battle()
	new_republic_spawn_list_1 = 
	{
		"MC80_LIBERTY",
		"MC80_LIBERTY",
		"MC80_LIBERTY",
		"NEBULON_B_FRIGATE",
		"NEBULON_B_FRIGATE",
		"NEBULON_B_FRIGATE",
		"CR90",
		"CR90",
		"CR90",
		"QUASAR",
		"QUASAR",
		"MC30C",
		"MC30C",
		"ALLIANCE_ASSAULT_FRIGATE",		
	}
	
	new_republic_spawn_list_2 = 
	{
		"MC80_LIBERTY",
		"MC80_LIBERTY",
		"MC80_LIBERTY",
		"NEBULON_B_FRIGATE",
		"NEBULON_B_FRIGATE",
		"NEBULON_B_FRIGATE",
		"NEBULON_B_FRIGATE",
		"CR90",
		"CR90",
		"CR90",
		"QUASAR",
		"QUASAR",
		"MC30C",
		"MC30C",
	}
	
	new_republic_spawn_list_3 = 
	{
		"MC80_LIBERTY",
		"MC80_LIBERTY",
		"NEBULON_B_FRIGATE",
		"NEBULON_B_FRIGATE",
		"NEBULON_B_FRIGATE",
		"NEBULON_B_FRIGATE",
		"CR90",
		"CR90",
		"CR90",
		"QUASAR",
		"QUASAR",
		"MC30C",
		"ALLIANCE_ASSAULT_FRIGATE",
	}
	
	empire_spawn_list_1 =
	{
		"IMPERIAL_I_STAR_DESTROYER",
		"IMPERIAL_I_STAR_DESTROYER",
		"IMMOBILIZER_418",
		"IMMOBILIZER_418",
		"IMMOBILIZER_418",
		"CARRACK_CRUISER",
		"KATANA_DHC",
		"KATANA_DHC",
		"STRIKE_CRUISER",
		"STRIKE_CRUISER",
	}
	
	empire_spawn_list_2 =
	{
		"IMPERIAL_I_STAR_DESTROYER",
		"IMPERIAL_I_STAR_DESTROYER",
		"IMMOBILIZER_418",
		"IMMOBILIZER_418",
		"IMMOBILIZER_418",
		"CARRACK_CRUISER",
		"CARRACK_CRUISER",
		"KATANA_DHC",
		"KATANA_DHC",
		"STRIKE_CRUISER",
		"STRIKE_CRUISER",
		"STRIKE_CRUISER",
	}
	
	empire_spawn_list_3 =
	{
		"IMPERIAL_I_STAR_DESTROYER",
		"IMPERIAL_I_STAR_DESTROYER",
		"IMPERIAL_I_STAR_DESTROYER",
		"IMMOBILIZER_418",
		"IMMOBILIZER_418",
		"CARRACK_CRUISER",
		"CARRACK_CRUISER",
		"KATANA_DHC",
		"KATANA_DHC",
		"STRIKE_CRUISER",
		"STRIKE_CRUISER",
	}
end

function State_Spawn_Battle()
	--New Republic fleet
	player_homeone = Spawn_Unit(Find_Object_Type("Home_One_Type"), new_republic_homeone_marker, p_new_republic)
	player_homeone = Find_Nearest(new_republic_homeone_marker, p_new_republic, true)
	player_homeone.Teleport_And_Face(new_republic_homeone_marker)
	player_homeone.Cinematic_Hyperspace_In(0.1)
	player_homeone.Set_Importance(10)
	player_homeone.Set_Cannot_Be_Killed(true)
	
	player_isdii = Spawn_Unit(Find_Object_Type("Imperial_II_Star_Destroyer"), new_republic_isdii_marker, p_new_republic)
	player_isdii = Find_Nearest(new_republic_isdii_marker, p_new_republic, true)
	player_isdii.Teleport_And_Face(new_republic_isdii_marker)
	player_isdii.Cinematic_Hyperspace_In(0.1)
	
	New_Republic_Fleet_01 = SpawnList(new_republic_spawn_list_1, new_republic_ship_1_marker.Get_Position(), p_new_republic, true, true)
	New_Republic_Fleet_01 = New_Republic_Fleet_01[1]
	New_Republic_Fleet_01.Teleport_And_Face(new_republic_ship_1_marker)
	New_Republic_Fleet_01.Cinematic_Hyperspace_In(0.1)
	
	New_Republic_Fleet_02 = SpawnList(new_republic_spawn_list_2, new_republic_ship_2_marker.Get_Position(), p_new_republic, true, true)
	New_Republic_Fleet_02 = New_Republic_Fleet_02[1]
	New_Republic_Fleet_02.Teleport_And_Face(new_republic_ship_2_marker)
	New_Republic_Fleet_02.Cinematic_Hyperspace_In(0.1)
	
	New_Republic_Fleet_03 = SpawnList(new_republic_spawn_list_3, new_republic_ship_3_marker.Get_Position(), p_new_republic, true, true)
	New_Republic_Fleet_03 = New_Republic_Fleet_03[1]
	New_Republic_Fleet_03.Teleport_And_Face(new_republic_ship_3_marker)
	New_Republic_Fleet_03.Cinematic_Hyperspace_In(0.1)

	--Empire fleet
	player_golan2_1 = Spawn_Unit(Find_Object_Type("Empire_Star_Base_3"), empire_golan2_1_marker, p_empire)
	player_golan2_1 = Find_Nearest(empire_golan2_1_marker, p_empire, true)
	player_golan2_1.Teleport_And_Face(empire_golan2_1_marker)
	
	player_golan2_2 = Spawn_Unit(Find_Object_Type("Empire_Star_Base_3"), empire_golan2_2_marker, p_empire)
	player_golan2_2 = Find_Nearest(empire_golan2_2_marker, p_empire, true)
	player_golan2_2.Teleport_And_Face(empire_golan2_2_marker)
	
	player_greywolf = Spawn_Unit(Find_Object_Type("Thrawn_Grey_Wolf"), empire_greywolf_marker, p_empire)
	player_greywolf = Find_Nearest(empire_greywolf_marker, p_empire, true)
	player_greywolf.Teleport_And_Face(empire_greywolf_marker)
	--player_greywolf.Cinematic_Hyperspace_In(0.1)
	player_greywolf.Set_Importance(10)
	player_greywolf.Set_Cannot_Be_Killed(true)
	
	Empire_Fleet_01 = SpawnList(empire_spawn_list_1, empire_ship_1_marker.Get_Position(), p_empire, true, true)
	Empire_Fleet_01 = Empire_Fleet_01[1]
	Empire_Fleet_01.Teleport_And_Face(empire_ship_1_marker)
	Empire_Fleet_01.Cinematic_Hyperspace_In(0.1)
	
	Empire_Fleet_02 = SpawnList(empire_spawn_list_2, empire_ship_2_marker.Get_Position(), p_empire, true, true)
	Empire_Fleet_02 = Empire_Fleet_02[1]
	Empire_Fleet_02.Teleport_And_Face(empire_ship_2_marker)
	Empire_Fleet_02.Cinematic_Hyperspace_In(0.1)
	
	Empire_Fleet_03 = SpawnList(empire_spawn_list_3, empire_ship_3_marker.Get_Position(), p_empire, true, true)
	Empire_Fleet_03 = Empire_Fleet_03[1]
	Empire_Fleet_03.Teleport_And_Face(empire_ship_3_marker)
	Empire_Fleet_03.Cinematic_Hyperspace_In(0.1)
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

		local new_republic_attack_one_list = Find_All_Objects_Of_Type(p_new_republic, "SpaceHero | Corvette | Capital | Frigate | SuperCapital")
		for g,newrepattack01 in pairs(new_republic_attack_one_list) do
			if TestValid(newrepattack01) then
				if TestValid(player_greywolf) then
					newrepattack01.Attack_Move(player_greywolf)
				end
			end
		end

		local empire_attack_one_list = Find_All_Objects_Of_Type(p_empire, "SpaceHero | Corvette | Capital | Frigate | SuperCapital")
		for g,empireattack01 in pairs(empire_attack_one_list) do
			if TestValid(empireattack01) then
				if TestValid(player_homeone) then
					empireattack01.Attack_Move(player_homeone)
				end
			end
		end

		Sleep(120) -- Length of battle
	end
end