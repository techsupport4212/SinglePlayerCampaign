function DefineRosterOverride(planet)
	planetTable = {
		ALTIRIA_ANARRIS = "GENERIC_UR",
		ARDIS = "GENERIC_UR",
		ARIZED = "GENERIC_UR",
		BRACCIO = "GENERIC_UR",
		CARRIVAR = "GENERIC_UR",
		CRAKULL = "GENERIC_UR",
		DURACE = "GENERIC_UR",
		EXPLUME_MINOR = "GENERIC_UR",
		FAR_CRADLE = "GENERIC_UR",
		GEROON = "GENERIC_UR",
		GIACA = "GENERIC_UR",
		GUNNINGA = "GENERIC_UR",
		HOXIM = "GENERIC_UR",
		IMPOSSIBLE_SECTOR = "GENERIC_UR",
		IOL = "GENERIC_UR",
		IRKALLA = "GENERIC_UR",
		KARIEK = "GENERIC_UR",
		KILJI = "GENERIC_UR",
		KODAS_WORLD = "GENERIC_UR",
		KORMAN_LAO = "GENERIC_UR",
		KRO_VAR = "GENERIC_UR",
		LAKRA = "GENERIC_UR",
		LIOAN = "GENERIC_UR",
		MORCANTH = "GENERIC_UR",
		MUGG_FALLOW = "GENERIC_UR",
		MUNLALI_MAFIR = "GENERIC_UR",
		NIHIL = "GENERIC_UR",
		NIORDE = "GENERIC_UR",
		OBUS = "GENERIC_UR",
		OREEN = "GENERIC_UR",
		OSSERITON = "GENERIC_UR",
		PERANN_NEBULA = "GENERIC_UR",
		PEROENIA = "GENERIC_UR",
		PLEKNOK = "GENERIC_UR",
		PRIMEA = "GENERIC_UR",
		QUETHOLD = "GENERIC_UR",
		RENNEK = "GENERIC_UR",
		RHAND = "GENERIC_UR",
		SHIKITARI = "GENERIC_UR",
		SHOR = "GENERIC_UR",
		SRAATO = "GENERIC_UR",
		STRATOS = "GENERIC_UR",
		SUNRISE = "GENERIC_UR",
		TANTSOR = "GENERIC_UR",
		TERMINUS = "GENERIC_UR", --Not actually UR, but known for weird stuff passing through
		TCHUUKTHAI = "GENERIC_UR",
		TWILIGHT_VOID = "GENERIC_UR",
		UMARENK = "GENERIC_UR",
		UR41284 = "GENERIC_UR",
		UR6572AK = "GENERIC_UR",
		URCH = "GENERIC_UR",
		VAGAR_PRAXUT = "GENERIC_UR",
		VIIS = "GENERIC_UR",
		VOLIK = "GENERIC_UR",
		VONDORU = "GENERIC_UR",
		VUNHANNA = "GENERIC_UR",
		YASHUVHU = "GENERIC_UR",
		ZAKUUL = "GENERIC_UR",
		ZOSHA = "GENERIC_UR",
		ZYZEK = "GENERIC_UR",
		LIZIL = "GENERIC_UR", --Hereafter be Killiks
		MURGO = "GENERIC_UR",
		QORIBU = "GENERIC_UR",
		SARM = "GENERIC_UR",
		SNEVU = "GENERIC_UR",
		TENUPE = "GENERIC_UR",
		TUSKENS_EYE = "GENERIC_UR",
		UTEGETU_NEBULA = "GENERIC_UR",
		WOTEBA = "GENERIC_UR",
		YOGGOY = "GENERIC_UR",
		ALEEN = "RAKATAN_REMNANTS",
		ALZOC = "RAKATAN_REMNANTS",
		BORGO_PRIME = "RAKATAN_REMNANTS",
		GENERIS = "RAKATAN_REMNANTS",
		GRIWSTRICK = "RAKATAN_REMNANTS",
		HONOGHR = "RAKATAN_REMNANTS",
		KAAL = "RAKATAN_REMNANTS",
		MAKATAK = "RAKATAN_REMNANTS",
		MALATA = "RAKATAN_REMNANTS",
		MARIDUN = "RAKATAN_REMNANTS",
		PERSAPPA = "RAKATAN_REMNANTS",
		NIRAUAN = "RAKATAN_REMNANTS",
		RAKATA = "RAKATAN_REMNANTS",
		SEYLOTT = "RAKATAN_REMNANTS",
		TULPAA = "RAKATAN_REMNANTS",
		--VAGAR_PRAXUT = "RAKATAN_REMNANTS", Vagaari should use UR general set
		XO = "RAKATAN_REMNANTS",
		SULLUST = "SULLUSTAN_HOME_GUARD",
		BAKURA = "BAKURANS",
		BALMORRA = "BALMORRANS",
		BYBLOS = "SIENAR",
		CORULAG = "SIENAR",
		LIANNA = "SIENAR",
		GYNDINE = "KDY",
		JAEMUS = "KDY",
		KUAT = "KDY",
		XA_FEL = "KDY",
		RZ7 = "HARDLINERS",
		HYPORI = "ZANN_CONSORTIUM",
		SALEUCAMI = "ZANN_CONSORTIUM",
		FELUCIA = "ZANN_CONSORTIUM",
		RYLOTH = "ZANN_CONSORTIUM",
		MINNTOOINE = "MONCAL",
		MON_CALAMARI = "MONCAL",
		PAMMANT = "MONCAL",
		TARAL_V = "MONCAL",
		NEW_HEURKEA = "MONCAL",
		NEW_COV = "YUTRANE",
		CHARDAAN = "YUTRANE",
		KALARBA = "YUTRANE",
		CHARUBAH = "HAPES_ROYAL",
		HAPES = "HAPES_ROYAL",
		GALLINORE = "HAPES_CONSORTIUM",
		RELEPHON = "HAPES_CONSORTIUM",
		ROQOO = "HAPES_CONSORTIUM",
		SHEDU_MAAD = "HAPES_CONSORTIUM",
		TEREPHON = "HAPES_CONSORTIUM",
		TRANSITORY_MISTS_I = "HAPES_CONSORTIUM",
		TRANSITORY_MISTS_II = "HAPES_CONSORTIUM",
		TRANSITORY_MISTS_III = "HAPES_CONSORTIUM",
		MUSTAFAR = "X1_FORCES",
		TURAK = "HELLS_HAMMERS",	
		BRINTOOIN = "HELLS_HAMMERS",		
		KATANA_SPACE = "LOST_DREADNAUGHTS",
		TRIAN = "TRIANII",
		COLLA = "COLICOID",
		NETTEHI = "PAATAATUS",
		RAPACC = "PACC",
		STIVIC = "GARWIAN",
		SOLITAIR = "GARWIAN",
	}
	return planetTable[planet]
