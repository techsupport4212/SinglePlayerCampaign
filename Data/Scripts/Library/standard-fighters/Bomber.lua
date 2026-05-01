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
			REBEL = "Y_WING_SQUADRON",
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
		elseif alias == "IMPERIAL" then
			fighter = "TIE_BOMBER_SQUADRON"
			if is_main_empire then
				if regime == 3 or regime > 6 then
					fighter = "SCIMITAR_SQUADRON"
				end
			end
		elseif owner == "CORPORATE_SECTOR" or alias == "CORPORATE_SECTOR" then
			if Check_Flags(flags,"ISD") then
				fighter = "BTLB_Y_WING_SQUADRON"
			else
				fighter = "2_WARPOD_SQUADRON"
			end
		end 
		
		if suffix then
			fighter = fighter .. suffix
		end
		return fighter
	end
}