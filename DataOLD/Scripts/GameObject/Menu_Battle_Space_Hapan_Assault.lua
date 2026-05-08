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

		eriadu_ship_1_marker = Find_Hint("MARKER_GENERIC_BLUE", "eriadu_ship_1")
		eriadu_ship_2_marker = Find_Hint("MARKER_GENERIC_BLUE", "eriadu_ship_2")
		eriadu_assertor_marker = Find_Hint("MARKER_GENERIC_BLUE", "eriadu_assertor")
		
		hapes_ship_1_marker = Find_Hint("MARKER_GENERIC_BLUE", "hapes_ship_1")
		hapes_ship_2_marker = Find_Hint("MARKER_GENERIC_BLUE", "hapes_ship_2")
		hapes_ship_3_marker = Find_Hint("MARKER_GENERIC_BLUE", "hapes_ship_3")
		hapes_ship_4_marker = Find_Hint("MARKER_GENERIC_BLUE", "hapes_ship_4")
		hapes_starbase_marker = Find_Hint("MARKER_GENERIC_BLUE", "hapes_starbase")

		Create_Thread("State_List_Battle")
		
		Create_Thread("Battle_Begins")
	end
end

function Battle_Cinematic_Camera()
    Start_Cinematic_Mode()
end

function State_List_Battle()
	eriadu_spawn_list_1 = 
	{
		"IMMOBILIZER_TWIN_WELL",
		"GLADIATOR_I",
		"IPV1",
		"IPV1",
		"ARQUITENS",
		"ARQUITENS",
	}
	
	eriadu_spawn_list_2 = 
	{
		"IMMOBILIZER_TWIN_WELL",
		"GLADIATOR_I",
		"IPV1",
		"IPV1",
		"IPV1",
		"ARQUITENS",
	}
	
	hapes_spawn_list_1 =
	{
		"BATTLE_DRAGON",
		"BATTLE_DRAGON",
		"MIST_CARRIER",
		"BETA_CRUISER",
		"NOVA_CRUISER",
		"TEREPHON_CRUISER",
		"BAIDAM_CORVETTE",
		"PULSAR_CRUISER",
	}
	
	hapes_spawn_list_2 =
	{
		"BATTLE_DRAGON",
		"BATTLE_DRAGON",
		"MIST_CARRIER",
		"BETA_CRUISER",
		"NOVA_CRUISER",
		"TEREPHON_CRUISER",
		"BAIDAM_CORVETTE",
		"BAIDAM_CORVETTE",
		"PULSAR_CRUISER",
	}
	
	hapes_spawn_list_3 =
	{
		"BATTLE_DRAGON",
		"BATTLE_DRAGON",
		"BATTLE_DRAGON",
		"BETA_CRUISER",
		"NOVA_CRUISER",
		"NOVA_CRUISER",
		"TEREPHON_CRUISER",
		"BAIDAM_CORVETTE",
		"BAIDAM_CORVETTE",
		"PULSAR_CRUISER",
	}
	
	hapes_spawn_list_4 =
	{
		"BATTLE_DRAGON",
		"BATTLE_DRAGON",
		"BATTLE_DRAGON",
		"BETA_CRUISER",
		"BETA_CRUISER",
		"NOVA_CRUISER",
		"NOVA_CRUISER",
		"BAIDAM_CORVETTE",
		"BAIDAM_CORVETTE",
		"PULSAR_CRUISER",
	}
end

