require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = ""
		if Is_Amalgam(owner) or owner == "HUTT_CARTELS" or owner == "REBEL" then
			fighter = "ARC_170_SQUADRON"
		elseif owner == "CORPORATE_SECTOR" then
			fighter = "PREYBIRD_SQUADRON"
		else
			fighter = "TIE_DEFENDER_SQUADRON"
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
		elseif owner == "GREATER_MALDROOD" or owner == "PENTASTAR" or owner == "ERIADU_AUTHORITY" or owner == "ZSINJ_EMPIRE" or owner == "IMPERIAL_PROTEUS" then
			fighter = "TIE_INTERCEPTOR_SQUADRON"
		elseif Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_INTERCEPTOR_SQUADRON"
		end

		if is_main_empire then
			if regime == 4 then
				fighter = "SHADOW_DROID_HEAVY_SQUADRON"
			end
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