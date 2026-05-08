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

		empire_of_the_hand_ship_1_marker = Find_Hint("MARKER_GENERIC_YELLOW", "empire_of_the_hand_ship_1")
		empire_of_the_hand_ship_2_marker = Find_Hint("MARKER_GENERIC_YELLOW", "empire_of_the_hand_ship_2")
		empire_of_the_hand_ship_3_marker = Find_Hint("MARKER_GENERIC_YELLOW", "empire_of_the_hand_ship_3")
		empire_of_the_hand_visvia_1_marker = Find_Hint("MARKER_GENERIC_YELLOW", "empire_of_the_hand_visvia_1")
		empire_of_the_hand_visvia_2_marker = Find_Hint("MARKER_GENERIC_YELLOW", "empire_of_the_hand_visvia_2")
		empire_of_the_hand_visvia_3_marker = Find_Hint("MARKER_GENERIC_YELLOW", "empire_of_the_hand_visvia_3")
		
		pentastar_alignment_ship_1_marker = Find_Hint("MARKER_GENERIC_YELLOW", "pentastar_alignment_ship_1")
		pentastar_alignment_ship_2_marker = Find_Hint("MARKER_GENERIC_YELLOW", "pentastar_alignment_ship_2")
		pentastar_alignment_ship_3_marker = Find_Hint("MARKER_GENERIC_YELLOW", "pentastar_alignment_ship_3")

		Create_Thread("State_List_Battle")
		
		Create_Thread("Battle_Begins")
	end
end

function Battle_Cinematic_Camera()
    Start_Cinematic_Mode()
end

function State_List_Battle()
	empire_of_the_hand_spawn_list_1 = 
	{
		"INTEGO_DESTROYER",
		"ASCENDANCY_STAR_DESTROYER",
		"CHAF_DESTROYER",
		"CHAF_DESTROYER",
		"EFODIO_FLEET_TENDER",
		"FRUORO_PICKET_SHIP",
	}
	
	empire_of_the_hand_spawn_list_2 = 
	{
		"INTEGO_DESTROYER",
		"ASCENDANCY_STAR_DESTROYER",
		"ASCENDANCY_STAR_DESTROYER",
		"CHAF_DESTROYER",
		"CHAF_DESTROYER",
		"FRUORO_PICKET_SHIP",
	}
	
	empire_of_the_hand_spawn_list_3 = 
	{
		"INTEGO_DESTROYER",
		"ASCENDANCY_STAR_DESTROYER",
		"CHAF_DESTROYER",
		"CHAF_DESTROYER",
		"EFODIO_FLEET_TENDER",
		"FRUORO_PICKET_SHIP",
	}
	
	pentastar_alignment_spawn_list_1 = 
	{
		"SECUTOR_STAR_DESTROYER",
		"VENATOR_STAR_DESTROYER",
		"PROCURSATOR_STAR_DESTROYER",
		"BATTLE_HORN",
		"RAIDER_I_CORVETTE",
		"RAIDER_I_CORVETTE",
		"IMPERIAL_CARGO_SHIP",
	}
	
	pentastar_alignment_spawn_list_2 = 
	{
		"SECUTOR_STAR_DESTROYER",
		"VENATOR_STAR_DESTROYER",
		"PROCURSATOR_STAR_DESTROYER",
		"BATTLE_HORN",
		"RAIDER_I_CORVETTE",
		"RAIDER_I_CORVETTE",
		"IMPERIAL_CARGO_SHIP",
	}
	
	pentastar_alignment_spawn_list_3 = 
	{
		"SECUTOR_STAR_DESTROYER",
		"VENATOR_STAR_DESTROYER",
		"BATTLE_HORN",
		"RAIDER_I_CORVETTE",
		"RAIDER_I_CORVETTE",
		"IMPERIAL_CARGO_SHIP",
		"IMPERIAL_CARGO_SHIP",
	}
end

