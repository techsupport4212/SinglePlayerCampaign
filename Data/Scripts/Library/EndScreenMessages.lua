--INSTRUCTIONS FOR ADDING CUSTOM GC END STRINGS:
--Table EndScreenMessages is nested in order Storyline > Human Player > Ending.

--//Storyline// is a GlobalValue. If nil, DEFAULT_STORY is used. It can be set or reset freely anywhere a GlobalValue can be modifed, but generally if
--you want a GC not to use DEFAULT_STORY, you should set it to the desired value in the GC Player Agnostic script in the "Begin_GC" function. For instance,
--all historicals use GlobalValue.Set("STORYLINE","LIMITED_SCOPE") unless they use their own bespoke storyline.

--//Human Player// accepts aliases such as "IMPERIAL" and can also be modified by the function Get_End_Message_Faction_Key to cause certain in-game
--actions to override the human player's faction to something different, such as turning FOTR Hutt Cartels into Shadow Collective or TR Zsinj Empire into
--Zann Empire. If there are multiple ending groups within a storyline that the human faction qualifies for, priority goes:
--    Override > Faction True Name > Faction Alias
--For example, if a TR storyline had endings for ZSINJ_EMPIRE, ZANN_EMPIRE, and IMPERIAL, a player who wins the GC as the brown warlord faction with Zsinj
--dead, Zann alive, and no Legitimacy regime leader alive will get a ZANN_EMPIRE ending.

--//Ending// is also a GlobalValue. If nil, there are 2 options: DEFAULT_WIN when the human player is the last player to take a planet, DEFAULT_LOSE when
--an AI player is the last player to take a planet and there is not an Ending defined for that AI player for that Human Player in that Storyline.
--Buildable victory objects such as Shipyard_Victory_Object and Treaty_Victory_Object have Ending values set by the victory handler plugin, but you can set
--or reset Ending whenever a GlobalValue can be modified. Endings named for factions that are not the Human Player are used when the human loses and the
--named faction is the last player to take a planet. The Ending parameter supports aliases (such as "IMPERIAL") in the same manner as the Human Player
--parameter. For instance, in storyline "CAAMAS_CRISIS," Human Player "REBEL" has unique endings for defeat at the hands of the Empire and the EOTH.

--Mod-specific events that can change ending strings are defined in functions Get_End_Message_Faction_Key and Replace_End_Message_Placeholders.
--Placeholdeer strings can be used to dynamically fill in certain variables - all mods support the following placeholder strings:
--    Human Player Name
--    Last Lose Player Name
--    Last Gain Player Name
--The specific length of the placeholder string used for these variables depends on the mod. The length of the placeholder string is equal to the longest
--string that can be substituted in its place. This is necessary because the endings are strictly limited to 217 characters (excluding any control or
--escape characters; special characters like line breaks denoted by "\n" are counted as a single character).

--Determining what default will be selected for each of the three parameters can be difficult. The code is in function Galactic_Conquest_End_Message.
--An example of complex inheritance leveraging default values can be seen in TR Storyline "OPERATION_SHADOW_HAND." There is no ending defined for a human
--player Rebel who is defeated by Palpatine or one of the warlord factions. If none of the endings defined for this storyline for this player are
--triggered, the endings will be drawn from the DEFAULT_STORY storyline for a Rebel human player, which has a specific ending for defeat at the hands of
--Palpatine and an alias ending for defeat at the hands of an Imperial faction not otherwise specified.

require("eawx-util/StringUtil")

