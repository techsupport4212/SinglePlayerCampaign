require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local double = false
		local fighter = "T_WING_SQUADRON"
		
		if Is_Amalgam(owner) then
			alias = native
		end
		
		if owner == "EMPIREOFTHEHAND" and native == "IMPERIAL" then
			alias = native
		end

		local simpletypes = {
			IMPERIAL = "V38_SQUADRON",
			ZSINJ_EMPIRE = "TIE_X7_SQUADRON",
			ERIADU_AUTHORITY = "TIE_X7_SQUADRON",
			REBEL = "A_WING_SQUADRON",
			EMPIREOFTHEHAND = "SCARSSIS_SQUADRON",
			HAPES_CONSORTIUM = "HOUSE_MIYTIL_FIGHTER_SQUADRON",
			CORPORATE_SECTOR = "T_WING_SQUADRON",
			HUTT_CARTELS = "CLOAKSHAPE_NEW_SQUADRON",
			MANDALORIANS = "AGGRESSOR_ASSAULT_FIGHTER_SQUADRON"
		}
		
		if simpletypes[owner] then
			fighter = simpletypes[owner]
		elseif simpletypes[alias] then
			fighter = simpletypes[alias]
		end

		if Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_INTERCEPTOR_SQUADRON"
		elseif alias == "IMPERIAL" then
			fighter = "TIE_INTERCEPTOR_SQUADRON"
			if owner == "ZSINJ_EMPIRE" then
				if not Get_Fighter_Research("Raptorless") then
					fighter = "TIE_RAPTOR_SQUADRON"
				end
			elseif owner == "ERIADU_AUTHORITY" then
				if Get_Fighter_Research("EATIEShields") then
					if Get_Fighter_Research("ArmoredTIE") then
						fighter = "SHIELDED_ARMORED_INTERCEPTOR_SQUADRON"
					else
						fighter = "SHIELDED_TIE_INTERCEPTOR_SQUADRON"
					end
					else
					if Get_Fighter_Research("ArmoredTIE") then
						fighter = "ARMORED_INTERCEPTOR_SQUADRON"
					else
						fighter = "TIE_INTERCEPTOR_SQUADRON"
					end
				end
			elseif owner == "GREATER_MALDROOD" and Get_Fighter_Research("MissileTIE") then
				fighter = "MISSILE_TIE_INTERCEPTOR_SQUADRON"
			end
			if is_main_empire and Check_Flags(flags,"ISD") then
				if regime == 4 or regime == 6 then
					fighter = "A9_SQUADRON"
				elseif regime == 5 then
					fighter = "ROYAL_GUARD_INTERCEPTOR_SQUADRON"
				elseif regime == 7 then
					fighter = "PREYBIRD_SQUADRON"
				end
			end
			if Check_Flags(flags,"SHIELDED_IN") or Check_Flags(flags,"SHIELDED_FIGHTERS") then
				if owner ~= "ZSINJ_EMPIRE" then
					fighter = "SHIELDED_TIE_INTERCEPTOR_SQUADRON"
				else
					fighter = "SHIELDED_TIE_RAPTOR_SQUADRON"
				end
			end
		elseif owner == "REBEL" and native ~= "IMPERIAL" then
			local test = Find_First_Object("TALLON_SILENT_WATER")
			if TestValid(test) then
				double = true
			end
		elseif owner == "REBEL" and native == "IMPERIAL" then
			fighter = "SHIELDED_TIE_INTERCEPTOR_SQUADRON"
		end
		
		if double then
			suffix = Double_Suffix(suffix)
		end
		if suffix then
			fighter = fighter .. suffix
		end

		if owner == "HOLDOUTS" then
			fighter = "VULTURE_SQUADRON"
		end

		return fighter
	end
}