require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = "H_WING_SQUADRON"
		
		if Is_Amalgam(owner) then
			alias = native
		end
		
		local simpletypes = {
			IMPERIAL = "TIE_HEAVY_BOMBER_SQUADRON",
			PENTASTAR = "TIE_TERROR_SQUADRON",
			ZSINJ_EMPIRE = "SCURRG_H6_PROTOTYPE_SQUADRON",
			EMPIREOFTHEHAND = "TIE_HEAVY_BOMBER_SQUADRON",
			MANDALORIANS = "FIRESPRAY_BOMBER_SQUADRON",
			HUTT_CARTELS = "SCURRG_H6_SQUADRON"
		}
		
		if simpletypes[owner] then
			fighter = simpletypes[owner]
		elseif simpletypes[alias] then
			fighter = simpletypes[alias]
		end

		if Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_BOMBER_SQUADRON"
		end

		if (owner == "REBEL" or alias == "REBEL") and Check_Flags(flags,"NCMP") then
			if Get_Fighter_Research("Kwing") then
				fighter = "K_WING_SQUADRON"
			else
				fighter = "K_WING_PROTOTYPE_SQUADRON"
			end
		end
		
		if Check_Flags(flags,"PUNISHERS") then
			fighter = "TIE_PUNISHER_SQUADRON"
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