--This changes a faction's key used to look up values in EndScreenMessages.
function Get_End_Message_Faction_Key(faction_name,storyline)
	if not faction_name then
		return faction_name, nil
	end

	local FactionAliases = {
		EMPIRE = "IMPERIAL",
		PENTASTAR = "IMPERIAL",
		GREATER_MALDROOD = "IMPERIAL",
		ZSINJ_EMPIRE = "IMPERIAL",
		ERIADU_AUTHORITY = "IMPERIAL",
		IMPERIAL_PROTEUS = "IMPERIAL",
	}
	local alias = FactionAliases[faction_name]

	local p_faction = Find_Player(faction_name)

	--Imperial regime handler
	--Only some Imperial regimes have unique ending strings.
	local RegimeHost = GlobalValue.Get("IMPERIAL_REGIME_HOST")

	if faction_name == RegimeHost or faction_name == "EMPIRE" then
		local RegimeLeaders = { --for some reason this gets read backwards while PotentialEmperorList is not
			{{"THRAWN_CHIMAERA"},"EMPIRE_THRAWN"},
			{{"SEDRISS"},"OSH_SEDRISS"},
			{{"LUKE_SKYWALKER_DARKSIDE"},"OSH_SKYWALKER"},
			{{"EMPEROR_PALPATINE"},"DARK_EMPIRE"},
		}

		for _,outervalue in ipairs(RegimeLeaders) do
			for _,innervalue in pairs(outervalue[1]) do
				local obj = Find_First_Object(innervalue)
				if obj then
					if obj.Get_Owner() == p_faction and TestValid(obj.Get_Planet_Location()) == true then
						faction_name = outervalue[2]
						break
					end
				end
			end
		end
	end

	--Zsinj's Empire: if Zsinj dies and his faction does not have a regime leader, Zann takes over
	if faction_name == "ZSINJ_EMPIRE" then
		if not Find_First_Object("ZSINJ_IRON_FIST_VSD") and not Find_First_Object("ZSINJ_IRON_FIST_EXECUTOR") then
			local TyberObject = Find_First_Object("Tyber_Zann2")
			if not TyberObject then
				TyberObject = Find_First_Object("Tyber_Zann")
			end
			if TyberObject then
				if TyberObject.Get_Owner() == p_faction and TestValid(TyberObject.Get_Planet_Location()) == true then
					faction_name = "ZANN_EMPIRE"
				end
			end
		end
	end

	return faction_name, alias
end

--This changes a faction's displayed name string without changing its key value for EndScreenMessages.
--This is best used for:
--    A) cosmetic renames
--    B) cases where a faction slot is used to represent something else.
function Set_Cosmetic_Names(FactionEndStrings,storyline)
--Hutt Empire handler
	local hutt_empire = GlobalValue.Get("HUTT_EMPIRE")
	if hutt_empire then
		FactionEndStrings["HUTT_CARTELS"] = "the Hutt Empire"
	end

--Imperial Proteus handler
	local proteus_current_display_name = GlobalValue.Get("PROTEUS_CURRENT_DISPLAY_NAME")
	if proteus_current_display_name ~= nil then
		FactionEndStrings["IMPERIAL_PROTEUS"] = proteus_current_display_name
	end

--Imperial regime handler
	local regime_index = GlobalValue.Get("REGIME_INDEX")

	if regime_index == 2 and Find_First_Object("HISSA_MOFFSHIP") then
		regime_index = 22
	elseif regime_index == 3 and not Find_First_Object("THRAWN_CHIMAERA") then
		regime_index = 0
	elseif regime_index == 7 and not Find_First_Object("PELLAEON_CHIMAERA_GRAND") and not Find_First_Object("PELLAEON_REAPER") and not Find_First_Object("PELLAEON_MEGADOR") then
		regime_index = 8
	end

	local regime_cosmetic_names = {
		[1]  = "Pestage's Empire",
		[2]  = "Isard's Empire",
		[22] = "the Central Committee",
		[3]  = "Thrawn's Empire",
		[4]  = "the Dark Empire",
		[5]  = "the Crimson Empire",
		[6]  = "Daala's Empire",
		[7]  = "Pellaeon's Empire",
		[8]  = "the Moff Council",
	}

	local RegimeHost = GlobalValue.Get("IMPERIAL_REGIME_HOST")

	if RegimeHost ~= "EMPIRE" and regime_index == 8 then
		--this space intentionally left blank
	elseif regime_index ~= 0 then
		FactionEndStrings[RegimeHost] = regime_cosmetic_names[regime_index]
	end

--Deep Core Conflict GC handler
	if storyline == "DEEP_CORE_CONFLICT" then
		FactionEndStrings["EMPIRE"] = "Zero Command"
		FactionEndStrings["GREATER_MALDROOD"] = "Kosh's Empire"
--Lambda Sector GC handler
	elseif storyline == "LAMBDA_SECTOR" then
		FactionEndStrings["EMPIRE"] = "Imperial Naboo"
		FactionEndStrings["ZSINJ_EMPIRE"] = "Imperial Kamino"
		FactionEndStrings["GREATER_MALDROOD"] = "the Protectorate"
	end

--Maldrood handler for start year 9 ABY and later
--NB: "Teradoc Union" takes precedence over "Kosh's Empire" in Deep Core Conflict eras 4+
	if GlobalValue.Get("GC_START_YEAR") >= 9 then
		FactionEndStrings["GREATER_MALDROOD"] = "the Teradoc Union"
	end

	return FactionEndStrings
end