function State_Spawn_Battle()
	--Empire Of The Hand fleet
	player_empire_of_the_hand_visvia_1 = Spawn_Unit(Find_Object_Type("Secondary_Visvia"), empire_of_the_hand_visvia_1_marker, p_new_republic)
	player_empire_of_the_hand_visvia_1 = Find_Nearest(empire_of_the_hand_visvia_1_marker, p_new_republic, true)
	player_empire_of_the_hand_visvia_1.Teleport_And_Face(empire_of_the_hand_visvia_1_marker)
	player_empire_of_the_hand_visvia_1.Set_Importance(10)
	player_empire_of_the_hand_visvia_1.Set_Cannot_Be_Killed(true)

	player_empire_of_the_hand_visvia_2 = Spawn_Unit(Find_Object_Type("Secondary_Visvia"), empire_of_the_hand_visvia_2_marker, p_new_republic)
	player_empire_of_the_hand_visvia_2 = Find_Nearest(empire_of_the_hand_visvia_2_marker, p_new_republic, true)
	player_empire_of_the_hand_visvia_2.Teleport_And_Face(empire_of_the_hand_visvia_2_marker)
	player_empire_of_the_hand_visvia_2.Set_Importance(10)
	player_empire_of_the_hand_visvia_2.Set_Cannot_Be_Killed(true)
	
	player_empire_of_the_hand_visvia_3 = Spawn_Unit(Find_Object_Type("Secondary_Visvia"), empire_of_the_hand_visvia_3_marker, p_new_republic)
	player_empire_of_the_hand_visvia_3 = Find_Nearest(empire_of_the_hand_visvia_3_marker, p_new_republic, true)
	player_empire_of_the_hand_visvia_3.Teleport_And_Face(empire_of_the_hand_visvia_3_marker)
	player_empire_of_the_hand_visvia_3.Set_Importance(10)
	player_empire_of_the_hand_visvia_3.Set_Cannot_Be_Killed(true)
	
	Empire_Of_The_Hand_Fleet_01 = SpawnList(empire_of_the_hand_spawn_list_1, empire_of_the_hand_ship_1_marker.Get_Position(), p_new_republic, true, true)
	Empire_Of_The_Hand_Fleet_01 = Empire_Of_The_Hand_Fleet_01[1]
	Empire_Of_The_Hand_Fleet_01.Teleport_And_Face(empire_of_the_hand_ship_1_marker)
	Empire_Of_The_Hand_Fleet_01.Cinematic_Hyperspace_In(0.1)
	
	Empire_Of_The_Hand_Fleet_02 = SpawnList(empire_of_the_hand_spawn_list_2, empire_of_the_hand_ship_2_marker.Get_Position(), p_new_republic, true, true)
	Empire_Of_The_Hand_Fleet_02 = Empire_Of_The_Hand_Fleet_02[1]
	Empire_Of_The_Hand_Fleet_02.Teleport_And_Face(empire_of_the_hand_ship_2_marker)
	Empire_Of_The_Hand_Fleet_02.Cinematic_Hyperspace_In(0.1)
	
	Empire_Of_The_Hand_Fleet_03 = SpawnList(empire_of_the_hand_spawn_list_3, empire_of_the_hand_ship_3_marker.Get_Position(), p_new_republic, true, true)
	Empire_Of_The_Hand_Fleet_03 = Empire_Of_The_Hand_Fleet_03[1]
	Empire_Of_The_Hand_Fleet_03.Teleport_And_Face(empire_of_the_hand_ship_3_marker)
	Empire_Of_The_Hand_Fleet_03.Cinematic_Hyperspace_In(0.1)

	--Pentastar Alignment fleet
	Pentastar_Alignment_Fleet_01 = SpawnList(pentastar_alignment_spawn_list_1, pentastar_alignment_ship_1_marker.Get_Position(), p_empire, true, true)
	Pentastar_Alignment_Fleet_01 = Pentastar_Alignment_Fleet_01[1]
	Pentastar_Alignment_Fleet_01.Teleport_And_Face(pentastar_alignment_ship_1_marker)
	Pentastar_Alignment_Fleet_01.Cinematic_Hyperspace_In(0.1)
	
	Pentastar_Alignment_Fleet_02 = SpawnList(pentastar_alignment_spawn_list_2, pentastar_alignment_ship_2_marker.Get_Position(), p_empire, true, true)
	Pentastar_Alignment_Fleet_02 = Pentastar_Alignment_Fleet_02[1]
	Pentastar_Alignment_Fleet_02.Teleport_And_Face(pentastar_alignment_ship_2_marker)
	Pentastar_Alignment_Fleet_02.Cinematic_Hyperspace_In(0.1)
	
	Pentastar_Alignment_Fleet_03 = SpawnList(pentastar_alignment_spawn_list_3, pentastar_alignment_ship_3_marker.Get_Position(), p_empire, true, true)
	Pentastar_Alignment_Fleet_03 = Pentastar_Alignment_Fleet_03[1]
	Pentastar_Alignment_Fleet_03.Teleport_And_Face(pentastar_alignment_ship_3_marker)
	Pentastar_Alignment_Fleet_03.Cinematic_Hyperspace_In(0.1)
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

		local pa_attack_one_list = Find_All_Objects_Of_Type(p_empire, "SpaceHero | Corvette | Capital | Frigate | SuperCapital")
		for g,paattack01 in pairs(pa_attack_one_list) do
			if TestValid(paattack01) then
				if TestValid(player_empire_of_the_hand_visvia_2) then
					paattack01.Attack_Move(player_empire_of_the_hand_visvia_2)
				end
			end
		end
		Sleep(120) -- Length of battle
	end
end