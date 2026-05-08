require("deepcore/std/class")
CONSTANTS = ModContentLoader.get("GameConstants")

---@class YearHandler
YearHandler = class()

---@param start_year integer
---@param id string
function YearHandler:new(galactic_display, start_year, start_month, id)
    self.EventLibrary = require("YearlyEventLibrary")
    self.news_feed = galactic_display:get_component("news_feed")

    self.start_year = start_year
    self.start_month = start_month
    self.suffix = CONSTANTS.YEAR_SUFFIX
    self.events = true
    self.cycle_of_month = -1 --prevents first update from advancing month
    self.cycles_per_month = 1

    self.timed_event_table = {}

    if id == "DEFAULT" or id == "HISTORICAL" or id == "FTGU" then
        self.events = false
    end

    -- TechSupport: added support for era zero, which has a different calendar system and thus different month lengths and year suffixes
    if id == "ZAARIN" then
        self.cycles_per_month = 4
    end

    if start_year == nil then
        self.start_year = CONSTANTS.START_YEAR
    end

    if start_month == nil then
        self.start_month = 1
    end

    self.current_year = self.start_year
    self.current_month = self.start_month

    if Find_Object_Type("fotr") then
        self.cycles_per_month = 2

        if self.start_year == 22 then
            self.current_month = 6
        end
    end

    GlobalValue.Set("GC_START_YEAR", self.current_year)

    if self.suffix == "BBY" then
        GlobalValue.Set("GALACTIC_YEAR", -self.current_year)
    else
        GlobalValue.Set("GALACTIC_YEAR", self.current_year)
    end

    GlobalValue.Set("GALACTIC_MONTH", self.current_month)

    self.current_year_text = tostring(self.current_year) .." ".. self.suffix.. " month "..tostring(self.current_month)
    GlobalValue.Set("CURRENT_YEAR_TEXT", self.current_year_text)

    crossplot:subscribe("REGISTER_DATE_TIMER", self.set_timer, self)
end

function YearHandler:update()
    crossplot:publish("CYCLE_CHANGE", "empty")
	local checkobject = Find_First_Object("Custom_GC_Starter_Dummy")
	if checkobject ~= nil then
		return
	end
		
	self.cycle_of_month = self.cycle_of_month + 1

    if self.cycle_of_month >= self.cycles_per_month then
        self.current_month = self.current_month + 1
        self.cycle_of_month = 0
    end

    if self.current_month == 13 then
        if self.suffix == "BBY" then
            self.current_year = self.current_year - 1
            GlobalValue.Set("GALACTIC_YEAR", 0 - self.current_year)
        else
            self.current_year = self.current_year + 1
            GlobalValue.Set("GALACTIC_YEAR", self.current_year)
        end
        self.current_month = 1
        if self.current_year == 0 then
            if self.suffix == "BBY" then
                self.suffix = "ABY"
            end
        end
        crossplot:publish("ENTER_"..self.current_year..self.suffix, "empty")
    end
    GlobalValue.Set("GALACTIC_MONTH", self.current_month)

    local year_only_text = tostring(self.current_year) .." ".. self.suffix
    self.current_year_text = year_only_text.. " month "..tostring(self.current_month)
    GlobalValue.Set("CURRENT_YEAR_TEXT", self.current_year_text)

    if self.events == false then
        return
    end

    if self.EventLibrary[year_only_text] then
        for _, event in pairs(self.EventLibrary[year_only_text]) do
            if event.month == self.current_month and self.cycle_of_month == 0 then
                if event.params then
                    crossplot:publish(event.name, unpack(event.params))
                else
                    crossplot:publish(event.name, "empty")
                end
            end
        end
    end

    for name, data in pairs(self.timed_event_table) do
        if self.current_year == data.year and self.current_month == data.month then
            if data.params then
                crossplot:publish(name, unpack(data.params))
            else
                crossplot:publish(name, "empty")
            end
        end
    end
end

function YearHandler:set_timer(name, years, months, announce, announce_filter_player, params)

    local target_year = 0
    local target_month = 0
    local arg = false
    if params then
        arg = params
    end

    if self.suffix == "BBY" then
        target_year = self.current_year - years 
        if self.current_month + months <= 12 then
            target_month = self.current_month + months
        else
            target_month = self.current_month + months - 12
            target_year = target_year - 1
        end
    else
        target_year = self.current_year + years
        if self.current_month + months <= 12 then
            target_month = self.current_month + months
        else
            target_month = self.current_month + months - 12
            target_year = target_year + 1
        end
    end
    -- Going from BBY to ABY needs different handling.

    self.timed_event_table[name] = {year = target_year, month = target_month, params = arg}

    if announce and Find_Player("local").Get_Faction_Name() == announce_filter_player then
        self.news_feed:post {
            headline = announce .. " ".. tostring(self.timed_event_table[name].year).. self.suffix .. " month " .. self.timed_event_table[name].month,
            var = nil
        }
    end

    --        crossplot:publish("REGISTER_DATE_TIMER", "TIMER_TEST", 0, 1, "Event Type will happen in", "EMPIRE", {params})


end

return YearHandler
