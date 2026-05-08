-- TechSupport: state file for era zero, still WIP - need to add in policies and effects, but have added in the lock lists for units that should be locked during this era
require("eawx-util/StoryUtil")
require("PGStoryMode")
require("PGSpawnUnits")

return {
    on_enter = function(self, state_context)
        GlobalValue.Set("CURRENT_ERA", 0)
		--local infinity = GlobalValue.Get("PROGRESSIVE_INFINITY")

        --self.LeaderApproach = false

        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.AI_Active = true

        --StoryUtil.SetPlanetRestricted("DOORNIK", 1)
        --StoryUtil.SetPlanetRestricted("ZFELL", 1)
        --StoryUtil.SetPlanetRestricted("NZOTH", 1)
        --StoryUtil.SetPlanetRestricted("JTPTAN", 1)
        --StoryUtil.SetPlanetRestricted("POLNEYE", 1)
        --StoryUtil.SetPlanetRestricted("PRILDAZ", 1)
    end,

    on_update = function(self, state_context)
        local current = GetCurrentTime() - self.entry_time
        if current >= 8 and self.AI_Active == false then
			if not GlobalValue.Get("PROGRESSIVE_INFINITY") then
				crossplot:publish("INITIALIZE_AI", "empty")
			end
            self.AI_Active = true
        end
    end,

    on_exit = function(self, state_context)
    end
}
