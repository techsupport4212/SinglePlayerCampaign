require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = "ARC_170_SQUADRON"
		if Is_Amalgam(owner) or owner == "HUTT_CARTELS" or owner == "REBEL" then
			fighter = "ARC_170_SQUADRON"
		elseif owner == "CORPORATE_SECTOR" then
			fighter = "PREYBIRD_SQUADRON"
		end
		
		if owner == "EMPIREOFTHEHAND" and native == "IMPERIAL" then
			alias = native
		end

		if owner == "EMPIRE" then
			if Get_Fighter_Research("Defender") then
				fighter = "TIE_DEFENDER_SQUADRON"
			else
				fighter = "TIE_INTERCEPTOR_SQUADRON"
			end
		elseif Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_INTERCEPTOR_SQUADRON"
		end

		if suffix then
			fighter = fighter .. suffix
		end

		if owner == "HOLDOUTS" then
			fighter = "HYENA_SQUADRON"
		end

		return fighter
	end
}