end

function DefineUnitTable(faction, rosterOverride)
	if not (faction == "WARLORDS" or faction == "INDEPENDENT_FORCES" or faction == "SECTOR_FORCES") and rosterOverride == "ZANN_CONSORTIUM" then
		rosterOverride = nil
	end

	if faction ~= "INDEPENDENT_FORCES" and rosterOverride == "RAKATAN_REMNANTS" then
		rosterOverride = nil
	end

	if faction == "REBEL" and rosterOverride == "KDY" then
		rosterOverride = "KDY_NR"
	end

	if faction == "EMPIREOFTHEHAND" and rosterOverride == "GENERIC_UR" then
		rosterOverride = nil
	end

	
	local Roster_Table = {
		DEBUG = true,
		EMPIRE = true,
		REBEL = true,
		HAPES_CONSORTIUM = true,
		EMPIREOFTHEHAND = true,
		CHISS = true,
		ERIADU_AUTHORITY = true,
		PENTASTAR = true,
		ZSINJ_EMPIRE = true,
		GREATER_MALDROOD = true,
		CORPORATE_SECTOR = true,
		HUTT_CARTELS = true,
		SSIRUUVI_IMPERIUM = true,
		YEVETHA = true,
		CORELLIA = true,
		IMPERIAL_PROTEUS = true,
		MANDALORIANS = true,
		WARLORDS = true,
		SECTOR_FORCES = true,
		INDEPENDENT_FORCES = true,
		GENERIC_UR = true,
		BAKURANS = true,
		BALMORRANS = true,
		RAKATAN_REMNANTS = true,
		SULLUSTAN_HOME_GUARD = true,
		SIENAR = true,
		KDY = true,
		KDY_NR = true,
		HARDLINERS = true,
		ZANN_CONSORTIUM = true,
		MONCAL = true,
		YUTRANE = true,
		HELLS_HAMMERS = true,
		X1_FORCES = true,
		LOST_DREADNAUGHTS = true,
		COLICOID = true,
		TRIANII = true,
		DARK_EMPIRE = true,
		PAATAATUS = true,
		PACC = true,
		GARWIAN = true,
	}
	local factionData = nil
	local returnValue = {} --Cannot write overrides directly to faction data or they will edit the cache of that file and affect all future worlds for that faction
	
	local override = nil
	if Roster_Table[faction] then
		factionData = require("spawn-sets/" .. faction)
	else
		factionData = require("spawn-sets/" .. "INDEPENDENT_FORCES")
		faction = "INDEPENDENT_FORCES"
	end
	if rosterOverride ~= nil and Roster_Table[rosterOverride] then
		override = require("spawn-sets/" .. rosterOverride)
	end

	if override ~= nil and rosterOverride ~= faction then
		if override.Space_Unit_Table ~= nil then
			returnValue.Space_Unit_Table = override.Space_Unit_Table
		else
			returnValue.Space_Unit_Table = factionData.Space_Unit_Table
		end
		if override.Land_Unit_Table ~= nil then
			returnValue.Land_Unit_Table = override.Land_Unit_Table
		else
			returnValue.Land_Unit_Table = factionData.Land_Unit_Table
		end
		if faction == "INDEPENDENT_FORCES" or faction == "WARLORDS" or faction == "SECTOR_FORCES" then
			for category, values in pairs(factionData) do
				if category ~= "Land_Unit_Table" and category ~= "Space_Unit_Table" then
					if override[category] ~= nil then
						returnValue[category] = override[category]
					else
						returnValue[category] = factionData[category]
					end
				end
			end
		else
			for category, values in pairs(factionData) do
				if category ~= "Land_Unit_Table" and category ~= "Space_Unit_Table" then
					returnValue[category] = factionData[category]
				end
			end
		end
	else
		for category, values in pairs(factionData) do
			returnValue[category] = factionData[category]
		end
	end
	
	if faction == "INDEPENDENT_FORCES" then
		IF_Govs = {"Revolt_Scavenger_Base","Revolt_Security_HQ","Revolt_Corporate_HQ","Revolt_Local_HQ_Urban","Revolt_Local_HQ_Rural","Revolt_PDF_HQ_Urban","Revolt_PDF_HQ_Rural","Revolt_PDF_HQ"}
		returnValue.Government_Building = IF_Govs[GameRandom.Free_Random(1, table.getn(IF_Govs))]
	end
	if faction == "HAPES_CONSORTIUM" then
		local hapan_house = {"Hapan_Royal_Office", "Hapan_Requud_Office", "Hapan_Galney_Office", "Hapan_Maluri_Office"}
		local hapan_yard = {"Hapan_Shipyard_Royal", "Hapan_Shipyard_Requud", "Hapan_Shipyard_Galney", "Hapan_Shipyard_Maluri"}
		local hapan_inf = {"Hapan_House_Guard_Company", "Requud_House_Guard_Company", "Galney_House_Guard_Company", "Maluri_House_Guard_Company"}
		local hapan_gov = 1
		
		if rosterOverride == "HAPES_ROYAL" then
			hapan_gov = 1
		else
			hapan_gov = GameRandom.Free_Random(1, table.getn(hapan_house))
		end
		returnValue.Government_Building = hapan_house[hapan_gov]
		returnValue.Land_Unit_Table[1][1] = hapan_inf[hapan_gov]
		returnValue.Shipyard_Table[1] = hapan_yard[hapan_gov]
		returnValue.Shipyard_Table[2] = hapan_yard[hapan_gov]
		returnValue.Shipyard_Table[3] = hapan_yard[hapan_gov]
		returnValue.Shipyard_Table[4] = hapan_yard[hapan_gov]
	end
	return returnValue
end