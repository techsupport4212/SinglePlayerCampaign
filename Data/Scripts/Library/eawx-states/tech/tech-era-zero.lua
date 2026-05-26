-- TechSupport: state file for era zero, still WIP - need to add in policies and effects, but have added in the lock lists for units that should be locked during this era
require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("SetFighterResearch")
require("eawx-util/StoryUtil")
return {
    on_enter = function(self, state_context)

        self.entry_time = GetCurrentTime()

        if self.entry_time <= 5 then
            --StoryUtil.ShowScreenText("TEXT_GUI_ERA_ZERO", 10)
        end
    end,
    on_update = function(self, state_context)   
    end,
    on_exit = function(self, state_context)
    end
}