--******************************************************************************
--     _______ __
--    |_     _|  |--.----.---.-.--.--.--.-----.-----.
--      |   | |     |   _|  _  |  |  |  |     |__ --|
--      |___| |__|__|__| |___._|________|__|__|_____|
--     ______
--    |   __ \.-----.--.--.-----.-----.-----.-----.
--    |      <|  -__|  |  |  -__|     |  _  |  -__|
--    |___|__||_____|\___/|_____|__|__|___  |_____|
--                                    |_____|
--*   @Author:              [TR]Pox
--*   @Date:                2018-03-20T01:27:01+01:00
--*   @Project:             Imperial Civil War
--*   @Filename:            Academy_Spawner.lua
--*   @Last modified by:    [TR]Pox
--*   @Last modified time:  2018-03-26T09:58:14+02:00
--*   @License:             This source code may only be used with explicit permission from the developers
--*   @Copyright:           © TR: Imperial Civil War Development Team
--******************************************************************************

require("MinorHeroSpawner")

function Definitions()
    DebugMessage("%s -- In Definitions", tostring(Script))

    Define_State("State_Init", State_Init);
end


function State_Init(message)
	if message == OnEnter then
		
		local faction = Object.Get_Owner()
		local faction_name = faction.Get_Faction_Name()

		local commander_data = {
			["REBEL"] = {
				space = {
					IV = {"Commander_IV_Home_One_Type", {"Commander_IV_MC90", "MC90"}, {"Commander_IV_Bulwark_III", "Bulwark_III"}, {"Commander_IV_Nebula_Star_Destroyer", "Nebula_Star_Destroyer"}, {"Commander_IV_Republic_Star_Destroyer", "Republic_Star_Destroyer"}, {"Commander_IV_Mothma_Star_Destroyer", "Mothma_Star_Destroyer"}},
					III = {"Commander_III_Dauntless", "Commander_III_MC80_Liberty", "Commander_III_MC80B", {"Commander_III_Bothan_Assault_Cruiser", "Bothan_Assault_Cruiser"}},
					II = {"Commander_II_Alliance_Assault_Frigate_II", "Commander_II_Liberator_Cruiser", {"Commander_II_Majestic", "Majestic"}},
					I = {"Commander_I_Marauder_Missile_Cruiser", "Commander_I_MC30a", "Commander_I_MC40a", "Commander_I_NR_DHC"},
				},
				land = {
					IV = {"Commander_IV_Freerunner_Command_Company", "Commander_IV_Heavy_Tracker_Company", "Commander_IV_T3B_Tank_Company", "Commander_IV_MAS_2xB_Company"},
					III = {"Commander_III_SRV1_Company", "Commander_III_Gian_Rebel", {"Commander_III_AAC_3_Company", "AAC_3"}},
					II = {"Commander_I_New_Republic_Marine_Company", "Commander_II_New_Republic_Infiltrator_Company", "Commander_II_AAC_2_Company", "Commander_II_AA5_Truck_Company"},
					I = {"Commander_I_NR_Army_Company", "Commander_I_NR_Defense_Trooper_Company", "Commander_I_New_Republic_Fleet_Trooper_Company"},
				}
			},
			["ERIADU_AUTHORITY"] = {
				space = {
					IV = {{"Commander_IV_Tagge_Battlecruiser", "Tagge_Battlecruiser"}, "Commander_IV_Imperial_II_Star_Destroyer", "Commander_IV_Allegiance_Battlecruiser", "Commander_IV_Imperial_I_Star_Destroyer_Patrol"},
					III = {"Commander_III_Victory_I_Star_Destroyer", {"Commander_III_Crimson_Victory_II_Star_Destroyer", "Crimson_Victory_II_Star_Destroyer"}, "Commander_III_Procursator_Star_Destroyer"},
					II = {"Commander_II_Gladiator_I", "Commander_II_Imperial_I_Frigate", {"Commander_II_MTC_Sensor", "MTC_Sensor"}},
					I = {"Commander_I_Arquitens", "Commander_I_Eidolon", "Commander_I_Imperial_DHC", {"Commander_I_Imperial_Escort_Carrier", "Imperial_Escort_Carrier"}},
				},
				land = {
					IV = {"Commander_IV_1H_Tank_Company", "Commander_IV_Tracked_Mobile_Base_Company", "Commander_IV_AT_AT_Walker_Company", {"Commander_IV_XR85_Company", "XR85_Company"}},
					III = {"Commander_III_1L_Tank_Company", "Commander_III_PX7_Company", "Commander_III_1M_Tank"},
					II = {"Commander_II_ISB_Infiltrator_Company", "Commander_II_Imperial_Galactic_Marine_Company", {"Commander_II_Dark_Stormtrooper_Company", "Dark_Stormtrooper_Company"}},
					I = {"Commander_I_Army_Special_Missions_Company", "Commander_I_Imperial_Army_Trooper_Company", {"Commander_I_Imperial_Stormtrooper_Company", "Imperial_Stormtrooper_Company"}},
				}
			},
			["GREATER_MALDROOD"] = {
				space = {
					IV = {{"Commander_IV_Tagge_Battlecruiser", "Tagge_Battlecruiser"}, "Commander_IV_Imperial_I_Star_Destroyer", "Commander_IV_Tector_Star_Destroyer"},
					III = {"Commander_III_Victory_I_Star_Destroyer", "Commander_III_Crimson_Victory_II_Star_Destroyer", "Commander_III_Interdictor_Star_Destroyer"},
					II = {"Commander_II_Vindicator_Cruiser", "Commander_II_Acclamator_II", "Commander_II_Broadside_Cruiser", "Commander_II_Imperial_II_Frigate", {"Commander_II_MTC_Sensor", "MTC_Sensor"}},
					I = {"Commander_I_Carrack_Cruiser", "Commander_I_Strike_Cruiser", "Commander_I_Pursuit_Light_Cruiser", "Commander_I_Vigil", {"Commander_I_Imperial_Escort_Carrier", "Imperial_Escort_Carrier"}},
				},
				land = {
					IV = {"Commander_IV_Swift_Assault_5_Company", "Commander_IV_A5_Juggernaut_Company", {"Commander_IV_XR85_Company", "XR85_Company"}},
					III = {"Commander_III_Infantry_Support_Platform_Company", "Commander_III_Reconnaissance_Troop_Transporter_Company", "Commander_III_2M_Repulsor_Tank_Company"},
					II = {"Commander_II_Imperial_Fleet_Commando_Company", "Commander_II_ISB_Infiltrator_Company", "Commander_II_AT_RT_Walker_Company", {"Commander_II_Dark_Stormtrooper_Company", "Dark_Stormtrooper_Company"}},
					I = {"Commander_I_Imperial_Army_Trooper_Company", "Commander_I_Navy_Commando_Company", {"Commander_I_Imperial_Stormtrooper_Company", "Imperial_Stormtrooper_Company"}},
				}
			},
			["PENTASTAR"] = {
				space = {
					IV = {{"Commander_IV_Tagge_Battlecruiser", "Tagge_Battlecruiser"}, "Commander_IV_Imperial_I_Star_Destroyer", "Commander_IV_Tector_Star_Destroyer", "Commander_IV_Secutor_Star_Destroyer"},
					III = {"Commander_III_Venator_Star_Destroyer", {"Commander_III_Crimson_Victory_II_Star_Destroyer", "Crimson_Victory_II_Star_Destroyer"}, "Commander_III_Procursator_Star_Destroyer"},
					II = {"Commander_II_Enforcer_Picket_Cruiser", "Commander_II_Acclamator_I_Assault", {"Commander_II_MTC_Sensor", "MTC_Sensor"}},
					I = {"Commander_I_Ton_Falk_Escort_Carrier", "Commander_I_Victory_II_Frigate", "Commander_I_Battle_Horn", {"Commander_I_Imperial_Escort_Carrier", "Imperial_Escort_Carrier"}},
				},
				land = {
					IV = {"Commander_IV_B5_Juggernaut_Company", "Commander_IV_C10_Siege_Tower_Company", {"Commander_IV_XR85_Company", "XR85_Company"}},
					III = {"Commander_III_TIE_Mauler_Company", "Commander_III_AT_DP_Walker_Company", "Commander_III_TIE_Crawler_Command_Company"},
					II = {"Commander_II_Guardian_Protector_Company", "Commander_II_IntSec_Operator_Company", "Commander_II_Imperial_Army_Commando_Company", {"Commander_II_Dark_Stormtrooper_Company", "Dark_Stormtrooper_Company"}},
					I = {"Commander_I_Enforcer_Trooper_Company", "Commander_I_Pentastar_Army_Guard_Company", {"Commander_I_Imperial_Stormtrooper_Company", "Imperial_Stormtrooper_Company"}},
				}
			},
			["ZSINJ_EMPIRE"] = {
				space = {
					IV = {{"Commander_IV_Tagge_Battlecruiser", "Tagge_Battlecruiser"}, "Commander_IV_Imperial_II_Star_Destroyer", {"Commander_IV_Aggressor_Star_Destroyer", "Aggressor_Star_Destroyer"}},
					III = {{"Commander_III_Crimson_Victory_II_Star_Destroyer", "Crimson_Victory_II_Star_Destroyer"}, "Commander_III_Procursator_Star_Destroyer",  "Commander_III_Space_ARC_Cruiser", "Commander_III_Victory_II_Star_Destroyer"},
					II = {"Commander_II_Dragon_Heavy_Cruiser", "Commander_II_Vengeance_Frigate", {"Commander_II_MTC_Sensor", "MTC_Sensor"}},
					I = {"Commander_I_Surveyor_Frigate", "Commander_I_Super_Transport_XI", "Commander_I_Neutron_Star", {"Commander_I_Imperial_Nebulon_B", "Imperial_Nebulon_B"}, {"Commander_I_Imperial_Corona", "Corona"}, {"Commander_I_Imperial_Escort_Carrier", "Imperial_Escort_Carrier"}},
				},
				land = {
					IV = {"Commander_IV_Tracked_Shield_Disabler_Company", "Commander_IV_A9_Floating_Fortress_Company", {"Commander_IV_XR85_Company", "XR85_Company"}},
					III = {"Commander_III_ULAV_Company", "Commander_III_Chariot_LAV_Company", "Commander_III_Imperial_APC_Company"},
					II = {"Commander_II_Raptor_Commando_Company", "Commander_II_Shadow_EVO_Trooper_Company", "Commander_II_PX10_Company", {"Commander_II_Dark_Stormtrooper_Company", "Dark_Stormtrooper_Company"}},
					I = {{"Commander_I_Raptor_Trooper_Company", "Commander_I_EVO_Trooper_Company", "Commander_I_Imperial_Stormtrooper_Company", "Imperial_Stormtrooper_Company"}},
				}
			},
			["CORPORATE_SECTOR"] = {
				space = {
					IV = {"Commander_IV_Invincible_Cruiser", "Commander_IV_Bulwark_III", "Commander_IV_Imperial_I_Star_Destroyer_Patrol", "Commander_IV_Lucrehulk_CSA"},
					III = {"Commander_III_Bulwark_I", "Commander_III_Dauntless", "Commander_III_Venator_Star_Destroyer"},
					II = {"Commander_II_Liberator_Cruiser", "Commander_II_Acclamator_I_Assault", "Commander_II_Recusant_Light_Destroyer", "Commander_II_Gladiator_I"},
					I = {"Commander_I_Vigil", "Commander_I_Arquitens", "Commander_I_Nebulon_B_Frigate", "Commander_I_Marauder"},
				},
				land = {
					IV = {"Commander_IV_JX40_Company", "Commander_IV_Strikebreaker_Company", "Commander_IV_Aratech_Battle_Platform_Company"},
					III = {"Commander_III_Espo_Walker_101_Company", "Commander_III_GX12_Hovervan_Company", "Commander_III_Persuader_Command_Company"},
					II = {"Commander_II_Heavy_Espo_Company", "Commander_II_CSA_64Y_Sled_Company", "Commander_II_X10_Groundcruiser_Company"},
					I = {"Commander_I_Espo_Company", "Commander_I_CSA_OOM_Company"},
				}
			},
			["EMPIREOFTHEHAND"] = {
				space = {
					IV = {"Commander_IV_Syndic_Destroyer", "Commander_IV_Phalanx_Destroyer", {"Commander_IV_Intego_Destroyer", "Intego_Destroyer"}},
					III = {"Commander_III_Chaf_Destroyer", "Commander_III_Efodio_Fleet_Tender", "Commander_III_Ascendancy_Star_Destroyer"},
					II = {{"Commander_II_Rohkea_Frigate", "Rohkea_Frigate"}, "Commander_II_Kynigos_Cruiser", {"Commander_II_Jiucha", "Jiucha"}},
					I = {{"Commander_I_Kuuro_Gunship", "Kuuro_Gunship"}, "Commander_I_Fruoro_Picket_Ship", "Commander_I_Ormos_Carrier"},
				},
				land = {
					IV = {"Commander_IV_VPOAV_Company", "Commander_IV_V2PO_Transport_Company", "Commander_IV_KPO_Company"},
					III = {"Commander_III_2M_Cheri_Repulsortank_Company", "Commander_III_Entoli_LAV_Company", {"Commander_III_Paccian_Missile_Tank_Company", "Paccian_Missile_Tank_Company"}},
					II = {"Commander_II_EotH_Sonic_Walker_Company", "Commander_II_ARack_Company", "Commander_II_OMPAI_Company"},
					I = {"Commander_I_EotH_Phalanx_Trooper_Company", "Commander_I_EotH_Stormtrooper_Company"},
				}
			},
			["DEFAULT"] = { --Empire / Proteus
				space = {
					IV = {{"Commander_IV_Tagge_Battlecruiser", "Tagge_Battlecruiser"}, "Commander_IV_Imperial_I_Star_Destroyer", "Commander_IV_Imperial_II_Star_Destroyer"},
					III = {"Commander_III_Venator_Star_Destroyer", "Commander_III_Victory_I_Star_Destroyer", {"Commander_III_Crimson_Victory_II_Star_Destroyer", "Crimson_Victory_II_Star_Destroyer"}, "Commander_III_Interdictor_Star_Destroyer"},
					II = {"Commander_II_Gladiator_II", "Commander_II_Vindicator_Cruiser", "Commander_II_Acclamator_II", {"Commander_II_MTC_Sensor", "MTC_Sensor"}},
					I = {{"Commander_I_Eidolon", "Eidolon"}, {"Commander_I_Strike_Cruiser", "Strike_Cruiser"}, "Commander_I_Carrack_Cruiser", "Commander_I_Imperial_DHC", {"Commander_I_Imperial_Escort_Carrier", "Imperial_Escort_Carrier"}},
				},
				land = {
					IV = {"Commander_IV_PX4_Company", "Commander_IV_A5_Juggernaut_Company", {"Commander_IV_XR85_Company", "XR85_Company"}},
					III = {"Commander_III_AT_ST_Walker_Company", {"Commander_III_AT_ST_A_Walker_Company", "AT_ST_A_Company"}, "Commander_III_Chariot_LAV_Company"},
					II = {"Commander_II_Shadow_Stormtrooper_Company", "Commander_II_Nova_Stormtrooper_Company", {"Commander_II_Dark_Stormtrooper_Company", "Dark_Stormtrooper_Company"}},
					I = {"Commander_I_Imperial_Army_Guard_Company", "Commander_I_Imperial_Scout_Trooper_Company", "Commander_I_Imperial_Stormtrooper_Company"},
				}
			}
		}

		local faction_data = commander_data[faction_name] or commander_data["DEFAULT"]

		local space_I_list = faction_data.space.I
		local space_II_list = faction_data.space.II
		local space_III_list = faction_data.space.III
		local space_IV_list = faction_data.space.IV
		local land_I_list = faction_data.land.I
		local land_II_list = faction_data.land.II
		local land_III_list = faction_data.land.III
		local land_IV_list = faction_data.land.IV

		Register_Timer(CadetLoop, 0, {Object, true, space_I_list, space_II_list, space_III_list, space_IV_list, land_I_list, land_II_list, land_III_list, land_IV_list, {}, {}})
	end
end