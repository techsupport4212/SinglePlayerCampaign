require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = "EARLY_SKIPRAY_SQUADRON"
		
		if Is_Amalgam(owner) then
			alias = native
		end
		
		if owner == "EMPIREOFTHEHAND" and native == "IMPERIAL" then
			alias = "IMPERIAL"
		end

		if owner == "EMPIRE" then
			if Get_Fighter_Research("Blastboat") then
				fighter = "SKIPRAY_SQUADRON"
			else
				fighter = "EARLY_SKIPRAY_SQUADRON"
			end
		end
		
		local simpletypes = {
			IMPERIAL = "SKIPRAY_SQUADRON",
			PENTASTAR = "ADVANCED_SKIPRAY_SQUADRON",
			GREATER_MALDROOD = "EARLY_SKIPRAY_SQUADRON",
			ERIADU_AUTHORITY = "EARLY_SKIPRAY_SQUADRON",
			REBEL = "SKIPRAY_SQUADRON",
			MANDALORIANS = "FIRESPRAY_GUNSHIP_SQUADRON",
			HUTT_CARTELS = "KRAYT_GUNSHIP_SQUADRON",
			YEVETHA = "SKIPRAY_SQUADRON"
		}
		
		if simpletypes[owner] then
			fighter = simpletypes[owner]
		elseif simpletypes[alias] then
			fighter = simpletypes[alias]
		end

		-- Era 0: imperial factions use TIE interceptors until the main Empire gains Skipray (Blastboat) research
		if Is_Era_Zero_Imperial(owner) then
			if owner == "EMPIRE" then
				if Get_Fighter_Research("Blastboat") then
					fighter = "SKIPRAY_SQUADRON"
				else
					fighter = "TIE_INTERCEPTOR_SQUADRON"
				end
			else
				fighter = "TIE_INTERCEPTOR_SQUADRON"
			end
		end
		
		if suffix then
			fighter = fighter .. suffix
		end
		return fighter
	end
}