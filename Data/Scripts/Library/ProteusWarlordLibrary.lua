	--The index is the suffix of the popup dummy.
	--FriendlyName is the name that replaces "minor Warlords" in the news feed
	--Planets* is the list of planets that will flip from the unplayable warlords faction, sorted by which planets should be preferred for the capital/hero spawn
	--LeaderTable is the list of space heroes and/or [team] = {unit} that passes the leaders to the government script. Must be at least {} as the crossplot also inits the display
		--{"NO_LEGITIMACY"} will remove the faction from the Legitimacy system
	--LeaderEndingNames controls the name on the end game screen
	--PlanetParticle sets a replacement planet ownership particle
	
	--HeroList* is the list of heroes that will be spawned (will be despawned first if they already exist)
	--IntroText*/IntroHolo* are the multimedia parameters for the introduction
	--StartYear and LastYear are optional constraints that remove a group based on the starting year
	--UnlockList*/LockList* are the optional lists of units to un/lock
	--RemoveList* is the optional list of objects to despawn (mostly for SSD heroes)
	--FactionOverride is an optional name of a faction that is also a valid target in addition to Minor Warlords
	--FactionOverride2, 3 is the same
	--FighterHero is the table of pairs that sets fighter hero assignments {{fighter1,host1},{fighter2,host2}...}
	
	--Fields marked with an asterisk can be replaced with a year indexed table with different values for different starting years
	--{{"era1_hero"}, [x] = {"erax_hero"...}, [y] = {"era1_hero","eray_hero"}...} where alternate heroes will spawn instead if the year is above x
	--Or {era1text, [x] = alttext, [y] = alttext2...} where alttext will play instead if the year is above x

