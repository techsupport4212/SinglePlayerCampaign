GameConstants = {
    YEAR_SUFFIX = "ABY",
    YEAR_CYCLES = 12,
    START_YEAR = 4,
    PLAYABLE_FACTIONS = {
        "REBEL",
        "EMPIRE",
        --"UNDERWORLD",
        "HUTT_CARTELS",
        "ERIADU_AUTHORITY",
        "GREATER_MALDROOD",
        "PENTASTAR",
        "ZSINJ_EMPIRE",
        --"CORELLIA",
        "CORPORATE_SECTOR",
        "HAPES_CONSORTIUM",
        "EMPIREOFTHEHAND",
        --"CHISS",
        -- "KILLIK_HIVES",
        -- "SSIRUUVI_IMPERIUM",
        "IMPERIAL_PROTEUS",
        "YEVETHA",
    },
    NONPLAYABLE_FACTIONS = {
        "UNDERWORLD",
        "INDEPENDENT_FORCES",
        "HOSTILE",
        "NEUTRAL",
        "CORELLIA",
        "CHISS",
        "KILLIK_HIVES",
        "SSIRUUVI_IMPERIUM",
        "MANDALORIANS",
        "WARLORDS",
        "YEVETHA",
        "SECTOR_FORCES",
        "HOLDOUTS",
    },
    ALL_FACTIONS = {--Adjust Get_Faction_Index in Data\XML\AI\PerceptualEquations\TRBasicGalacticEquations.xml to match for any additions or redorders
        "REBEL",
        "EMPIRE",
        "UNDERWORLD",
        "HUTT_CARTELS",
        "INDEPENDENT_FORCES",
        "HOSTILE",
        "NEUTRAL",
        "ERIADU_AUTHORITY",
        "GREATER_MALDROOD",
        "PENTASTAR",
        "ZSINJ_EMPIRE",
        "CORELLIA",
        "CORPORATE_SECTOR",
        "HAPES_CONSORTIUM",
        "EMPIREOFTHEHAND",
        "CHISS",
        "KILLIK_HIVES",
        "SSIRUUVI_IMPERIUM",
        "MANDALORIANS",
        "WARLORDS",
        "IMPERIAL_PROTEUS",
        "YEVETHA",
        "SECTOR_FORCES",
        "HOLDOUTS",
    },
    ALL_FACTIONS_NOT_NEUTRAL = {
        "REBEL",
        "EMPIRE",
        "UNDERWORLD",
        "HUTT_CARTELS",
        "INDEPENDENT_FORCES",
        "HOSTILE",
        "ERIADU_AUTHORITY",
        "GREATER_MALDROOD",
        "PENTASTAR",
        "ZSINJ_EMPIRE",
        "CORELLIA",
        "CORPORATE_SECTOR",
        "HAPES_CONSORTIUM",
        "EMPIREOFTHEHAND",
        "CHISS",
        "KILLIK_HIVES",
        "SSIRUUVI_IMPERIUM",
        "MANDALORIANS",
        "WARLORDS",
        "IMPERIAL_PROTEUS",
        "YEVETHA",
        "SECTOR_FORCES",
        "HOLDOUTS",
    },
    ALL_FACTION_TEXTS = {
        REBEL = "TEXT_FACTION_NEW_REPUBLIC",
        EMPIRE = "TEXT_FACTION_EMPIRE",
        UNDERWORLD = "TEXT_FACTION_VONG",
        HUTT_CARTELS = "TEXT_FACTION_HUTT_CARTELS",
        INDEPENDENT_FORCES = "TEXT_FACTION_INDEPENDENT_FORCES",
        HOSTILE = "TEXT_FACTION_HOSTILE",
        NEUTRAL = "TEXT_FACTION_NEUTRAL",
        ERIADU_AUTHORITY = "TEXT_FACTION_ERIADU_AUTHORITY",
        GREATER_MALDROOD = "TEXT_FACTION_MALDROOD",
        PENTASTAR = "TEXT_FACTION_PENTASTAR",
        ZSINJ_EMPIRE = "TEXT_FACTION_ZSINJ_EMPIRE",
        CORELLIA = "TEXT_FACTION_CORELLIANS",
        CORPORATE_SECTOR = "TEXT_FACTION_CSA",
        HAPES_CONSORTIUM = "TEXT_FACTION_HAPES_CONSORTIUM",
        EMPIREOFTHEHAND = "TEXT_FACTION_EOTH",
        CHISS = "TEXT_FACTION_CHISS_ASCENDANCY",
        KILLIK_HIVES = "TEXT_FACTION_KILLIK_HIVES",
        SSIRUUVI_IMPERIUM = "TEXT_FACTION_SSI_RUUVI",
        MANDALORIANS = "TEXT_FACTION_MANDALORIANS",
        WARLORDS = "TEXT_FACTION_WARLORDS",
        IMPERIAL_PROTEUS = "REPORT_THIS_PROTEUS_BUG_A", --should never be seen in game
        YEVETHA = "TEXT_FACTION_DUSKHAN_LEAGUE",
        SECTOR_FORCES = "TEXT_FACTION_SECTOR_FORCES",
        HOLDOUTS = "TEXT_FACTION_HOLDOUTS",
    },
    LIVE_FACTION_TABLE = {--Match the order of the index in factions.xml
        ["REBEL"] = 0,
        ["EMPIRE"] = 1,
        --["UNDERWORLD"] = 2,
        --["NEUTRAL"] = 3,
        --["HOSTILE"] = 4,
        --["INDEPENDENT_FORCES"] = 5,
        ["HUTT_CARTELS"] = 6,
        ["ERIADU_AUTHORITY"] = 7,
        ["GREATER_MALDROOD"] = 8,
        ["PENTASTAR"] = 9,
        ["ZSINJ_EMPIRE"] = 10,
        --["CORELLIA"] = 11,
        ["CORPORATE_SECTOR"] = 12,
        ["HAPES_CONSORTIUM"] = 13,
        ["EMPIREOFTHEHAND"] = 14,
        --["CHISS"] = 15,
        --["KILLIK_HIVES"] = 16,
        --["SSIRUUVI_IMPERIUM"] = 17,
        --["MANDALORIANS"] = 18,
        --["WARLORDS"] = 19,
        ["IMPERIAL_PROTEUS"] = 20,
        ["YEVETHA"] = 21,
        --["SECTOR_FORCES"] = 22,
        --["HOLDOUTS"] = 23,
    },
    ALL_FACTIONS_CAPITALS = {
        REBEL = {STRUCTURE = "NEWREP_CAPITAL", LOCATION = {"CORUSCANT", "SAIJO", "MON_CALAMARI", "BOTHAWUI", "ITHOR", "WALINOR"}},
        EMPIRE = {STRUCTURE = "EMPIRE_CAPITAL", LOCATION = {"CORUSCANT", "BASTION", "ORINDA", "BYSS", "THE_MAW", "ORD_CANTRELL", "FONDOR", "CIUTRIC", "BESTINE"}},
        UNDERWORLD = {STRUCTURE = nil, LOCATION =  {"HELSKA"}},
        HUTT_CARTELS = {STRUCTURE = "HUTT_CAPITAL", LOCATION =  {"NAL_HUTTA", "TATOOINE", "COMRA"}},
        INDEPENDENT_FORCES = {STRUCTURE = nil, LOCATION =  {}},
        HOSTILE = {STRUCTURE = nil, LOCATION =  {}},
        ERIADU_AUTHORITY = {STRUCTURE = "ERIADU_CAPITAL", LOCATION = {"ERIADU", "KAMPE", "SANRAFSIX"}},
        GREATER_MALDROOD = {STRUCTURE = "MALDROOD_CAPITAL", LOCATION = {"CENTARES", "HAKASSI", "RYVESTER", "THANOS"}},
        PENTASTAR = {STRUCTURE = "PA_CAPITAL", LOCATION = {"ENTRALLA","BASTION"}},
        ZSINJ_EMPIRE = {STRUCTURE = "RANCOR_BASE", LOCATION = {"SERENNO", "DATHOMIR"}},
        CORELLIA = {STRUCTURE = nil, LOCATION =  {"CORELLIA"}},
        CORPORATE_SECTOR = {STRUCTURE = "CSA_CAPITAL", LOCATION = {"ETTI"}},
        HAPES_CONSORTIUM = {STRUCTURE = "HAPAN_CAPITAL", LOCATION = {"HAPES"}},
        EMPIREOFTHEHAND = {STRUCTURE = "EOTH_CAPITAL", LOCATION =  {"NIRAUAN"}},
        CHISS = {STRUCTURE = "CHISS_CAPITAL", LOCATION =  {"CSILLA"}},
        KILLIK_HIVES = {STRUCTURE = nil, LOCATION =  {"YOGGOY"}},
        SSIRUUVI_IMPERIUM = {STRUCTURE = "SSIRUUVI_CAPITAL", LOCATION = {"LWHEKK"}},
        MANDALORIANS = {STRUCTURE = nil, LOCATION =  {"MANDALORE"}},
        WARLORDS = {STRUCTURE = nil, LOCATION =  {}},
        IMPERIAL_PROTEUS = {STRUCTURE = "IMPERIAL_PROTEUS_CAPITAL", LOCATION =  {"RINTONNE"}},
        YEVETHA = {STRUCTURE = "YEVETHA_CAPITAL", LOCATION =  {"NZOTH"}},
        SECTOR_FORCES = {STRUCTURE = nil, LOCATION =  {}},
        HOLDOUTS = {STRUCTURE = nil, LOCATION =  {}},
    },
    ALL_FACTIONS_BASIC_STRUCTURES = {
        REBEL = {"REBEL_STAR_BASE_1","REBEL_OFFICE"},
        EMPIRE = {"EMPIRE_STAR_BASE_1","EMPIRE_OFFICE"},
        UNDERWORLD = {},
        HUTT_CARTELS = {"HUTT_STAR_BASE_1","HUTT_OFFICE"},
        INDEPENDENT_FORCES = {"EMPIRE_STAR_BASE_1","REVOLT_PDF_HQ"},
        HOSTILE = {},
        ERIADU_AUTHORITY = {"EMPIRE_STAR_BASE_1","ERIADU_OFFICE"},
        GREATER_MALDROOD = {"EMPIRE_STAR_BASE_1","MALDROOD_OFFICE"},
        PENTASTAR = {"EMPIRE_STAR_BASE_1","PENTASTAR_OFFICE"},
        ZSINJ_EMPIRE = {"EMPIRE_STAR_BASE_1","ZSINJ_OFFICE"},
        CORELLIA = {"REBEL_STAR_BASE_1","REVOLT_PDF_HQ"},
        CORPORATE_SECTOR = {"CSA_STAR_BASE_1","CSA_OFFICE"},
        HAPES_CONSORTIUM = {"HAPAN_STAR_BASE_1","HAPAN_ROYAL_OFFICE"},
        EMPIREOFTHEHAND = {"EOTH_STAR_BASE_1","EOTH_OFFICE"},
        CHISS = {"EOTH_STAR_BASE_1","CHISS_OFFICE"},
        KILLIK_HIVES = {"EOTH_STAR_BASE_1","REVOLT_PDF_HQ"},
        SSIRUUVI_IMPERIUM = {"EMPIRE_STAR_BASE_1","SSIRUUVI_OFFICE"},
        MANDALORIANS = {"EMPIRE_STAR_BASE_1","REVOLT_PDF_HQ"},
        WARLORDS = {"EMPIRE_STAR_BASE_1","EMPIRE_OFFICE"},
        IMPERIAL_PROTEUS = {"EMPIRE_STAR_BASE_1","IMPERIAL_PROTEUS_OFFICE"},
        YEVETHA = {"EMPIRE_STAR_BASE_1","YEVETHA_OFFICE"},
        SECTOR_FORCES = {"EMPIRE_STAR_BASE_1","EMPIRE_OFFICE"},
        HOLDOUTS = {"CSA_STAR_BASE_1","CSA_OFFICE"},
    },
    ALL_FACTIONS_AI = {
        REBEL = "NRAI",
        EMPIRE = "EmpireAI",
        UNDERWORLD = "GenericAI",
        HUTT_CARTELS = "HuttAI",
        INDEPENDENT_FORCES = "None",
        HOSTILE = "None",
        ERIADU_AUTHORITY = "EriaduAI",
        GREATER_MALDROOD = "WarlordAI",
        PENTASTAR = "PentastarAI",
        ZSINJ_EMPIRE = "ZsinjAI",
        CORELLIA = "None",
        CORPORATE_SECTOR = "CorporateAI",
        HAPES_CONSORTIUM = "IsolationistAI",
        EMPIREOFTHEHAND = "EotHAI",
        CHISS = "None",
        KILLIK_HIVES = "None",
        SSIRUUVI_IMPERIUM = "None",
        MANDALORIANS = "None",
        WARLORDS = "None",
        IMPERIAL_PROTEUS = "WarlordAI",
        YEVETHA = "YevethaAI",
        SECTOR_FORCES = "None",
        HOLDOUTS = "None",
    },
    ALL_FACTIONS_CRUEL_AI = {
        REBEL = "SkynetAI",
        EMPIRE = "EmpireSkynetAI",
        UNDERWORLD = "SkynetAI",
        HUTT_CARTELS = "SkynetAI",
        INDEPENDENT_FORCES = "None",
        HOSTILE = "None",
        ERIADU_AUTHORITY = "EriaduSkynetAI",
        GREATER_MALDROOD = "SkynetAI",
        PENTASTAR = "PentastarSkynetAI",
        ZSINJ_EMPIRE = "ZsinjSkynetAI",
        CORELLIA = "None",
        CORPORATE_SECTOR = "SkynetAI",
        HAPES_CONSORTIUM = "SkynetAI",
        EMPIREOFTHEHAND = "SkynetAI",
        CHISS = "None",
        KILLIK_HIVES = "None",
        SSIRUUVI_IMPERIUM = "None",
        MANDALORIANS = "None",
        WARLORDS = "None",
        IMPERIAL_PROTEUS = "SkynetAI",
        YEVETHA = "SkynetAI",
        SECTOR_FORCES = "None",
        HOLDOUTS = "None",
    },
    FACTION_COLORS = {
        ["REBEL"] = {r = 239, g = 139, b = 9},
        ["EMPIRE"] = {r = 8, g = 122, b = 16},
        ["UNDERWORLD"] = {r = 255, g = 183, b = 110},
        ["HUTT_CARTELS"] = {r = 142, g = 195, b = 0},
        ["INDEPENDENT_FORCES"] = {r = 243, g = 243, b = 243},
        ["HOSTILE"] = {r = 243, g = 243, b = 243},
        ["NEUTRAL"] = {r = 128, g = 128, b = 128},
        ["ERIADU_AUTHORITY"] = {r = 133, g = 253, b = 186},
        ["GREATER_MALDROOD"] = {r = 255, g = 20, b = 50},
        ["PENTASTAR"] = {r = 55, g = 64, b = 184},
        ["ZSINJ_EMPIRE"] = {r = 148, g = 133, b = 60},
        ["CORELLIA"] = {r = 66, g = 179, b = 160},
        ["CORPORATE_SECTOR"] = {r = 176, g = 124, b = 172},
        ["HAPES_CONSORTIUM"] = {r = 212, g = 81, b = 255},
        ["EMPIREOFTHEHAND"] = {r = 102, g = 188, b = 217},
        ["CHISS"] = {r = 248, g = 236, b = 96},
        ["KILLIK_HIVES"] = {r = 132, g = 81, b = 255},
        ["SSIRUUVI_IMPERIUM"] = {r = 249, g = 83, b = 155},
        ["MANDALORIANS"] = {r = 247, g = 201, b = 13},
        ["WARLORDS"] = {r = 243, g = 243, b = 243},
        ["IMPERIAL_PROTEUS"] = {r = 54, g = 134, b = 242},--{r = 90, g = 166, b = 96}
        ["YEVETHA"] = {r = 237, g = 113, b = 108},
        ["SECTOR_FORCES"] = {r = 8, g = 122, b = 16},
        ["HOLDOUTS"] = {r = 44, g = 121, b = 216},
    },
    ALL_FACTION_NAMES = {
        REBEL = "New Republic",
        EMPIRE = "Galactic Empire",
        UNDERWORLD = "Yuuzhan Vong",
        HUTT_CARTELS = "Hutt Cartels",
        INDEPENDENT_FORCES = "Independent Forces",
        HOSTILE = "Hostile",
        NEUTRAL = "Neutral",
        ERIADU_AUTHORITY = "Eriadu Authority",
        GREATER_MALDROOD = "Greater Maldrood",
        PENTASTAR = "Pentastar Alignment",
        ZSINJ_EMPIRE = "Zsinj's Empire",
        CORELLIA = "Corellians",
        CORPORATE_SECTOR = "Corporate Sector Authority",
        HAPES_CONSORTIUM = "Hapes Consortium",
        EMPIREOFTHEHAND = "Empire of the Hand",
        CHISS = "Chiss Ascendancy",
        KILLIK_HIVES = "Killik Hives",
        SSIRUUVI_IMPERIUM = "Ssi-Ruuvi Imperium",
        MANDALORIANS = "Mandalorian Clans",
        WARLORDS = "Minor Warlords",
        IMPERIAL_PROTEUS = "REPORT_THIS_PROTEUS_BUG_B", --should never be seen in game
        YEVETHA = "Duskhan League",
        SECTOR_FORCES = "Imperial Sector Forces",
        HOLDOUTS = "Seperatist Holdouts",
    },
    ALL_FACTION_ABBREVIATIONS = {
        REBEL = "NR",
        EMPIRE = "GE",
        UNDERWORLD = "YV",
        HUTT_CARTELS = "Hutts",
        INDEPENDENT_FORCES = "IF",
        HOSTILE = "H",
        NEUTRAL = "N",
        ERIADU_AUTHORITY = "EA",
        GREATER_MALDROOD = "GM",
        PENTASTAR = "PA",
        ZSINJ_EMPIRE = "ZE",
        CORELLIA = "Cor.",
        CORPORATE_SECTOR = "CSA",
        HAPES_CONSORTIUM = "Hapes",
        EMPIREOFTHEHAND = "EotH",
        CHISS = "CA",
        KILLIK_HIVES = "KH",
        SSIRUUVI_IMPERIUM = "SRI",
        MANDALORIANS = "MC",
        WARLORDS = "MW",
        IMPERIAL_PROTEUS = "MW",
        YEVETHA = "DL",
        SECTOR_FORCES = "SF",
        HOLDOUTS = "SH",
    },
    PARTICLES = {
        REBEL = "NR_Allies",
        EMPIRE = "Empire_Allies",
        HUTT_CARTELS = "Hutt_Allies",
        ERIADU_AUTHORITY = "EA_Allies",
        GREATER_MALDROOD = "GM_Allies",
        PENTASTAR = "PA_Allies",
        ZSINJ_EMPIRE = "ZE_Allies",
        CORELLIA = "Corellia_Allies",
        CORPORATE_SECTOR = "CSA_Allies",
        HAPES_CONSORTIUM = "HC_Allies",
        EMPIREOFTHEHAND = "EotH_Allies",
        CHISS = "Chiss_Allies",
        KILLIK_HIVES = "Killik_Allies",
        SSIRUUVI_IMPERIUM = "Ssi_Allies",
        MANDALORIANS = "Mando_Allies",
        IMPERIAL_PROTEUS = "Warlord_Allies",
        YEVETHA = "DL_Allies",
        SECTOR_FORCES = "Empire_Allies",
        HOLDOUTS = "CIS_ALLIES",
    },
    ALIASES = {
        EMPIRE = "IMPERIAL",
        ERIADU_AUTHORITY = "IMPERIAL",
        GREATER_MALDROOD = "IMPERIAL",
        PENTASTAR = "IMPERIAL",
        ZSINJ_EMPIRE = "IMPERIAL",
        CORELLIA = "INDEPENDENT_FORCES", --Stopgap
        CHISS = "EMPIREOFTHEHAND", --Stopgap
        KILLIK_HIVES = "INDEPENDENT_FORCES", --Stopgap
        SSIRUUVI_IMPERIUM = "INDEPENDENT_FORCES", --Stopgap
        MANDALORIANS = "INDEPENDENT_FORCES", --Stopgap
        WARLORDS = "IMPERIAL",
        IMPERIAL_PROTEUS = "IMPERIAL",
        YEVETHA = "IMPERIAL", --Stopgap, probably
        SECTOR_FORCES = "IMPERIAL",
    },
    TRANSPORTS = {
        ["REBEL"] = "Gallofree_Transport_Landing",
        ["EMPIRE"] = "Imperial_Landing_Craft_Landing",
        ["UNDERWORLD"] = "Gallofree_Transport_Landing",
        ["HUTT_CARTELS"] = "Gallofree_Transport_Landing",
        ["INDEPENDENT_FORCES"] = "Gallofree_Transport_Landing",
        ["ERIADU_AUTHORITY"] = "Imperial_Landing_Craft_Landing",
        ["GREATER_MALDROOD"] = "Imperial_Landing_Craft_Landing",
        ["PENTASTAR"] = "Imperial_Landing_Craft_Landing",
        ["ZSINJ_EMPIRE"] = "Imperial_Landing_Craft_Landing",
        ["CORELLIA"] = "Gallofree_Transport_Landing",
        ["CORPORATE_SECTOR"] = "Gallofree_Transport_Landing",
        ["HAPES_CONSORTIUM"] = "Gallofree_Transport_Landing",
        ["EMPIREOFTHEHAND"] = "Imperial_Landing_Craft_Landing",
        ["CHISS"] = "Imperial_Landing_Craft_Landing",
        ["KILLIK_HIVES"] = "Gallofree_Transport_Landing",
        ["SSIRUUVI_IMPERIUM"] = "Gallofree_Transport_Landing",
        ["MANDALORIANS"] = "Gallofree_Transport_Landing",
        ["WARLORDS"] = "Imperial_Landing_Craft_Landing",
        ["IMPERIAL_PROTEUS"] = "Imperial_Landing_Craft_Landing",
        ["YEVETHA"] = "Imperial_Landing_Craft_Landing",
        ["SECTOR_FORCES"] = "Imperial_Landing_Craft_Landing",
        ["HOLDOUTS"] = "Gallofree_Transport_Landing",
    },
    FTGU_HUMAN_START_FORCES = {
        ["REBEL"] = {
            ["ERA_1"] = {
                "Rebel_Office","Tax_Agency","R_Ground_Barracks","R_Ground_Heavy_Vehicle_Factory",
                "New_Republic_Army_Trooper_Company","New_Republic_Army_Trooper_Company","New_Republic_Infiltrator_Company","New_Republic_AAC_2_Company",
                "New_Republic_SRV1_Company","New_Republic_T3B_Company","New_Republic_T47_Airspeeder_Company","New_Republic_T4B_Company","MAS_2xB_Company",
                "CR90","CR90","DP20","DP20","Nebulon_B_Frigate","Quasar","MC30a","MC40a","Alliance_Assault_Frigate_II","Dauntless"
            },
            ["ERA_2"] = {
                "Rebel_Office","Tax_Agency","R_Ground_Barracks","R_Ground_Heavy_Vehicle_Factory",
                "New_Republic_Army_Trooper_Company","New_Republic_Army_Trooper_Company","New_Republic_Infiltrator_Company","New_Republic_AAC_2_Company",
                "New_Republic_SRV1_Company","New_Republic_T3B_Company","New_Republic_T47_Airspeeder_Company","New_Republic_T4B_Company","MAS_2xB_Company",
                "CR90","CR90","DP20","DP20","Nebulon_B_Frigate","Quasar","MC30a","MC40a","Alliance_Assault_Frigate_II","Dauntless"
            },
            ["ERA_3"] = {
                "Rebel_Office","Tax_Agency","R_Ground_Barracks","R_Ground_Heavy_Vehicle_Factory",
                "New_Republic_Army_Trooper_Company","New_Republic_Army_Trooper_Company","New_Republic_Infiltrator_Company","New_Republic_AAC_2_Company",
                "New_Republic_SRV1_Company","New_Republic_T3B_Company","New_Republic_T47_Airspeeder_Company","New_Republic_T4B_Company","MAS_2xB_Company",
                "CR90","CR90","DP20","DP20","Nebulon_B_Frigate","Quasar","MC30a","MC40a","Alliance_Assault_Frigate_II","Dauntless"
            },
            ["ERA_4"] = {
                "Rebel_Office","Tax_Agency","R_Ground_Barracks","R_Ground_Heavy_Vehicle_Factory",
                "New_Republic_Army_Trooper_Company","New_Republic_Defense_Trooper_Company","New_Republic_Infiltrator_Company","New_Republic_AAC_2_Company",
                "New_Republic_SRV1_Company","New_Republic_T3B_Company","V_Wing_Airspeeder_Company","New_Republic_T4B_Company","MAS_2xB_Company",
                "CR90","CR90","DP20","Corona","Quasar","MC30a","Belarus","Alliance_Assault_Frigate_II","Dauntless"
            },
            ["ERA_5"] = {
                "Rebel_Office","Tax_Agency","R_Ground_Barracks","R_Ground_Heavy_Vehicle_Factory",
                "New_Republic_Army_Trooper_Company","New_Republic_Defense_Trooper_Company","New_Republic_Infiltrator_Company","New_Republic_AAC_2_Company",
                "New_Republic_SRV1_Company","New_Republic_T3B_Company","V_Wing_Airspeeder_Company","New_Republic_T4B_Company","MAS_2xB_Company",
                "CR90","CR90","DP20","Corona","Quasar","MC30a","Belarus","Alliance_Assault_Frigate_II","Dauntless"
            },
            ["ERA_6"] = {
                "Rebel_Office","Tax_Agency","R_Ground_Barracks","R_Ground_Heavy_Vehicle_Factory",
                "New_Republic_Army_Trooper_Company","New_Republic_Defense_Trooper_Company","New_Republic_Infiltrator_Company","New_Republic_AAC_2_Company",
                "New_Republic_SRV1_Company","New_Republic_T3B_Company","V_Wing_Airspeeder_Company","New_Republic_T4B_Company","MAS_2xB_Company",
                "CR90","CR90","DP20","Corona","Quasar","MC30a","Belarus","Alliance_Assault_Frigate_II","Dauntless"
            },
            ["ERA_7"] = {
                "Rebel_Office","Tax_Agency","R_Ground_Barracks","R_Ground_Heavy_Vehicle_Factory",
                "New_Republic_Army_Trooper_Company","New_Republic_Defense_Trooper_Company","New_Republic_Infiltrator_Company","New_Republic_AAC_2_Company",
                "New_Republic_SRV1_Company","New_Republic_T3B_Company","V_Wing_Airspeeder_Company","New_Republic_T4B_Company","MAS_2xB_Company",
                "Agave_Corvette","Agave_Corvette","Warrior_Gunship","Warrior_Gunship","Corona","Quasar","MC30a","Alliance_Assault_Frigate_II","Defender_Carrier","Majestic"
            },
        },
        ["EMPIRE"] = {
            ["ERA_1"] = {
                "Empire_Office","Tax_Agency","E_Ground_Barracks","E_Ground_Heavy_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","IPV1","IPV1","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Eidolon","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_2"] = {
                "Empire_Office","Tax_Agency","E_Ground_Barracks","E_Ground_Heavy_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","IPV1","IPV1","Lancer_Frigate","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_3"] = {
                "Empire_Office","Tax_Agency","E_Ground_Barracks","E_Ground_Heavy_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","IPV1","Star_Galleon","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_4"] = {
                "Empire_Office","Tax_Agency","E_Ground_Barracks","E_Ground_Heavy_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Compforce_Assault_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_A_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_AT_AT_Walker_Company","XR85_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","IPV1","IPV1","Hunter_Killer_Probot","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","MTC_Sensor","Victory_I_Star_Destroyer"
            },
            ["ERA_5"] = {
                "Empire_Office","Tax_Agency","E_Ground_Barracks","E_Ground_Heavy_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_A_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Delta_JV7_Group","IPV1","IPV1","Lancer_Frigate","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_6"] = {
                "Empire_Office","Tax_Agency","E_Ground_Barracks","E_Ground_Heavy_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_A_Company","Imperial_Dwarf_Spider_Droid_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","Crusader_Gunship","Patrol_Nebulon_B","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_7"] = {
                "Empire_Office","Tax_Agency","E_Ground_Barracks","E_Ground_Heavy_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_A_Company","Imperial_Dwarf_Spider_Droid_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","Crusader_Gunship","Patrol_Nebulon_B","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
        },
        ["HUTT_CARTELS"] = {
            ["ERA_1"] = {
                "Hutt_Office","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Heavy_Vehicle_Factory",
                "Hutt_Guard_Company","Gamorrean_Guard_Company","Armored_Hutt_Company","Hutt_Desert_Sail20_Company",
                "Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
                "Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
            },
            ["ERA_2"] = {
                "Hutt_Office","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Heavy_Vehicle_Factory",
                "Hutt_Guard_Company","Gamorrean_Guard_Company","Armored_Hutt_Company","Hutt_Desert_Sail20_Company",
                "Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
                "Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
            },
            ["ERA_3"] = {
                "Hutt_Office","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Heavy_Vehicle_Factory",
                "Hutt_Guard_Company","Gamorrean_Guard_Company","Armored_Hutt_Company","Hutt_Desert_Sail20_Company",
                "Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
                "Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
            },
            ["ERA_4"] = {
                "Hutt_Office","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Heavy_Vehicle_Factory",
                "Hutt_Guard_Company","Gamorrean_Guard_Company","Armored_Hutt_Company","Hutt_Desert_Sail20_Company",
                "Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
                "Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
            },
            ["ERA_5"] = {
                "Hutt_Office","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Heavy_Vehicle_Factory",
                "Hutt_Guard_Company","Gamorrean_Guard_Company","Armored_Hutt_Company","Hutt_Desert_Sail20_Company",
                "Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
                "Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
            },
            ["ERA_6"] = {
                "Hutt_Office","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Heavy_Vehicle_Factory",
                "Hutt_Guard_Company","Gamorrean_Guard_Company","Armored_Hutt_Company","Hutt_Desert_Sail20_Company",
                "Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
                "Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
            },
            ["ERA_7"] = {
                "Hutt_Office","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Heavy_Vehicle_Factory",
                "Hutt_Guard_Company","Gamorrean_Guard_Company","Armored_Hutt_Company","Hutt_Desert_Sail20_Company",
                "Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
                "Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
            },
        },
        ["ERIADU_AUTHORITY"] = {
            ["ERA_1"] = {
                "Eriadu_Office","Tax_Agency","A_Ground_Barracks","A_Ground_Heavy_Vehicle_Factory",
                "Army_Special_Missions_Company","Army_Special_Missions_Company","Imperial_Stormtrooper_Company","64_Y_Swift_Repulsorlift_Sled_Company",
                "AT_MP_Company","AT_MP_Company","1M_Tank_Company","Imperial_Flashblind_Company","1H_Tank_Company",
                "Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","IPV1","IPV1","IPV1","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Gladiator_I","Imperial_I_Frigate","Victory_I_Star_Destroyer"
                },
            ["ERA_2"] = {
                "Eriadu_Office","Tax_Agency","A_Ground_Barracks","A_Ground_Heavy_Vehicle_Factory",
                "Army_Special_Missions_Company","Army_Special_Missions_Company","Imperial_Stormtrooper_Company","64_Y_Swift_Repulsorlift_Sled_Company",
                "AT_MP_Company","AT_MP_Company","1M_Tank_Company","Imperial_Flashblind_Company","1H_Tank_Company",
                "Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","IPV1","IPV1","IPV1","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Gladiator_I","Imperial_I_Frigate","Victory_I_Star_Destroyer"
            },
            ["ERA_3"] = {
                "Eriadu_Office","Tax_Agency","A_Ground_Barracks","A_Ground_Heavy_Vehicle_Factory",
                "Army_Special_Missions_Company","Army_Special_Missions_Company","Imperial_Stormtrooper_Company","64_Y_Swift_Repulsorlift_Sled_Company",
                "AT_MP_Company","AT_MP_Company","1M_Tank_Company","Imperial_Flashblind_Company","1H_Tank_Company",
                "Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","IPV1","IPV1","IPV1","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Gladiator_I","Imperial_I_Frigate","Victory_I_Star_Destroyer"
            },
            ["ERA_4"] = {
                "Eriadu_Office","Tax_Agency","A_Ground_Barracks","A_Ground_Heavy_Vehicle_Factory",
                "Army_Special_Missions_Company","Army_Special_Missions_Company","Imperial_Stormtrooper_Company","64_Y_Swift_Repulsorlift_Sled_Company",
                "AT_MP_Company","AT_MP_Company","1M_Tank_Company","Imperial_Flashblind_Company","1H_Tank_Company",
                "Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","IPV1","IPV1","IPV1","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Gladiator_I","Imperial_I_Frigate","Victory_I_Star_Destroyer"
            },
            ["ERA_5"] = {
                "Eriadu_Office","Tax_Agency","A_Ground_Barracks","A_Ground_Heavy_Vehicle_Factory",
                "Army_Special_Missions_Company","Army_Special_Missions_Company","Imperial_Stormtrooper_Company","64_Y_Swift_Repulsorlift_Sled_Company",
                "AT_MP_Company","AT_MP_Company","1M_Tank_Company","Imperial_Flashblind_Company","1H_Tank_Company",
                "Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","IPV1","IPV1","IPV1","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Gladiator_I","Imperial_I_Frigate","Victory_I_Star_Destroyer"
            },
            ["ERA_6"] = {
                "Eriadu_Office","Tax_Agency","A_Ground_Barracks","A_Ground_Heavy_Vehicle_Factory",
                "Army_Special_Missions_Company","Army_Special_Missions_Company","Imperial_Stormtrooper_Company","64_Y_Swift_Repulsorlift_Sled_Company",
                "AT_MP_Company","AT_MP_Company","1M_Tank_Company","Imperial_Flashblind_Company","1H_Tank_Company",
                "Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","IPV1","IPV1","IPV1","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Gladiator_I","Imperial_I_Frigate","Victory_I_Star_Destroyer"
            },
            ["ERA_7"] = {
                "Eriadu_Office","Tax_Agency","A_Ground_Barracks","A_Ground_Heavy_Vehicle_Factory",
                "Army_Special_Missions_Company","Army_Special_Missions_Company","Imperial_Stormtrooper_Company","64_Y_Swift_Repulsorlift_Sled_Company",
                "AT_MP_Company","AT_MP_Company","1M_Tank_Company","Imperial_Flashblind_Company","1H_Tank_Company",
                "Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","Gamma_ATR_6_Group","IPV1","IPV1","IPV1","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Gladiator_I","Imperial_I_Frigate","Victory_I_Star_Destroyer"
            },
        },
        ["GREATER_MALDROOD"] = {
            ["ERA_1"] = {
                "Maldrood_Office","Tax_Agency","T_Ground_Barracks","T_Ground_Heavy_Vehicle_Factory",
                "Navy_Commando_Company","Navy_Commando_Company","Imperial_Stormtrooper_Company","Imperial_AT_RT_Company",
                "RTT_Company","RTT_Company","2M_Repulsor_Tank_Company","INT4_Company","Imperial_A5_Juggernaut_Company",
                "Guardian_Cruiser_Group","Guardian_Cruiser_Group","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Pursuit_Light_Cruiser","Imperial_II_Frigate","Crimson_Victory_II_Star_Destroyer"
            },
            ["ERA_2"] = {
                "Maldrood_Office","Tax_Agency","T_Ground_Barracks","T_Ground_Heavy_Vehicle_Factory",
                "Navy_Commando_Company","Navy_Commando_Company","Imperial_Stormtrooper_Company","Imperial_AT_RT_Company",
                "RTT_Company","RTT_Company","2M_Repulsor_Tank_Company","INT4_Company","Imperial_A5_Juggernaut_Company",
                "Guardian_Cruiser_Group","Guardian_Cruiser_Group","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Pursuit_Light_Cruiser","Imperial_II_Frigate","Crimson_Victory_II_Star_Destroyer"
            },
            ["ERA_3"] = {
                "Maldrood_Office","Tax_Agency","T_Ground_Barracks","T_Ground_Heavy_Vehicle_Factory",
                "Navy_Commando_Company","Navy_Commando_Company","Imperial_Stormtrooper_Company","Imperial_AT_RT_Company",
                "RTT_Company","RTT_Company","2M_Repulsor_Tank_Company","INT4_Company","Imperial_A5_Juggernaut_Company",
                "Guardian_Cruiser_Group","Guardian_Cruiser_Group","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Pursuit_Light_Cruiser","Imperial_II_Frigate","Crimson_Victory_II_Star_Destroyer"
            },
            ["ERA_4"] = {
                "Maldrood_Office","Tax_Agency","T_Ground_Barracks","T_Ground_Heavy_Vehicle_Factory",
                "Navy_Commando_Company","Navy_Commando_Company","Imperial_Stormtrooper_Company","Imperial_AT_RT_Company",
                "RTT_Company","RTT_Company","2M_Repulsor_Tank_Company","INT4_Company","Imperial_A5_Juggernaut_Company",
                "Guardian_Cruiser_Group","Guardian_Cruiser_Group","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Pursuit_Light_Cruiser","Imperial_II_Frigate","Crimson_Victory_II_Star_Destroyer"
            },
            ["ERA_5"] = {
                "Maldrood_Office","Tax_Agency","T_Ground_Barracks","T_Ground_Heavy_Vehicle_Factory",
                "Navy_Commando_Company","Navy_Commando_Company","Imperial_Stormtrooper_Company","Imperial_AT_RT_Company",
                "RTT_Company","RTT_Company","2M_Repulsor_Tank_Company","INT4_Company","Imperial_A5_Juggernaut_Company",
                "Guardian_Cruiser_Group","Guardian_Cruiser_Group","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Pursuit_Light_Cruiser","Imperial_II_Frigate","Crimson_Victory_II_Star_Destroyer"
            },
            ["ERA_6"] = {
                "Maldrood_Office","Tax_Agency","T_Ground_Barracks","T_Ground_Heavy_Vehicle_Factory",
                "Navy_Commando_Company","Navy_Commando_Company","Imperial_Stormtrooper_Company","Imperial_AT_RT_Company",
                "RTT_Company","RTT_Company","2M_Repulsor_Tank_Company","INT4_Company","Imperial_A5_Juggernaut_Company",
                "Guardian_Cruiser_Group","Guardian_Cruiser_Group","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Pursuit_Light_Cruiser","Imperial_II_Frigate","Crimson_Victory_II_Star_Destroyer"
            },
            ["ERA_7"] = {
                "Maldrood_Office","Tax_Agency","T_Ground_Barracks","T_Ground_Heavy_Vehicle_Factory",
                "Navy_Commando_Company","Navy_Commando_Company","Imperial_Stormtrooper_Company","Imperial_AT_RT_Company",
                "RTT_Company","RTT_Company","2M_Repulsor_Tank_Company","INT4_Company","Imperial_A5_Juggernaut_Company",
                "Guardian_Cruiser_Group","Guardian_Cruiser_Group","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Pursuit_Light_Cruiser","Imperial_II_Frigate","Crimson_Victory_II_Star_Destroyer"
            },
        },
        ["PENTASTAR"] = {
            ["ERA_1"] = {
                "Pentastar_Office","Tax_Agency","P_Ground_Barracks","P_Ground_Heavy_Vehicle_Factory",
                "Enforcer_Trooper_Company","Enforcer_Trooper_Company","Imperial_Stormtrooper_Company","AT_DP_Company",
                "AT_DP_Company","TIE_Mauler_Company","TIE_Crawler_Company","Nemesis_Gunship_Company","C10_Siege_Tower_Company",
                "VT49_Decimator_Group","VT49_Decimator_Group","VT49_Decimator_Group","Raider_I_Corvette","Raider_I_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Ton_Falk_Escort_Carrier","Victory_II_Frigate","Enforcer_Picket_Cruiser","Procursator_Star_Destroyer"
            },
            ["ERA_2"] = {
                "Empire_Office","Tax_Agency","P_Ground_Barracks","P_Ground_Heavy_Vehicle_Factory",
                "Enforcer_Trooper_Company","Enforcer_Trooper_Company","Imperial_Stormtrooper_Company","AT_DP_Company",
                "AT_DP_Company","TIE_Mauler_Company","TIE_Crawler_Company","Nemesis_Gunship_Company","C10_Siege_Tower_Company",
                "VT49_Decimator_Group","VT49_Decimator_Group","VT49_Decimator_Group","Raider_I_Corvette","Raider_I_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Ton_Falk_Escort_Carrier","Victory_II_Frigate","Enforcer_Picket_Cruiser","Procursator_Star_Destroyer"
            },
            ["ERA_3"] = {
                "Empire_Office","Tax_Agency","P_Ground_Barracks","P_Ground_Heavy_Vehicle_Factory",
                "Enforcer_Trooper_Company","Enforcer_Trooper_Company","Imperial_Stormtrooper_Company","AT_DP_Company",
                "AT_DP_Company","TIE_Mauler_Company","TIE_Crawler_Company","Nemesis_Gunship_Company","C10_Siege_Tower_Company",
                "VT49_Decimator_Group","VT49_Decimator_Group","VT49_Decimator_Group","Raider_I_Corvette","Raider_I_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Ton_Falk_Escort_Carrier","Victory_II_Frigate","Enforcer_Picket_Cruiser","Procursator_Star_Destroyer"
            },
            ["ERA_4"] = {
                "Empire_Office","Tax_Agency","P_Ground_Barracks","P_Ground_Heavy_Vehicle_Factory",
                "Enforcer_Trooper_Company","Enforcer_Trooper_Company","Imperial_Stormtrooper_Company","AT_DP_Company",
                "AT_DP_Company","TIE_Mauler_Company","TIE_Crawler_Company","Nemesis_Gunship_Company","C10_Siege_Tower_Company",
                "VT49_Decimator_Group","VT49_Decimator_Group","VT49_Decimator_Group","Raider_I_Corvette","Raider_I_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Ton_Falk_Escort_Carrier","Victory_II_Frigate","Enforcer_Picket_Cruiser","Procursator_Star_Destroyer"
            },
            ["ERA_5"] = {
                "Empire_Office","Tax_Agency","P_Ground_Barracks","P_Ground_Heavy_Vehicle_Factory",
                "Enforcer_Trooper_Company","Enforcer_Trooper_Company","Imperial_Stormtrooper_Company","AT_DP_Company",
                "AT_DP_Company","TIE_Mauler_Company","TIE_Crawler_Company","Nemesis_Gunship_Company","C10_Siege_Tower_Company",
                "VT49_Decimator_Group","VT49_Decimator_Group","VT49_Decimator_Group","Raider_I_Corvette","Raider_I_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Ton_Falk_Escort_Carrier","Victory_II_Frigate","Enforcer_Picket_Cruiser","Procursator_Star_Destroyer"
            },
            ["ERA_6"] = {
                "Empire_Office","Tax_Agency","P_Ground_Barracks","P_Ground_Heavy_Vehicle_Factory",
                "Enforcer_Trooper_Company","Enforcer_Trooper_Company","Imperial_Stormtrooper_Company","AT_DP_Company",
                "AT_DP_Company","TIE_Mauler_Company","TIE_Crawler_Company","Nemesis_Gunship_Company","C10_Siege_Tower_Company",
                "VT49_Decimator_Group","VT49_Decimator_Group","VT49_Decimator_Group","Raider_I_Corvette","Raider_I_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Ton_Falk_Escort_Carrier","Victory_II_Frigate","Enforcer_Picket_Cruiser","Procursator_Star_Destroyer"
            },
            ["ERA_7"] = {
                "Empire_Office","Tax_Agency","P_Ground_Barracks","P_Ground_Heavy_Vehicle_Factory",
                "Enforcer_Trooper_Company","Enforcer_Trooper_Company","Imperial_Stormtrooper_Company","AT_DP_Company",
                "AT_DP_Company","TIE_Mauler_Company","TIE_Crawler_Company","Nemesis_Gunship_Company","C10_Siege_Tower_Company",
                "VT49_Decimator_Group","VT49_Decimator_Group","VT49_Decimator_Group","Raider_I_Corvette","Raider_I_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Ton_Falk_Escort_Carrier","Victory_II_Frigate","Enforcer_Picket_Cruiser","Procursator_Star_Destroyer"
            },
        },
        ["ZSINJ_EMPIRE"] = {
            ["ERA_1"] = {
                "Zsinj_Office","Tax_Agency","Z_Ground_Barracks","Z_Ground_Heavy_Vehicle_Factory",
                "EVO_Trooper_Company","EVO_Trooper_Company","Imperial_Stormtrooper_Company","PX10_Company",
                "Chariot_LAV_Company","Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Tracked_Mobile_Base_Company",
                "YZ_775_Freighter_Group","YZ_775_Freighter_Group","Imperial_CR90","Imperial_CR90","CR92A","CR92A","Surveyor_Frigate","Surveyor_Frigate","Imperial_Nebulon_B","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Victory_II_Star_Destroyer"
            },
            ["ERA_2"] = {
                "Zsinj_Office","Tax_Agency","Z_Ground_Barracks","Z_Ground_Heavy_Vehicle_Factory",
                "EVO_Trooper_Company","EVO_Trooper_Company","Imperial_Stormtrooper_Company","PX10_Company",
                "Chariot_LAV_Company","Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Tracked_Mobile_Base_Company",
                "YZ_775_Freighter_Group","YZ_775_Freighter_Group","Imperial_CR90","Imperial_CR90","CR92A","CR92A","Surveyor_Frigate","Surveyor_Frigate","Imperial_Nebulon_B","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Victory_II_Star_Destroyer"
            },
            ["ERA_3"] = {
                "Zsinj_Office","Tax_Agency","Z_Ground_Barracks","Z_Ground_Heavy_Vehicle_Factory",
                "EVO_Trooper_Company","EVO_Trooper_Company","Imperial_Stormtrooper_Company","PX10_Company",
                "Chariot_LAV_Company","Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Tracked_Mobile_Base_Company",
                "YZ_775_Freighter_Group","YZ_775_Freighter_Group","Imperial_CR90","Imperial_CR90","CR92A","CR92A","Surveyor_Frigate","Surveyor_Frigate","Imperial_Nebulon_B","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Victory_II_Star_Destroyer"
            },
            ["ERA_4"] = {
                "Zsinj_Office","Tax_Agency","Z_Ground_Barracks","Z_Ground_Heavy_Vehicle_Factory",
                "EVO_Trooper_Company","EVO_Trooper_Company","Imperial_Stormtrooper_Company","PX10_Company",
                "Chariot_LAV_Company","Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Tracked_Mobile_Base_Company",
                "YZ_775_Freighter_Group","YZ_775_Freighter_Group","Imperial_CR90","Imperial_CR90","CR92A","CR92A","Surveyor_Frigate","Surveyor_Frigate","Imperial_Nebulon_B","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Victory_II_Star_Destroyer"
            },
            ["ERA_5"] = {
                "Zsinj_Office","Tax_Agency","Z_Ground_Barracks","Z_Ground_Heavy_Vehicle_Factory",
                "EVO_Trooper_Company","EVO_Trooper_Company","Imperial_Stormtrooper_Company","PX10_Company",
                "Chariot_LAV_Company","Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Tracked_Mobile_Base_Company",
                "YZ_775_Freighter_Group","YZ_775_Freighter_Group","Imperial_CR90","Imperial_CR90","CR92A","CR92A","Surveyor_Frigate","Surveyor_Frigate","Imperial_Nebulon_B","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Victory_II_Star_Destroyer"
            },
            ["ERA_6"] = {
                "Zsinj_Office","Tax_Agency","Z_Ground_Barracks","Z_Ground_Heavy_Vehicle_Factory",
                "EVO_Trooper_Company","EVO_Trooper_Company","Imperial_Stormtrooper_Company","PX10_Company",
                "Chariot_LAV_Company","Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Tracked_Mobile_Base_Company",
                "YZ_775_Freighter_Group","YZ_775_Freighter_Group","Imperial_CR90","Imperial_CR90","CR92A","CR92A","Surveyor_Frigate","Surveyor_Frigate","Imperial_Nebulon_B","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Victory_II_Star_Destroyer"
            },
            ["ERA_7"] = {
                "Zsinj_Office","Tax_Agency","Z_Ground_Barracks","Z_Ground_Heavy_Vehicle_Factory",
                "EVO_Trooper_Company","EVO_Trooper_Company","Imperial_Stormtrooper_Company","PX10_Company",
                "Chariot_LAV_Company","Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Tracked_Mobile_Base_Company",
                "YZ_775_Freighter_Group","YZ_775_Freighter_Group","Imperial_CR90","Imperial_CR90","CR92A","CR92A","Surveyor_Frigate","Surveyor_Frigate","Imperial_Nebulon_B","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Victory_II_Star_Destroyer"
            },
        },
        ["CORPORATE_SECTOR"] = {
            ["ERA_1"] = {
                "CSA_Office","Tax_Agency","C_Ground_Barracks","C_Ground_Heavy_Vehicle_Factory",
                "CSA_B1_Droid_Company","CSA_B1_Droid_Company","Espo_Company","Class_I_Company",
                "Espo_Walker_Company","Espo_Walker_Company","Persuader_Company","Strikebreaker_Company","K222_Company",
                "Citadel_Cruiser_Group","Gozanti_Cruiser_Group","Gozanti_Cruiser_Group","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Imperial_Nebulon_B","Imperial_Nebulon_B","DHC_Carrier","Gladiator_I","Recusant_Light_Destroyer","Bulwark_I"
            },
            ["ERA_2"] = {
                "CSA_Office","Tax_Agency","C_Ground_Barracks","C_Ground_Heavy_Vehicle_Factory",
                "CSA_B1_Droid_Company","CSA_B1_Droid_Company","Espo_Company","Class_I_Company",
                "Espo_Walker_Company","Espo_Walker_Company","Persuader_Company","Strikebreaker_Company","K222_Company",
                "Citadel_Cruiser_Group","Gozanti_Cruiser_Group","Gozanti_Cruiser_Group","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Imperial_Nebulon_B","Imperial_Nebulon_B","DHC_Carrier","Gladiator_I","Recusant_Light_Destroyer","Bulwark_I"
            },
            ["ERA_3"] = {
                "CSA_Office","Tax_Agency","C_Ground_Barracks","C_Ground_Heavy_Vehicle_Factory",
                "CSA_B1_Droid_Company","CSA_B1_Droid_Company","Espo_Company","Class_I_Company",
                "Espo_Walker_Company","Espo_Walker_Company","Persuader_Company","Strikebreaker_Company","K222_Company",
                "Citadel_Cruiser_Group","Gozanti_Cruiser_Group","Gozanti_Cruiser_Group","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Imperial_Nebulon_B","Imperial_Nebulon_B","DHC_Carrier","Gladiator_I","Recusant_Light_Destroyer","Bulwark_I"
            },
            ["ERA_4"] = {
                "CSA_Office","Tax_Agency","C_Ground_Barracks","C_Ground_Heavy_Vehicle_Factory",
                "CSA_B1_Droid_Company","CSA_B1_Droid_Company","Espo_Company","Class_I_Company",
                "Espo_Walker_101_Company","Espo_Walker_101_Company","Persuader_Company","Strikebreaker_Company","K222_Company",
                "Citadel_Cruiser_Group","Gozanti_Cruiser_Group","Gozanti_Cruiser_Group","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Imperial_Nebulon_B","Imperial_Nebulon_B","DHC_Carrier","Gladiator_I","Recusant_Light_Destroyer","Bulwark_I"
            },
            ["ERA_5"] = {
                "CSA_Office","Tax_Agency","C_Ground_Barracks","C_Ground_Heavy_Vehicle_Factory",
                "CSA_B1_Droid_Company","CSA_B1_Droid_Company","Espo_Company","Class_I_Company",
                "Espo_Walker_101_Company","Espo_Walker_101_Company","Persuader_Company","Strikebreaker_Company","K222_Company",
                "Citadel_Cruiser_Group","Gozanti_Cruiser_Group","Gozanti_Cruiser_Group","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Imperial_Nebulon_B","Imperial_Nebulon_B","DHC_Carrier","Gladiator_I","Recusant_Light_Destroyer","Bulwark_I"
            },
            ["ERA_6"] = {
                "CSA_Office","Tax_Agency","C_Ground_Barracks","C_Ground_Heavy_Vehicle_Factory",
                "CSA_B1_Droid_Company","CSA_B1_Droid_Company","Espo_Company","Class_I_Company",
                "Espo_Walker_101_Company","Espo_Walker_101_Company","Persuader_Company","Strikebreaker_Company","K222_Company",
                "Citadel_Cruiser_Group","Gozanti_Cruiser_Group","Gozanti_Cruiser_Group","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Imperial_Nebulon_B","Imperial_Nebulon_B","DHC_Carrier","Gladiator_I","Recusant_Light_Destroyer","Bulwark_I"
            },
            ["ERA_7"] = {
                "CSA_Office","Tax_Agency","C_Ground_Barracks","C_Ground_Heavy_Vehicle_Factory",
                "CSA_B1_Droid_Company","CSA_B1_Droid_Company","Espo_Company","Class_I_Company",
                "Espo_Walker_101_Company","Espo_Walker_101_Company","Persuader_Company","Strikebreaker_Company","K222_Company",
                "Citadel_Cruiser_Group","Gozanti_Cruiser_Group","Gozanti_Cruiser_Group","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Imperial_Nebulon_B","Imperial_Nebulon_B","DHC_Carrier","Gladiator_I","Recusant_Light_Destroyer","Bulwark_I"
            },
        },
        ["HAPES_CONSORTIUM"] = {
            ["ERA_1"] = {
                "Hapan_Royal_Office","Tax_Agency","HC_Ground_Barracks","HC_Ground_Heavy_Vehicle_Factory",
                "Hapan_House_Guard_Company","Hapan_House_Guard_Company","HRG_Commando_Company","Water_Dragon_Company",
                "Water_Dragon_Company","Rana_APC_Company","Silanus_Speeder_Company","Fire_Dragon_Company","Vhork_Gunship_Company",
                "Raptor_Gunship_Group","Raptor_Gunship_Group","Raptor_Gunship_Group","Baidam_Corvette","Beta_Cruiser","Flare","Nova_Cruiser","Olanji_Frigate","Magnetar_Cruiser","Battle_Dragon"
            },
            ["ERA_2"] = {
                "Hapan_Royal_Office","Tax_Agency","HC_Ground_Barracks","HC_Ground_Heavy_Vehicle_Factory",
                "Hapan_House_Guard_Company","Hapan_House_Guard_Company","HRG_Commando_Company","Water_Dragon_Company",
                "Water_Dragon_Company","Rana_APC_Company","Silanus_Speeder_Company","Fire_Dragon_Company","Vhork_Gunship_Company",
                "Raptor_Gunship_Group","Baidam_Corvette","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar_Cruiser","Pulsar_Cruiser"
            },
            ["ERA_3"] = {
                "Hapan_Royal_Office","Tax_Agency","HC_Ground_Barracks","HC_Ground_Heavy_Vehicle_Factory",
                "Hapan_House_Guard_Company","Hapan_House_Guard_Company","HRG_Commando_Company","Water_Dragon_Company",
                "Water_Dragon_Company","Rana_APC_Company","Silanus_Speeder_Company","Fire_Dragon_Company","Vhork_Gunship_Company",
                "Raptor_Gunship_Group","Baidam_Corvette","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar_Cruiser","Pulsar_Cruiser"
            },
            ["ERA_4"] = {
                "Hapan_Royal_Office","Tax_Agency","HC_Ground_Barracks","HC_Ground_Heavy_Vehicle_Factory",
                "Hapan_House_Guard_Company","Hapan_House_Guard_Company","HRG_Commando_Company","Water_Dragon_Company",
                "Water_Dragon_Company","Rana_APC_Company","Silanus_Speeder_Company","Fire_Dragon_Company","Vhork_Gunship_Company",
                "Raptor_Gunship_Group","Baidam_Corvette","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar_Cruiser","Pulsar_Cruiser"
            },
            ["ERA_5"] = {
                "Hapan_Royal_Office","Tax_Agency","HC_Ground_Barracks","HC_Ground_Heavy_Vehicle_Factory",
                "Hapan_House_Guard_Company","Hapan_House_Guard_Company","HRG_Commando_Company","Water_Dragon_Company",
                "Water_Dragon_Company","Rana_APC_Company","Silanus_Speeder_Company","Fire_Dragon_Company","Vhork_Gunship_Company",
                "Raptor_Gunship_Group","Baidam_Corvette","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar_Cruiser","Pulsar_Cruiser"
            },
            ["ERA_6"] = {
                "Hapan_Royal_Office","Tax_Agency","HC_Ground_Barracks","HC_Ground_Heavy_Vehicle_Factory",
                "Hapan_House_Guard_Company","Hapan_House_Guard_Company","HRG_Commando_Company","Water_Dragon_Company",
                "Water_Dragon_Company","Rana_APC_Company","Silanus_Speeder_Company","Fire_Dragon_Company","Vhork_Gunship_Company",
                "Raptor_Gunship_Group","Baidam_Corvette","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar_Cruiser","Pulsar_Cruiser"
            },
            ["ERA_7"] = {
                "Hapan_Royal_Office","Tax_Agency","HC_Ground_Barracks","HC_Ground_Heavy_Vehicle_Factory",
                "Hapan_House_Guard_Company","Hapan_House_Guard_Company","HRG_Commando_Company","Water_Dragon_Company",
                "Water_Dragon_Company","Rana_APC_Company","Silanus_Speeder_Company","Fire_Dragon_Company","Vhork_Gunship_Company",
                "Raptor_Gunship_Group","Baidam_Corvette","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar_Cruiser","Pulsar_Cruiser"
            },
        },
        ["EMPIREOFTHEHAND"] = {
            ["ERA_1"] = {
                "EOTH_Office","Tax_Agency","EOTH_Ground_Barracks","EOTH_Ground_Light_Vehicle_Factory",
                "EotH_Phalanx_Trooper_Company","EotH_Phalanx_Trooper_Company","EPOAA_Company","EPOAA_Company",
                "EotH_AirStraeker_Company","VPOAV_Company","KPO_Company","V2PO_Transport_Company",
                "Muqaraea_Corvette","Muqaraea_Corvette","Kuuro_Gunship","Kuuro_Gunship","Krini_Corvette","Krini_Corvette","Fruoro_Picket_Ship","Ormos_Carrier","Rohkea_Frigate","Kynigos_Cruiser","Kynigos_Cruiser","Chaf_Destroyer"
            },
            ["ERA_2"] = {
                "EOTH_Office","Tax_Agency","EOTH_Ground_Barracks","EOTH_Ground_Light_Vehicle_Factory",
                "EotH_Phalanx_Trooper_Company","EotH_Phalanx_Trooper_Company","EPOAA_Company","EPOAA_Company",
                "EotH_AirStraeker_Company","VPOAV_Company","KPO_Company","V2PO_Transport_Company",
                "Muqaraea_Corvette","Muqaraea_Corvette","Kuuro_Gunship","Kuuro_Gunship","Krini_Corvette","Krini_Corvette","Fruoro_Picket_Ship","Ormos_Carrier","Rohkea_Frigate","Kynigos_Cruiser","Kynigos_Cruiser","Chaf_Destroyer"
            },
            ["ERA_3"] = {
                "EOTH_Office","Tax_Agency","EOTH_Ground_Barracks","EOTH_Ground_Light_Vehicle_Factory",
                "EotH_Phalanx_Trooper_Company","EotH_Phalanx_Trooper_Company","EPOAA_Company","EPOAA_Company",
                "EotH_AirStraeker_Company","VPOAV_Company","KPO_Company","V2PO_Transport_Company",
                "Muqaraea_Corvette","Muqaraea_Corvette","Kuuro_Gunship","Kuuro_Gunship","Krini_Corvette","Krini_Corvette","Fruoro_Picket_Ship","Ormos_Carrier","Rohkea_Frigate","Kynigos_Cruiser","Kynigos_Cruiser","Chaf_Destroyer"
            },
            ["ERA_4"] = {
                "EOTH_Office","Tax_Agency","EOTH_Ground_Barracks","EOTH_Ground_Light_Vehicle_Factory",
                "EotH_Phalanx_Trooper_Company","EotH_Phalanx_Trooper_Company","EPOAA_Company","EPOAA_Company",
                "EotH_AirStraeker_Company","VPOAV_Company","KPO_Company","V2PO_Transport_Company",
                "Muqaraea_Corvette","Muqaraea_Corvette","Kuuro_Gunship","Kuuro_Gunship","Krini_Corvette","Krini_Corvette","Fruoro_Picket_Ship","Ormos_Carrier","Rohkea_Frigate","Kynigos_Cruiser","Kynigos_Cruiser","Chaf_Destroyer"
            },
            ["ERA_5"] = {
                "EOTH_Office","Tax_Agency","EOTH_Ground_Barracks","EOTH_Ground_Light_Vehicle_Factory",
                "EotH_Phalanx_Trooper_Company","EotH_Phalanx_Trooper_Company","EPOAA_Company","EPOAA_Company",
                "EotH_AirStraeker_Company","VPOAV_Company","KPO_Company","V2PO_Transport_Company",
                "Muqaraea_Corvette","Muqaraea_Corvette","Kuuro_Gunship","Kuuro_Gunship","Krini_Corvette","Krini_Corvette","Fruoro_Picket_Ship","Ormos_Carrier","Rohkea_Frigate","Kynigos_Cruiser","Kynigos_Cruiser","Chaf_Destroyer"
            },
            ["ERA_6"] = {
                "EOTH_Office","Tax_Agency","EOTH_Ground_Barracks","EOTH_Ground_Light_Vehicle_Factory",
                "EotH_Phalanx_Trooper_Company","EotH_Phalanx_Trooper_Company","EPOAA_Company","EPOAA_Company",
                "EotH_AirStraeker_Company","VPOAV_Company","KPO_Company","V2PO_Transport_Company",
                "Muqaraea_Corvette","Muqaraea_Corvette","Kuuro_Gunship","Kuuro_Gunship","Krini_Corvette","Krini_Corvette","Fruoro_Picket_Ship","Ormos_Carrier","Rohkea_Frigate","Kynigos_Cruiser","Kynigos_Cruiser","Chaf_Destroyer"
            },
            ["ERA_7"] = {
                "EOTH_Office","Tax_Agency","EOTH_Ground_Barracks","EOTH_Ground_Light_Vehicle_Factory",
                "EotH_Phalanx_Trooper_Company","EotH_Phalanx_Trooper_Company","EPOAA_Company","EPOAA_Company",
                "EotH_AirStraeker_Company","VPOAV_Company","KPO_Company","V2PO_Transport_Company",
                "Muqaraea_Corvette","Muqaraea_Corvette","Kuuro_Gunship","Kuuro_Gunship","Krini_Corvette","Krini_Corvette","Fruoro_Picket_Ship","Ormos_Carrier","Rohkea_Frigate","Kynigos_Cruiser","Kynigos_Cruiser","Chaf_Destroyer"
            },
        },
        ["IMPERIAL_PROTEUS"] = {
            ["ERA_1"] = {
                "Imperial_Proteus_Office","Tax_Agency","I_Ground_Barracks","I_Ground_Light_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","IPV1","IPV1","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_2"] = {
                "Imperial_Proteus_Office","Tax_Agency","I_Ground_Barracks","I_Ground_Light_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","IPV1","IPV1","Lancer_Frigate","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_3"] = {
                "Imperial_Proteus_Office","Tax_Agency","I_Ground_Barracks","I_Ground_Light_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","IPV1","Star_Galleon","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_4"] = {
                "Imperial_Proteus_Office","Tax_Agency","I_Ground_Barracks","I_Ground_Light_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Compforce_Assault_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_A_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_AT_AT_Walker_Company","XR85_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","IPV1","IPV1","Hunter_Killer_Probot","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","MTC_Sensor","Victory_I_Star_Destroyer"
            },
            ["ERA_5"] = {
                "Imperial_Proteus_Office","Tax_Agency","I_Ground_Barracks","I_Ground_Light_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_A_Company","Chariot_LAV_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Delta_JV7_Group","IPV1","IPV1","Lancer_Frigate","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_6"] = {
                "Imperial_Proteus_Office","Tax_Agency","I_Ground_Barracks","I_Ground_Light_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_A_Company","Imperial_Dwarf_Spider_Droid_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","Crusader_Gunship","Patrol_Nebulon_B","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
            ["ERA_7"] = {
                "Imperial_Proteus_Office","Tax_Agency","I_Ground_Barracks","I_Ground_Light_Vehicle_Factory",
                "Imperial_Army_Trooper_Company","Imperial_Army_Trooper_Company","Imperial_Stormtrooper_Company","AT_ST_Company",
                "AT_ST_A_Company","Imperial_Dwarf_Spider_Droid_Company","S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Walker_Company",
                "Beta_ETR_3_Group","Beta_ETR_3_Group","Crusader_Gunship","Patrol_Nebulon_B","Carrack_Cruiser","Ton_Falk_Escort_Carrier","Imperial_DHC","Strike_Cruiser","Acclamator_II","Victory_I_Star_Destroyer"
            },
        },
    }
}

return GameConstants
