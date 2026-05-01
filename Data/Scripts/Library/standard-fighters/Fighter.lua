require("StandardFighterFunctions")

return {
	Evaluate_Fighters = function(native,suffix,owner,alias,techLevel,regime,flags,is_main_empire)		
		local fighter = "HOWLRUNNER_SQUADRON"
		if Is_Amalgam(owner) then
			alias = native
		end
		
		if owner == "EMPIREOFTHEHAND" and native == "IMPERIAL" then
			alias = native
		end
		
		local simpletypes = {
			IMPERIAL = "HOWLRUNNER_SQUADRON",
			ERIADU_AUTHORITY = "TIE_SENTINEL_SQUADRON",
			EMPIREOFTHEHAND = "NSSIS_SQUADRON",
			HAPES_CONSORTIUM = "MIYTIL_FIGHTER_SQUADRON",
			CORPORATE_SECTOR = "IRDA_SQUADRON",
			HUTT_CARTELS = "DUNELIZARD_FIGHTER_SQUADRON",
			MANDALORIANS = "STARVIPER_II_SQUADRON",
			CORELLIA = "HLAF_SQUADRON",
			YEVETHA = "TRIFOIL_SQUADRON"
		}
		
		if simpletypes[owner] then
			fighter = simpletypes[owner]
		elseif simpletypes[alias] then
			fighter = simpletypes[alias]
		end


		if Is_Era_Zero_Imperial(owner) then
			fighter = "TIE_FIGHTER_SQUADRON"
		end

		if owner == "CORPORATE_SECTOR" then
			local test = Find_First_Object("KRIN_INVINCIBLE")
			if TestValid(test) then
				fighter = "SHIELDED_IRDA_SQUADRON"
			end
		end
		
		if owner == "REBEL" or alias == "REBEL" then
			if Check_Flags(flags,"DREXLX") and Get_Fighter_Research("CoS_Tevv") then
				fighter = "DREXL_SQUADRON"
			else
				fighter = "X_WING_SQUADRON"
			end
		end 
		
		if owner == "HAPES_CONSORTIUM" then
			if native == "REBEL" then
				fighter = "X_WING_SQUADRON"
			end
		end
		
		if suffix then
			fighter = fighter .. suffix
		end
		return fighter
	end
}