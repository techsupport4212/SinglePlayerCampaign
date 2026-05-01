require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local double = false
		local fighter = "PREYBIRD_SQUADRON"
		
		if Is_Amalgam(owner) then
			alias = native
		end

		if owner == "EMPIREOFTHEHAND" and native == "IMPERIAL" then
			alias = native
		end
		
		local simpletypes = {
			IMPERIAL = "TIE_AVENGER_SQUADRON",
			GREATER_MALDROOD = "TIE_V1_SQUADRON",
			ERIADU_AUTHORITY = "TIE_X1_SQUADRON",
			PENTASTAR = "TIE_X2_SQUADRON",
			ZSINJ_EMPIRE = "TIE_AGGRESSOR_SQUADRON",
			EMPIREOFTHEHAND = "SCARSSIS_SQUADRON",
			HAPES_CONSORTIUM = "HOUSE_MIYTIL_FIGHTER_SQUADRON",
			CORPORATE_SECTOR = "DREXL_SQUADRON",
			HUTT_CARTELS = "CLOAKSHAPE_NEW_SQUADRON",
			MANDALORIANS = "FIRESPRAY_SQUADRON",
			CORELLIA = "HLAF_SQUADRON"
		}
		
		if simpletypes[owner] then
			fighter = simpletypes[owner]
		elseif simpletypes[alias] then
			fighter = simpletypes[alias]
		end
		
		if owner == "EMPIRE" and Check_Flags(flags,"EMPIRE_X1") then
			fighter = "TIE_X1_SQUADRON"
		end
		
		if is_main_empire then
			if regime == 4 then
				fighter = "SHADOW_DROID_LIGHT_SQUADRON"
			end
		end

		if Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_INTERCEPTOR_SQUADRON"
		end

		if owner == "REBEL" or alias == "REBEL" then
			if Check_Flags(flags,"DREXLX") and Get_Fighter_Research("CoS_Tevv") then
				fighter = "DREXL_SQUADRON"
			else
				if techLevel >= 4 then
					if Get_Fighter_Research("Ewing") then
						fighter = "E_WING_SQUADRON"
					else
						fighter = "E_WING_PROTOTYPE_SQUADRON"
					end
				else
					fighter = "X_WING_SQUADRON"
				end
			end
		end
		
		if suffix then
			fighter = fighter .. suffix
		end
		return fighter
	end
}