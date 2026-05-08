-- TechSupport: state file for era zero, still WIP - need to add in policies and effects, but have added in the lock lists for units that should be locked during this era
require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("SetFighterResearch")

return {
    on_enter = function(self, state_context)

        self.entry_time = GetCurrentTime()

        if self.entry_time <= 5 then
            UnitUtil.SetLockList("REBEL", {
                "Bulwark_III",
                "Republic_Star_Destroyer",
                "MC90", "AckbarHO2GV", "NantzIn2FW", 
                "New_Republic_Defense_Trooper_Company",
                "V_Wing_Airspeeder_Company",
                "Jedi_Temple",
                "New_Republic_Jedi_Knight_Company"
            }, false)
            
            UnitUtil.SetLockList("EMPIRE", {
                "Praetor_II_Battlecruiser",
                "Strike_Cruiser",
                "TaggeCo_HQ",
                "PX10_Company",
                "Imperial_AT_AT_Walker_Turbolaser_Refit_Company",
                "AT_ST_A_Company",
                -- Historical-only units
                "Navy_Commando_Company"
            }, false)
			
			UnitUtil.SetLockList("EMPIRE", {
                "Imperial_Stormtrooper_Company"
            })
            
			UnitUtil.SetLockList("GREATER_MALDROOD", {
                "Crimson_Victory_II_Star_Destroyer"
            })
			
            UnitUtil.SetLockList("PENTASTAR", {
                "Cygnus_HQ",
                "Merkuni_HQ"
            })

            UnitUtil.SetLockList("ERIADU_AUTHORITY", {
                "Tarkin_Estates"
            })

            UnitUtil.SetLockList("ERIADU_AUTHORITY", {
                "TaggeCo_HQ",
				"GormTalquist_HQ"
            }, false)

            UnitUtil.SetLockList("GREATER_MALDROOD", {
                "TaggeCo_HQ",
				"GormTalquist_HQ"
            }, false)

            UnitUtil.SetLockList("PENTASTAR", {
                "TaggeCo_HQ",
				"GormTalquist_HQ"
            }, false)

            UnitUtil.SetLockList("ZSINJ_EMPIRE", {
                "TaggeCo_HQ",
				"GormTalquist_HQ"
            }, false)
			
			UnitUtil.SetLockList("IMPERIAL_PROTEUS", {
                "Imperial_Army_Guard_Company"
            })
			
			UnitUtil.SetLockList("IMPERIAL_PROTEUS", {
				"TIE_Crawler_Company",
				"Dragon_Heavy_Cruiser",
				"Marauder_Cruiser",
				"Customs_Corvette",
				"Raider_I_Corvette",
				"CR92A",
				"Eidolon",
				"Pursuit_Light_Cruiser",
				"Persuader_Company",
				"Imperial_AT_AP_Walker_Company",
				"AT_MP_Company",
				"Torpedo_Sphere",
				"Venator_Star_Destroyer",
				"Raptor_Trooper_Company",
                "TaggeCo_HQ",
				"CEC_HQ",
				"TransGalMeg_HQ",
				"Bulwark_I"
            }, false)
        end
    end,
    on_update = function(self, state_context)   
    end,
    on_exit = function(self, state_context)
    end
}