function Replace_End_Message_Placeholders(end_screen_message,storyline)
	local FactionEndStrings = {
		EMPIRE           = "the Ruling Council", --default
		PENTASTAR        = "the Alignment",
		GREATER_MALDROOD = "the Greater Maldrood",
		ZSINJ_EMPIRE     = "Zsinj's Empire",
		ERIADU_AUTHORITY = "the Eriadu Authority",
		IMPERIAL_PROTEUS = "REPORT_THIS_PROTEUS_BUG_C", --should never be seen in game

		REBEL            = "the New Republic",
		EMPIREOFTHEHAND  = "the Hand",
		CORPORATE_SECTOR = "the Corporate Sector",
		HUTT_CARTELS     = "the Hutt Cartels",
		HAPES_CONSORTIUM = "the Hapans",

		HOLDOUTS		= "the Holdouts",

		EMPIRE_THRAWN    = "Thrawn's Empire",
		DARK_EMPIRE      = "the Dark Empire",
		OSH_SKYWALKER    = "Skywalker's Empire",
		OSH_SEDRISS      = "the Dark Empire",
		ZANN_EMPIRE      = "Zann's Empire",
	}

	FactionEndStrings = Set_Cosmetic_Names(FactionEndStrings,storyline)

	local faction_human = Get_End_Message_Faction_Key(Find_Player("local").Get_Faction_Name(),storyline)
	local faction_name
	local faction_string

	if string.find(end_screen_message,"HUMAN_PLAYER_NAME_PLA") then
		faction_name = Get_End_Message_Faction_Key(faction_human,storyline)
		faction_string = FactionEndStrings[faction_name]
		end_screen_message = string.gsub(end_screen_message,"HUMAN_PLAYER_NAME_PLA",faction_string)
	end

	if string.find(end_screen_message,"LAST_LOSE_PLAYER_NAME") then
		local last_lose_player_name = GlobalValue.Get("LAST_LOSE_PLAYER_NAME")

		faction_name = Get_End_Message_Faction_Key(last_lose_player_name,storyline)
		if faction_name == nil or FactionEndStrings[faction_name] == nil or faction_name == faction_human then
			faction_string = "the enemy"
		else
			faction_string = FactionEndStrings[faction_name]
		end
		end_screen_message = string.gsub(end_screen_message,"LAST_LOSE_PLAYER_NAME",faction_string)
	end

	local last_gain_player_name = GlobalValue.Get("LAST_GAIN_PLAYER_NAME")
	local last_gain_player = Find_Player("local")
	if last_gain_player_name ~= nil then
		last_gain_player = Find_Player(last_gain_player_name)
	end

	if string.find(end_screen_message,"LAST_GAIN_PLAYER_NAME") then
		faction_name = Get_End_Message_Faction_Key(last_gain_player_name,storyline)
		if faction_name == nil or FactionEndStrings[faction_name] == nil then
			faction_string = "the enemy"
		else
			faction_string = FactionEndStrings[faction_name]
		end
		end_screen_message = string.gsub(end_screen_message,"LAST_GAIN_PLAYER_NAME",faction_string)
	end

	local new_emperor_name = nil

	if string.find(end_screen_message,"NEW_EMPEROR_PLACEHOL") then
		local PotentialEmperorList = {
			--Legitimacy regime leaders
			{{"EMPEROR_PALPATINE"},"the Reborn Emperor"},
			{{"CARNOR_JAX"},"Emperor Jax"},
			{{"DAALA_GORGON","DAALA_KNIGHT_HAMMER"},"Empress Daala"},
			{{"PELLAEON_CHIMAERA_GRAND","PELLAEON_REAPER","PELLAEON_MEGADOR"},"Emperor Pellaeon"},

			--playable imperial faction leaders (including independent Green leaders)
			{{"SATE_PESTAGE"},"Emperor Pestage"},
			{{"YSANNE_ISARD","ISARD_LUSANKYA"},"Empress Isard"},
			{{"TRIOCULUS"},"Emperor Trioculus"},
			{{"HISSA_MOFFSHIP"},"Emperor Hissa"},
			{{"THRAWN_CHIMAERA"},"Emperor Thrawn"},
			{{"DELVARDUS_THALASSA","DELVARDUS_BRILLIANT","DELVARDUS_NIGHT_HAMMER"},"Emperor Delvardus"},
			{{"KOSH_LANCET"},"Emperor Teradoc"},
			{{"TREUTEN_13X","TREUTEN_CRIMSON_SUNRISE"},"Emperor Teradoc"},
			{{"ARDUS_KAINE","KAINE_REAPER"},"Emperor Kaine"},
			{{"ZSINJ_IRON_FIST_VSD","ZSINJ_IRON_FIST_EXECUTOR"},"Emperor Zsinj"},

			--Operation Shadow Hand historical only
			{{"LUKE_SKYWALKER_DARKSIDE"},"Emperor Skywalker","OPERATION_SHADOW_HAND"},
			{{"SEDRISS"},"Executor Sedriss","OPERATION_SHADOW_HAND"},

			--Deep Core Conflict regional only
			{{"HARRSK_WHIRLWIND","HARRSK_SHOCKWAVE"},"Grand Admiral Harrsk","DEEP_CORE_CONFLICT"},

			--Lambda Sector regional only
			{{"LANKIN_KNIGHT"},"Moff Lankin","LAMBDA_SECTOR"},
			{{"SERDIF_TOUNT_JUGGERNAUT"},"Governor Tount","LAMBDA_SECTOR"},
		}

		local proteus_group = GlobalValue.Get("PROTEUS_GROUP_NAME")
		if proteus_group then
			local warlordlist = require("ProteusWarlordLibrary")
			local leadertable = warlordlist[proteus_group].LeaderTable
			local leaderendingnames = warlordlist[proteus_group].LeaderEndingNames
			for i,unit_name in pairs(leadertable) do
				table.insert(PotentialEmperorList,{{unit_name},leaderendingnames[i]})
			end
		end

		local PotentialEmperorList2 = {
			--playable imperial faction major heroes
			{{"JEREC"},"Emperor Jerec"},
			{{"TYBER_ZANN","TYBER_ZANN2"},"a puppet Emperor"},
			{{"SCREED_DEMOLISHER"},"Emperor Screed"},

			--legitimacy SSDs and warlords, nonplayable faction leaders
			{{"GRUNGER_AGGRESSOR"},"Emperor Grunger"},
			{{"X1_EXECUTOR"},"High Emperor X1"},
			{{"BALAN_JAVELIN"},"Emperor Balan"},
			{{"DROMMEL_GUARDIAN"},"Emperor Drommel"},
			{{"GRONN_ACULEUS"},"Emperor Gronn"},
			{{"THORN_ASSERTOR"},"Emperor Thorn"},
			{{"KIEZ_WHELM"},"Emperor Kiez"},
			{{"COMEG_BELLATOR"},"Empress Comeg"},
			{{"DAALA_SCYLLA"},"Empress Daala"}, --Daala Round 2 goes before minor warlords
			{{"KRENNEL_WARLORD"},"Emperor Krennel"},

			--misc SSDs
			{{"ROGRISS_DOMINION"},"Emperor Rogriss"},
			{{"CRONUS_NIGHT_HAMMER"},"Emperor Cronus"},
			{{"RASLAN_RAZORS_KISS"},"Emperor Raslan"},
			{{"SYSCO_VENGEANCE"},"Emperor Sysco"},

			--highest ranking Green heroes in Interregnum
			{{"MAKATI_STEADFAST"},"Emperor Makati"},
			{{"TAKEL_MAGICDRAGON"},"Emperor Takel"},
		}

		for _,entry in pairs(PotentialEmperorList2) do
			table.insert(PotentialEmperorList,entry)
		end

		for _,outervalue in ipairs(PotentialEmperorList) do
			for _,innervalue in pairs(outervalue[1]) do
				local obj = Find_First_Object(innervalue)
				if obj then
					if obj.Get_Owner() == last_gain_player and TestValid(obj.Get_Planet_Location()) == true and (outervalue[3] == nil or outervalue[3] == storyline) then
						if new_emperor_name == "Emperor Teradoc" and outervalue[2] == "Emperor Teradoc" then
							new_emperor_name = "the Emperors Teradoc"
							break
						elseif new_emperor_name == nil then
							new_emperor_name = outervalue[2]
							if new_emperor_name ~= "Emperor Teradoc" then
								break
							end
						end
					end
				end
			end
		end

		if new_emperor_name == nil then
			new_emperor_name = "a new Emperor"
		end

		local add_s = "s"
		local remove_s = ""
		if new_emperor_name == "the Emperors Teradoc" then
			add_s = ""
			remove_s = "s"
		end
		end_screen_message = string.gsub(end_screen_message,"@",add_s)
		end_screen_message = string.gsub(end_screen_message,"#",remove_s)
		end_screen_message = string.gsub(end_screen_message,"NEW_EMPEROR_PLACEHOL",new_emperor_name)
	end

	return CapitalizeFirstCharacterOfEachSentence(end_screen_message)
end
