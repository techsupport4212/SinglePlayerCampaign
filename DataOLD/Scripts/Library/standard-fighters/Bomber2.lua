require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = "BTLB_Y_WING_SQUADRON"
		
		if Is_Amalgam(owner) then
			alias = native
		end
		
		if owner == "EMPIREOFTHEHAND" and native == "IMPERIAL" then
			alias = native
		end
		
		local simpletypes = {
			IMPERIAL = "STARWING_SQUADRON",
			GREATER_MALDROOD = "TIE_OPPRESSOR_SQUADRON",
			EMPIREOFTHEHAND = "SYCA_BOMBER_SQUADRON",
			HAPES_CONSORTIUM = "MIYTIL_BOMBER_SQUADRON",
			CORPORATE_SECTOR = "BTLB_Y_WING_SQUADRON",
			HUTT_CARTELS = "KIMOGILA_SQUADRON",
			MANDALORIANS = "KIMOGILA_SQUADRON",
			CORELLIA = "BTLS1_Y_WING_SQUADRON"
		}
		
		if simpletypes[owner] then
			fighter = simpletypes[owner]
		elseif simpletypes[alias] then
			fighter = simpletypes[alias]
		end

		if Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_BOMBER_SQUADRON"
		elseif owner == "ERIADU_AUTHORITY" then
			if Get_Fighter_Research("Scimitar") then
				fighter = "SCIMITAR_SQUADRON"
			else
				fighter = "TIE_BOMBER_SQUADRON"
			end
		elseif owner == "REBEL" then
			if Get_Fighter_Research("BwingE") then
				fighter = "B_WING_E_SQUADRON"
			else
				fighter = "B_WING_SQUADRON"
			end
		elseif alias == "REBEL" then
			fighter = "B_WING_SQUADRON"
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