function State_Spawn_Battle()
	--Eriadu fleet
	player_assertor = Spawn_Unit(Find_Object_Type("Skirmish_Assertor_Star_Dreadnought"), eriadu_assertor_marker, p_empire)
	player_assertor = Find_Nearest(eriadu_assertor_marker, p_empire, true)
	player_assertor.Teleport_And_Face(eriadu_assertor_marker)
	player_assertor.Cinematic_Hyperspace_In(0.1)
	player_assertor.Set_Importance(10)
	player_assertor.Set_Cannot_Be_Killed(true)
	
	Eriadu_Fleet_01 = SpawnList(eriadu_spawn_list_1, eriadu_ship_1_marker.Get_Position(), p_empire, true, true)
	Eriadu_Fleet_01 = Eriadu_Fleet_01[1]
	Eriadu_Fleet_01.Teleport_And_Face(eriadu_ship_1_marker)
	Eriadu_Fleet_01.Cinematic_Hyperspace_In(0.1)
	
	Eriadu_Fleet_02 = SpawnList(eriadu_spawn_list_2, eriadu_ship_2_marker.Get_Position(), p_empire, true, true)
	Eriadu_Fleet_02 = Eriadu_Fleet_02[1]
	Eriadu_Fleet_02.Teleport_And_Face(eriadu_ship_2_marker)
	Eriadu_Fleet_02.Cinematic_Hyperspace_In(0.1)	

	--Hapes fleet
	player_hapes_station = Spawn_Unit(Find_Object_Type("Hapan_Star_Base_4"), hapes_starbase_marker, p_new_republic)
	player_hapes_station = Find_Nearest(hapes_starbase_marker, p_new_republic, true)
	player_hapes_station.Teleport_And_Face(hapes_starbase_marker)
	player_hapes_station.Set_Importance(10)
	player_hapes_station.Set_Cannot_Be_Killed(true)
	
	Hapes_Fleet_01 = SpawnList(hapes_spawn_list_1, hapes_ship_1_marker.Get_Position(), p_new_republic, true, true)
	Hapes_Fleet_01 = Hapes_Fleet_01[1]
	Hapes_Fleet_01.Teleport_And_Face(hapes_ship_1_marker)
	Hapes_Fleet_01.Cinematic_Hyperspace_In(0.1)
	
	Hapes_Fleet_02 = SpawnList(hapes_spawn_list_2, hapes_ship_2_marker.Get_Position(), p_new_republic, true, true)
	Hapes_Fleet_02 = Hapes_Fleet_02[1]
	Hapes_Fleet_02.Teleport_And_Face(hapes_ship_2_marker)
	Hapes_Fleet_02.Cinematic_Hyperspace_In(0.1)
	
	Hapes_Fleet_03 = SpawnList(hapes_spawn_list_3, hapes_ship_3_marker.Get_Position(), p_new_republic, true, true)
	Hapes_Fleet_03 = Hapes_Fleet_03[1]
	Hapes_Fleet_03.Teleport_And_Face(hapes_ship_3_marker)
	Hapes_Fleet_03.Cinematic_Hyperspace_In(0.1)
	
	Hapes_Fleet_04 = SpawnList(hapes_spawn_list_4, hapes_ship_4_marker.Get_Position(), p_new_republic, true, true)
	Hapes_Fleet_04 = Hapes_Fleet_04[1]
	Hapes_Fleet_04.Teleport_And_Face(hapes_ship_4_marker)
	Hapes_Fleet_04.Cinematic_Hyperspace_In(0.1)
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
		
		local eriadu_attack_one_list = Find_All_Objects_Of_Type(p_empire, "SpaceHero | Corvette | Capital | Frigate | SuperCapital")
		for g,eriaduattack01 in pairs(eriadu_attack_one_list) do
			if TestValid(eriaduattack01) then
				if TestValid(player_hapes_station) then
					eriaduattack01.Attack_Move(player_hapes_station)
				end
			end
		end

		local hapes_attack_one_list = Find_All_Objects_Of_Type(p_new_republic, "SpaceHero | Corvette | Capital | Frigate | SuperCapital")
		for g,hapesattack01 in pairs(hapes_attack_one_list) do
			if TestValid(hapesattack01) then
				if TestValid(player_assertor) then
					hapesattack01.Attack_Move(player_assertor)
				end
			end
		end

		Sleep(120) -- Length of battle
	end
end