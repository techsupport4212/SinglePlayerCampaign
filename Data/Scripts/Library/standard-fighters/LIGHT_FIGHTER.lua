require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = "Z95_HEADHUNTER_SQUADRON"
		
		if Is_Amalgam(owner) then
			alias = native
			owner = native
		end
		
		if Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_FIGHTER_SQUADRON"
		elseif alias == "IMPERIAL" or owner == "CORELLIA" then
			fighter = "TIE_FIGHTER_SQUADRON"
			if owner == "PENTASTAR" and Get_Fighter_Research("X3") then
				fighter = "TIE_X3_SQUADRON"
			elseif owner == "ERIADU_AUTHORITY" and Get_Fighter_Research("EATIEShields") then
				fighter = "SHIELDED_TIE_FIGHTER_SQUADRON"
			elseif owner == "ZSINJ_EMPIRE" and native ~= "IMPERIAL" then
				fighter = "Z95_HEADHUNTER_SQUADRON"
			end
			if Check_Flags(flags,"SHIELDED_LN") or Check_Flags(flags,"SHIELDED_FIGHTERS") then
				fighter = "SHIELDED_TIE_FIGHTER_SQUADRON"
			end
			if is_main_empire then
				if regime == 4 then
					if owner == "ERIADU_AUTHORITY" and Get_Fighter_Research("EATIEShields") then
						fighter = "SHIELDED_TIE_DROID_SQUADRON"
					else
						fighter = "TIE_DROID_SQUADRON"
					end
				elseif regime == 6 and not Get_Fighter_Research("V38") then --No Super TIE for Zero Command
					fighter = "SUPER_TIE_SQUADRON"
				end
			end
		elseif owner == "REBEL" then
			if techLevel >= 4 then
				fighter = "DEFENDER_STARFIGHTER_SQUADRON"
			else
				fighter = "Z95_HEADHUNTER_SQUADRON"
			end
			if native == "IMPERIAL" then
				fighter = "SHIELDED_TIE_FIGHTER_SQUADRON"
			elseif Get_Fighter_Research("CoS_Shesh") then
				fighter = "A9_SQUADRON"
			end
		elseif owner == "HAPES_CONSORTIUM" then
			if native == "IMPERIAL" then
				fighter = "TIE_FIGHTER_SQUADRON"
			else
				fighter = "PATROL_MIYTIL_FIGHTER_SQUADRON"
			end
		elseif owner == "EMPIREOFTHEHAND" then
			if native == "IMPERIAL" then
				fighter = "TIE_FIGHTER_SQUADRON"
			else
				fighter = "NSSIS_SQUADRON"
			end
		elseif owner == "CORPORATE_SECTOR" then
			fighter = "IRD_SQUADRON"
		elseif owner == "HUTT_CARTELS" then
			fighter = "Z95_HEADHUNTER_SQUADRON"
		elseif owner == "BAKURA" then
			fighter = "BAKURAN_GPA_SQUADRON"
		end 
		
		if suffix then
			fighter = fighter .. suffix
		end
		return fighter
	end
}