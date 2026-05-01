require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = "Z95ML_HEADHUNTER_SQUADRON"
		
		if Is_Amalgam(owner) then
			alias = native
		end
		
		local simpletypes = {
			IMPERIAL = "TIE_GT_SQUADRON",
			ZSINJ_EMPIRE = "Z95ML_HEADHUNTER_SQUADRON",
			EMPIREOFTHEHAND = "TIE_GT_SQUADRON",
			HAPES_CONSORTIUM = "MIYTIL_FIGHTER_SQUADRON",
		}
		
		if simpletypes[owner] then
			fighter = simpletypes[owner]
		elseif simpletypes[alias] then
			fighter = simpletypes[alias]
		end
		
		if suffix then
			fighter = fighter .. suffix
		end
		return fighter
	end
}