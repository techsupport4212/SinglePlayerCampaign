require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = "TIE_FIGHTER_SQUADRON"

		if Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_FIGHTER_SQUADRON"
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