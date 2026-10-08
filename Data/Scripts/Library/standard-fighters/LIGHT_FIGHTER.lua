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

		if owner == "HOLDOUTS" then
			fighter = "VULTURE_SQUADRON"
		end

		return fighter
	end
}