return {
		["ZAARIN_EMPIRE"] = {
			FriendlyName = "Zaarin's Coup Forces",
			Planets = {"QRETU"},
			LeaderTable = {"ZAARIN_GLORY"},
			LeaderEndingNames = {"Grand Admiral Zaarin"},
			HeroList = {"Zaarin_Glory", "Raveen_Predominant", "Arden_Lyn_Team", "Din_Zeplin", "Harkov_Protector"},
			LastYear = 0,
			FactionOverride = "Empire",
			FactionOverride2 = "Zsinj_Empire",
			FactionOverride3 = "Greater_Maldrood",
			IntroText = "TODO",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["LAMBDA"] = {
			FriendlyName = "Lambda Sector",
			Planets = {"RINTONNE","ZOLAN","MON_GAZZA","ANDO","ANDO_PRIME","ANDO_SECUNDUS","ANDOSHA"},
			LeaderTable = {"LANKIN_KNIGHT"},
			LeaderEndingNames = {"Emperor Lankin"},
			HeroList = {"Lankin_Knight", "Tount_Team", "Baem_Team", "Grieves_Team"},
			LastYear = 8,
			UnlockList = {"ISB_Infiltrator_Company"},
			LockList = {"Imperial_Army_Trooper_Company"},
			IntroText = "TEXT_CONQUEST_LAMBDASECTOR_LAMBDA_INTRO_ONE",
			IntroHolo = "Par_Lankin_Loop"
		},
		["ZERO_COMMAND"] = {
			FriendlyName = "Zero Command",
			Planets = {{"KALIST", "THOMORK", "ABREGADO_RAE", "BELGAROTH"}, [10] = {"KALIST", "THOMORK", "ABREGADO_RAE", "BELGAROTH", "ATRAVIS", "MUSTAFAR"}},
			LeaderTable = {"HARRSK_WHIRLWIND","HARRSK_SHOCKWAVE"},
			LeaderEndingNames = {"Emperor Harrsk"},
			HeroList = {"Harrsk_Whirlwind", "Noils_AT_AT_Walker_Team", "Agamar_Meniscus", "Desanne_Redemption", "Qua_Team"},
			UnlockList = {"Imperial_A5RX_Company"},
			LockList = {"Imperial_A5_Juggernaut_Company"},
			LastYear = 11,
			FactionOverride = "Empire",
			IntroText = {"TEXT_CONQUEST_HARRSK_DEEPCORE_E1_3", [5] = "TEXT_CONQUEST_HARRSK_DEEPCORE_E4", [11] = "TEXT_CONQUEST_HARRSK_DEEPCORE_E6"},
			IntroHolo = "Harrsk_Loop"
		},
		["ELROOD"] = {
			FriendlyName = "Elrood Sector",
			Planets = {"ELROOD"},
			LeaderTable = {["VILIS_ANDAL_TEAM"] = {"VILIS_ANDAL"}},
			LeaderEndingNames = {"Emperor Andal"},
			HeroList = {"Pryl_Thunderflare", "Zed_Stalker", "Vilis_Andal_Team", "Afren_Hul_Team"},
			UnlockList = {"ISB_Infiltrator_Company"},
			LockList = {"Imperial_Army_Guard_Company"},
			IntroText = "TEXT_CONQUEST_PROTEUS_ELROOD",
			IntroHolo = "Afren_Hul_Loop"
		},
		["ANTEMERIDIAS"] = {
			FriendlyName = "Antemeridian Sector",
			Planets = {"ANTEMERIDIAS"},
			LeaderTable = {["GETELLES_TEAM"] = {"GETELLES"}},
			LeaderEndingNames = {"Emperor Getelles"},
			HeroList = {"Getelles_Team", "Larm_Carrack"},
			IntroText = "TEXT_CONQUEST_PROTEUS_ANTEM",
			IntroHolo = "Tol_Getelles_Loop"
		},
		["WILD_SPACE"] = {
			FriendlyName = "Delurin's Empire",
			Planets = {"BORMTER","KARAVIS"},
			LeaderTable = {"DELURIN_GALAXY_DRAGON"},
			LeaderEndingNames = {"Emperor Delurin"},
			HeroList = {"Delurin_Galaxy_Dragon"},
			UnlockList = {"Dragon_Heavy_Cruiser"},
			LockList = {"Imperial_DHC"},
			IntroText = "TEXT_CONQUEST_PROTEUS_WILD_SPACE",
			IntroHolo = "Delurin_Loop"
		},
		["PRENTIOCH"] = {
			FriendlyName = "Prentioch's Dominion",
			Planets = {"KRISELIST","KAAL","BOMIS_KOORI","MIZTOC"},
			LeaderTable = {"PRENTIOCH_PRENTIOCH"},
			LeaderEndingNames = {"Emperor Prentioch"},
			HeroList = {"Prentioch_Prentioch", "Dyrra_Team"},
			UnlockList = {"Persuader_Company"},
			LockList = {"S_1_Firehawke_Company","GormTalquist_HQ"},
			IntroText = "TEXT_CONQUEST_PROTEUS_PRENTIOCH",
			IntroHolo = "Utoxx_Prentioch_Loop"
		},
		["SECTOR_5"] = { --Zeven Mallat?
			FriendlyName = "Sector 5",
			Planets = {"ODIK", "PRAKITH"},
			LeaderTable = {"YZU_CONSTITUTION"},
			LeaderEndingNames = {"Emperor Yzu"},
			HeroList = {"Yzu_Constitution", "Foga_Brill_Team", "Gann_Team"},
			UnlockList = {"Citadel_Guardsman_Company"},
			LockList = {"Imperial_Army_Guard_Company"},
			FactionOverride = "Empire",
			LastYear = 11,
			IntroText = "TEXT_CONQUEST_PROTEUS_SECTOR_5",
			IntroHolo = "Malfkla_Yzu_Loop"
		},
		["PRAKITH"] = { --Shynne, Voba Dokrett, Ors Dogot, Gegak?
			FriendlyName = "Protectorate of Prakith",
			Planets = {"PRAKITH", "ODIK"},
			LeaderTable = {["FOGA_BRILL_TEAM"] = {"FOGA_BRILL_TNT"}},
			LeaderEndingNames = {"Emperor Brill"},
			HeroList = {"Foga_Brill_Team", "Gann_Team", "Imperial_Dark_Jedi_Company"}, -- Dark Jedi company placeholder for Shynne
			UnlockList = {"Citadel_Guardsman_Company"},
			LockList = {"Imperial_Army_Guard_Company"},
			FactionOverride = "Empire",
			StartYear = 12,
			LastYear = 18,
			IntroText = "TEXT_CONQUEST_PROTEUS_PRAKITH",
			IntroHolo = "Foga_Brill_Loop"
		},
		["JARDEEN"] = {
			FriendlyName = "Imperial Jardeen",
			Planets = {"JARDEEN"},
			LeaderTable = {"GENDARR_RELIANCE", ["LOTT_TEAM"] = {"LOTT_AT_AT_WALKER"}},
			LeaderEndingNames = {"Emperor Gendarr", "Emperor Lott"},
			HeroList = {"Gendarr_Reliance", "Lott_Team"},
			IntroText = "TEXT_CONQUEST_PROTEUS_JARDEEN",
			IntroHolo = "Arndall_Lott_Loop"
		},
		["CIUTRIC_HEGEMONY"] = {
			FriendlyName = "Ciutric Hegemony",
			Planets = {"CIUTRIC","LIINADE","VROSYNRI","CORVIS_MINOR","M293"},
			LeaderTable = {"KRENNEL_WARLORD"},
			LeaderEndingNames = {"Emperor Krennel"},
			HeroList = {{"Krennel_Warlord", "Phulik_Binder", "Brothic_Team", "Darron_Direption"}, [9] = {"Isard_Clone_Team","Krennel_Warlord", "Phulik_Binder", "Brothic_Team", "Darron_Direption"}},
			FighterHero = {{"LORRIR_TIE_INTERCEPTOR_SQUADRON","KRENNEL_WARLORD"}},
			StartYear = 6,
			LastYear = 9,
			RemoveList = {"Krennel_Reckoning"},
			UnlockList = {"Eidolon","LORRIR_LOCATION_SET"},
			LockList = {"Strike_Cruiser","Loronar_HQ"},
			FactionOverride = "Empire",
			IntroText = {"TEXT_CONQUEST_PROTEUS_CIUTRIC_HEGEMONY", [9] = "TEXT_CONQUEST_ISARDSREVENGE_GE_INTRO_ONE"},
			IntroHolo = "Krennel_Loop"
		},
		["ZSINJ_REMNANTS"] = { --Shenanigans in the main plugin mean you can also use this with Zsinj's faction slot
			FriendlyName = "Zsinj Remnants",
			Planets = {"JAMINERE","VJUN","PHINDAR","NEW_BORNALEX","ZIOST","LUR","KAURON"},
			LeaderTable = {},
			LeaderEndingNames = {"a new Emperor"},
			HeroList = {"Banjeer_Quasar","Teubbo_Team","Lanu_Pasiq_Team","Nabyl_Hawkbat","Raptor_Commando_Company","Raptor_Commando_Company"},
			UnlockList = {"Raptor_Trooper_Company"},
			LockList = {"Imperial_Army_Guard_Company"},
			StartYear = 7,
			LastYear = 9,
			IntroText = "TEXT_CONQUEST_ZSINJ_REMNANTS_INTRO_E3",
			IntroHolo = "Llon_Banjeer_Loop",
			PlanetParticle = "ZE_Allies",
		},
		["KAMINO"] = {
			FriendlyName = "Imperial Kamino",
			Planets = {"KAMINO"},
			LeaderTable = {["DARK_APPRENTICE_TEAM"] = {"DARK_APPRENTICE"}},
			LeaderEndingNames = {"the Dark Master"},
			HeroList = {"Dark_Apprentice_Team", "Cody_Team", "Touler_Korasa_Maze"},
			UnlockList = {"Incinerator_Stormtrooper_Company"},
			LockList = {"Imperial_Army_Guard_Company"},
			FactionOverride = "Independent_Forces",
			IntroText = "TEXT_CONQUEST_LAMBDASECTOR_KAMINO_INTRO_ONE",
			IntroHolo = "Dark_Apprentice_Loop"
		},
		["NABOO"] = {
			FriendlyName = "Imperial Naboo",
			Planets = {"NABOO"},
			LeaderTable = {"PANAKA_THEED"},
			LeaderEndingNames = {"Emperor Panaka"},
			HeroList = {"Jenn_Team", "Panaka_Theed", "Grot_Resolution", "Exov_Team", "Okto_Team", "Roth_Team"},
			FighterHero = {{"SILVERLINE_OPPRESSOR_SQUADRON","PANAKA_THEED"}},
			UnlockList = {"Imperial_TX130S_Company","Silverline_Location_Set"},
			LockList = {"S_1_Firehawke_Company","GormTalquist_HQ"},
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_LAMBDASECTOR_NABOO_INTRO_ONE",
			IntroHolo = "Quarsh_Panaka_Loop"
		},
		["RADAMA"] = {
			FriendlyName = "Imperial Ord Radama",
			Planets = {"ORD_RADAMA"},
			LeaderTable = {["ELLOR_TEAM"] = {"ELLOR_ORGRAAL"}},
			LeaderEndingNames = {"Emperor Orgraal"},
			HeroList = {"Wellam_Eternal_Wrath", "Jocaos_Team", "Xantus_Team", "Ellor_Team"},
			FactionOverride = "Empire",
			FactionOverride2 = "Zsinj_Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_RADAMA",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["TAPANI"] = {
			FriendlyName = "Tapani Sector",
			Planets = {"FONDOR","MRLSST"},
			LeaderTable = {["JASET_TEAM"] = {"BAL_JASET"}},
			LeaderEndingNames = {"Emperor Jaset"},
			HeroList = {{"Darius_Shield_Breaker", "Corvae_Team", "Jion_Team", "Jaset_Team"}, [7] = {"Darius_Shield_Breaker", "Jion_Team", "Jaset_Team"}},
			UnlockList = {"Torpedo_Sphere","Firebird_Stormtrooper_Company"},
			LockList = {"Allegiance_Battlecruiser"},
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_TAPANI",
			IntroHolo = "Imperial_Army_Officer_Loop"
		},
		["GAROS"] = {
			FriendlyName = "Imperial Garos",
			Planets = {"GAROS"},
			LeaderTable = {["ZAKAR_TEAM"] = {"ZAKAR_SKIFF"}},
			LeaderEndingNames = {"Emperor Zakar"},
			HeroList = {"Carner_Team", "Zakar_Team"},
			FactionOverride = "Empire",
			FactionOverride2 = "Zsinj_Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_GAROS",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["MAELSTROM"] = {
			FriendlyName = "Maelstrom Command",
			Planets = {"ORD_TRASI","MYGEETO","MORISHIM","ORD_BINIIR"},
			LeaderTable = {"TORPIN_PASSENGER", "VANKO_INVINCIBLE"},
			LeaderEndingNames = {"Emperor Torpin", "Emperor Vanko"},
			HeroList = {"Torpin_Passenger", "Vanko_Invincible", "Vatoki_Team"},
			UnlockList = {"Imperial_Navy_Trooper_Company"},
			LockList = {"Imperial_Army_Trooper_Company"},
			FactionOverride = "Empire",
			FactionOverride2 = "Pentastar",
			IntroText = "TEXT_CONQUEST_PROTEUS_MAELSTROM",
			IntroHolo = "Nigel_Nivers_Loop"
		},
		["SHADOWSPAWN"] = {
			FriendlyName = "Shadow Realm",
			Planets = {"MINDOR"},
			LeaderTable = {"CRONAL_SINGULARITY"},
			LeaderEndingNames = {"Emperor Shadowspawn"},
			HeroList = {"Cronal_Singularity","Klick_Team","Shadowspawn_Team"},
			UnlockList = {"Shadow_Stormtrooper_Company"},
			LockList = {"Imperial_Army_Guard_Company"},
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_SHADOW_REALM",
			IntroHolo = "Shadowspawn_Loop"
		},
		["PROPHETS"] = {
			FriendlyName = "Prophets of the Dark Side",
			Planets = {"KORRIBAN"},
			LeaderTable = {["KADANN_TEAM"] = {"KADANN"}},
			LeaderEndingNames = {"the Supreme Prophet"},
			HeroList = {"Kadann_Team","Jedgar_Team"},
			UnlockList = {"PDF_Force_Cultist_Company"},
			LockList = {"Imperial_Army_Trooper_Company"},
			LastYear = 6,
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_PROPHETS",
			IntroHolo = "Kadann_Loop"
		},
		["TAGGE"] = {
			FriendlyName = "House of Tagge",
			Planets = {"TEPASI","BRENTAAL","BONADAN","LANTILLIES","DRUCKENWELL","MONASTERY","KRANN","TISSSHARL"},
			LeaderTable = {"ULRIC_TAGGE"},
			LeaderEndingNames = {"Emperor Tagge"},
			HeroList = {"Ulric_Tagge"},
			UnlockList = {"CSA_Tagge_Battlecruiser","TaggeCo_HQ"},
			LockList = {"Allegiance_Battlecruiser"},
			FactionOverride = "Empire",
			FactionOverride2 = "Zsinj_Empire",
			FactionOverride3 = "Greater_Maldrood",
			IntroText = "TEXT_CONQUEST_PROTEUS_TAGGE",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["TIERFON"] = {
			FriendlyName = "Tierfon Sector",
			Planets = {"THUSTRA"},
			LeaderTable = {"TZENKENS_ATLAS"},
			LeaderEndingNames = {"Emperor Tzenkens"},
			HeroList = {"Tzenkens_Atlas"},
			UnlockList = {"Imperial_Navy_Trooper_Company"},
			LockList = {"Imperial_Army_Trooper_Company"},
			FactionOverride = "Empire",
			FactionOverride2 = "Zsinj_Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_TIERFON",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["BAKURA"] = {
			FriendlyName = "Imperial Bakura",
			Planets = {"BAKURA"},
			LeaderTable = {["WILEK_NEREUS_TEAM"] = {"WILEK_NEREUS"}},
			LeaderEndingNames = {"Emperor Nereus"},
			HeroList = {"Wilek_Nereus_Team", "Thanas_Dominant"},
			UnlockList = {"Imperial_DP20","CEC_HQ"},
			LockList = {"Lancer_Frigate"},
			LastYear = 4,
			IntroText = "TEXT_CONQUEST_PROTEUS_BAKURA",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["BRAK"] = {
			FriendlyName = "Brak Sector",
			Planets = {"BACRANA"},
			LeaderTable = {["RAMIER_TEAM"] = {"RAMIER"}},
			LeaderEndingNames = {"Emperor Ramier"},
			HeroList = {"Ramier_Team","Trier_Secutor","Lacmar_Team","Maston_Team"},
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_BRAK",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["TAMARIN"] = {
			FriendlyName = "Tamarin Sector",
			Planets = {"SEVARCOS","KIRDO","DRAVIAN_STARPORT"},
			LeaderTable = {"RESUUN_RETRIBUTION"},
			LeaderEndingNames = {"Emperor Resuun"},
			HeroList = {"Resuun_Retribution"},
			UnlockList = {"Customs_Corvette"},
			LockList = {"IPV1"},
			IntroText = "TEXT_CONQUEST_PROTEUS_TAMARIN",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["ISECTOR"] = {
			FriendlyName = "I-sector",
			Planets = {"SAGMA","THILA","MIRIEL"},
			LeaderTable = {["SHARGAEL_TEAM"] = {"SHARGAEL_AT_TE"}},
			LeaderEndingNames = {"Emperor Shargael"},
			HeroList = {"Shargael_Team"},
			FactionOverride = "Empire",
			FactionOverride2 = "Zsinj_Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_ISECTOR",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["IMPERIAL_LIANNA"] = {
			FriendlyName = "Imperial Lianna",
			Planets = {"LIANNA"},
			LeaderTable = {["PHILLIP_SANTHE_TEAM"] = {"PHILLIP_SANTHE"}},
			LeaderEndingNames = {"Emperor Santhe"},
			HeroList = {"Phillip_Santhe_Team", "Worhven_Dominator", "Imre_Talberenina_Ballista", "Verpalion_Warlord"},
			RemoveList = {"Valles_Interdictor","Amatha_Fetz_Super_Transport_XI"},
			UnlockList = {"TIE_Crawler_Company"},
			LockList = {"S_1_Firehawke_Company","GormTalquist_HQ"},
			IntroText = "TEXT_CONQUEST_PROTEUS_IMPERIAL_LIANNA",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["QUINTAD"] = {
			FriendlyName = "The Quintad",
			Planets = {"ERIADU","AGOMAR","BELSAVIS"},
			LeaderTable = {"THALASSA_EXECUTRIX"},
			LeaderEndingNames = {"Empress Tarkin"},
			HeroList = {"Thalassa_Executrix", "Garvedon_Captor", "Paige_Tarkin_Team"},
			UnlockList = {"Charger_C70","CEC_HQ","Tarkin_Estates"},
			LockList = {"Lancer_Frigate"},
			IntroText = "TEXT_CONQUEST_PROTEUS_QUINTAD",
			IntroHolo = "Mon_Mothma_Loop"
		},
		["DASTA"] = {
			FriendlyName = "D'Astan Sector",
			Planets = {"NEZ_PERON","AXXILA","SERENNO","ORD_CESTUS","CELANON","VALAHARI"},
			LeaderTable = {"RAGEZ_DASTA_MARAUDER"},
			LeaderEndingNames = {"Emperor D'Asta"},
			HeroList = {"Ragez_DAsta_Marauder", "MNista_Quasar", "Feena_DAsta_Team"},
			UnlockList = {"Marauder_Cruiser"},
			LockList = {"Carrack_Cruiser"},
			FactionOverride = "Empire",
			FactionOverride2 = "Zsinj_Empire",
			IntroText = {"TEXT_CONQUEST_PROTEUS_DASTA", [12] = "TEXT_CONQUEST_PROTEUS_DASTA_E7"},
			IntroHolo = "Ragez_DAsta_Loop"
		},
		["HAMMERS"] = {
			FriendlyName = "Imperial Hammers",
			Planets = {"BRINTOOIN"},
			LeaderTable = {["JOHANS_TEAM"] = {"JOHANS_FIREHAWKE"}},
			LeaderEndingNames = {"Emperor Johans"},
			HeroList = {"Johans_Team", "Arbmab_Team", "Thalkuss_Team"},
			UnlockList = {"Repulsor_Tank_Mark_II_Company"},
			IntroText = "TEXT_CONQUEST_PROTEUS_HAMMERS",
			IntroHolo = "Arndall_Lott_Loop"
		},
		["KASHYYYK"] = {
			FriendlyName = "Imperial Kashyyyk",
			Planets = {"KASHYYYK","TRANDOSHA"},
			LeaderTable = {["DARCC_TEAM"] = {"DARCC"}},
			LeaderEndingNames = {"Emperor Darcc"},
			HeroList = {"Krieg_Immobilizer", "Syn_Silooth", "Darcc_Team", "Pekt_Team"},
			UnlockList = {"Imperial_AT_AP_Walker_Company"},
			LockList = {"Imperial_A5_Juggernaut_Company"},
			FactionOverride = "Empire",
			LastYear = 4,
			IntroText = "TEXT_CONQUEST_PROTEUS_KASHYYYK",
			IntroHolo = "Darcc_Loop"
		},
		["LUMIYA"] = {
			FriendlyName = "Lumiya's Sith",
			Planets = {"KORRIBAN","HERDESSA"},
			LeaderTable = {["LUMIYA_TEAM"] = {"LUMIYA"}},
			LeaderEndingNames = {"Dark Lady Lumiya"},
			HeroList = {"Lumiya_Team", "Bethrogg_Behemoth", "Valek_Revenant"},
			FactionOverride = "Empire",
			StartYear = 7,
			IntroText = "TEXT_CONQUEST_PROTEUS_LUMIYA",
			IntroHolo = "Lumiya_Loop"
		},
		["ARDA"] = {
			FriendlyName = "Imperial Arda",
			Planets = {"ARDA"},
			LeaderTable = {["VORREL_TEAM"] = {"VORREL_AT_AT_WALKER"}},
			LeaderEndingNames = {"Emperor Vorrel"},
			HeroList = {"Balrekk_Team", "Vorrel_Team"},
			UnlockList = {"TAM_BLACKSTAR_DARK_BLADE_LOCATION_SET"},
			FactionOverride = "Independent_Forces",
			FactionOverride2 = "Zsinj_Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_ARDA",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["SELLASAS"] = {
			FriendlyName = "Imperial Sellasas",
			Planets = {"SELLASAS"},
			LeaderTable = {["JEDSELK_TEAM"] = {"JEDSELK_PX4"}},
			LeaderEndingNames = {"Emperor Jedselk"},
			HeroList = {"Kedler_Eleos", "Jedselk_Team", "Amara_Jedselk_Team"},
			FactionOverride = "Eriadu_Authority",
			IntroText = "TEXT_CONQUEST_PROTEUS_SELLASAS",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["PROTECTORATE"] = {
			FriendlyName = "The Protectorate",
			Planets = {"TRULALIS"},
			LeaderTable = {["ADALRIC_BRANDL_TEAM"] = {"ADALRIC_BRANDL"}},
			LeaderEndingNames = {"Emperor Brandl"},
			HeroList = {"Adalric_Brandl_Team", "Jaalib_Brandl_Protectorate_I", "Fable_Astin_Team"},
			UnlockList = {"Pursuit_Light_Cruiser"},
			LockList = {"Imperial_DHC"},
			IntroText = "TEXT_CONQUEST_PROTEUS_PROTECTORATE",
			IntroHolo = "Adalric_Brandl_Loop"
		},
		["ZAARIN_REMNANTS"] = {
			FriendlyName = "Zaarin Remnants",
			Planets = {"DANTOOINE"},
			LeaderTable = {"RAVEEN_PREDOMINANT"},
			LeaderEndingNames = {"Emperor Raveen"},
			HeroList = {"Raveen_Predominant"},
			FighterHero = {{"DEATHFIRE_GAMMA_SQUADRON","RAVEEN_PREDOMINANT"}},
			FactionOverride = "Empire",
			FactionOverride2 = "Pentastar",
			UnlockList = {"CR92A","DEATHFIRE_GAMMA_LOCATION_SET","CEC_HQ"},
			LockList = {"Lancer_Frigate"},
			IntroText = "TEXT_CONQUEST_PROTEUS_ZAARIN_REMNANTS",
			IntroHolo = "Raveen_Loop"
		},
		["RAYTER"] = {
			FriendlyName = "Rayter Sector",
			Planets = {"SOLEM","PAKO_RAMOON"},
			LeaderTable = {["OWEN_TEAM"] = {"NILE_OWEN"}},
			LeaderEndingNames = {"Emperor Owen"},
			HeroList = {"Owen_Team", "Sahreel_Impending_Doom"},
			UnlockList = {"Bulwark_I","TransGalMeg_HQ"},
			LockList = {"Victory_II_Star_Destroyer"},
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_RAYTER_SECTOR",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["VOGEL"] = {
			FriendlyName = "Dustig Oversector",
			Planets = {"MHAELI","AGUARL"},
			LeaderTable = {["HAUSER_TEAM"] = {"HAUSER_A9"}},
			LeaderEndingNames = {"Emperor Hauser"},
			HeroList = {"Hauser_Team", "Trommer_Ravagor"},
			FactionOverride = "Empire",
			FactionOverride2 = "Eriadu_Authority",
			IntroText = "TEXT_CONQUEST_PROTEUS_VOGEL_7",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["WESSEX"] = {
			FriendlyName = "Relgim Oversector",
			Planets = {"PAARIN_MINOR"},
			LeaderTable = {"WESSEX_REDOUBT"},
			LeaderEndingNames = {"Emperor Wessex"},
			HeroList = {"Wessex_Redoubt", "Wessex_Dauntless"},
			UnlockList = {"Raider_I_Corvette"},
			LockList = {"IPV1"},
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_WESSEX",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["CATO_NEIMOIDIA"] = {
			FriendlyName = "Imperial Neimoidia",
			Planets = {"CATO_NEIMOIDIA"},
			LeaderTable= {["ERRON_IRBIAN_TEAM"] = {"ERRON_IRBIAN"}},
			LeaderEndingNames = {"Emperor Irbian"},
			HeroList = {"Erron_Irbian_Team", "TH313_Team"},
			UnlockList = {"AT_MP_Company"},
			LockList = {"Imperial_AT_PT_Company"},
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_CATO_NEIMOIDIA",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["KUAT"] = {
			FriendlyName = "Kuat Sector",
			Planets = {"KUAT"},
			LeaderTable= {["KURAS_TEAM"] = {"KURAS_CHARIOT"}},
			LeaderEndingNames = {"Emperor Kuras"},
			HeroList = {"Kuras_Team", "Kendel_Luminous", "Kateel_Team"},
			FactionOverride = "Empire",
			IntroText = "TEXT_CONQUEST_PROTEUS_KUAT",
			IntroHolo = "Imperial_Naval_Officer_Loop"
		},
		["KAARENTH_DISSENSION"] = {
			FriendlyName = "Kaarenth Dissension",
			Planets = {"RZ7"},
			LeaderTable= {["ENNIX_DEVIAN_TEAM"] = {"ENNIX_DEVIAN"}},
			LeaderEndingNames = {"Emperor Devian"},
			HeroList = {"Ennix_Devian_Team", "Ulcane_Dissension"},
			UnlockList = {"IPV1_Zeta"},
			LockList = {"IPV1"},
			LastYear = 10,
			IntroText = "TEXT_CONQUEST_PROTEUS_KAARENTH_DISSENSION",
			IntroHolo = "Ennix_Devian_Loop",
			PlanetParticle = "Kaarenth_Allies",
		},
		["RESTORED_EMPIRE"] = {
			FriendlyName = "Restored Empire",
			Planets = {"RZ7"},
			LeaderTable= {["ENNIX_DEVIAN_TEAM"] = {"ENNIX_DEVIAN"}},
			LeaderEndingNames = {"Emperor Devian"},
			HeroList = {"Ennix_Devian_Team", "Vota_Venator", "Zam_Basdor_Team"},
			UnlockList = {"Venator_Star_Destroyer"},
			LockList = {"Victory_II_Star_Destroyer"},
			StartYear = 11,
			IntroText = {"TEXT_CONQUEST_PROTEUS_RESTORED_EMPIRE", [12] = "TEXT_CONQUEST_PROTEUS_RESTORED_EMPIRE_E7"},
			IntroHolo = "Ennix_Devian_Loop",
			PlanetParticle = "Restored_Allies",
		},
}
