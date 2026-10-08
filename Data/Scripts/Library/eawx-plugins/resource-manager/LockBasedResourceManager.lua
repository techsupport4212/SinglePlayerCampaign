--**************************************************************************************************
--*    _______ __                                                                                  *
--*   |_     _|  |--.----.---.-.--.--.--.-----.-----.                                              *
--*     |   | |     |   _|  _  |  |  |  |     |__ --|                                              *
--*     |___| |__|__|__| |___._|________|__|__|_____|                                              *
--*    ______                                                                                      *
--*   |   __ \.-----.--.--.-----.-----.-----.-----.                                                *
--*   |      <|  -__|  |  |  -__|     |  _  |  -__|                                                *
--*   |___|__||_____|\___/|_____|__|__|___  |_____|                                                *
--*                                   |_____|                                                      *
--*                                                                                                *
--*                                                                                                *
--*       File:              LockBasedResourceManager.lua                                          *
--*       File Created:      Sunday, 23rd February 2020 05:01                                      *
--*       Author:            [TR] Pox                                                              *
--*       Last Modified:     Monday, 24th February 2020 12:45                                      *
--*       Modified By:       [TR] Pox                                                              *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************

require("deepcore/std/class")
require("deepcore/std/Observable")
require("eawx-util/GalacticUtil")
require("PGStoryMode")

require("eawx-util/UnitUtil")
ModContentLoader = require("eawx-std/ModContentLoader")
local fleet_categories = require("eawx-plugins/resource-manager/FleetCategories")
local fleet_initial_locks = require("eawx-plugins/resource-manager/FleetInitialLocks")

---@class LockBasedResourceManager
LockBasedResourceManager = class()

---@param gc GalacticConquest
function LockBasedResourceManager:new(gc, options_handler)
    self.options_handler = options_handler

    self.human = Find_Player("local")
    self.player_id = string.upper(self.human.Get_Faction_Name())

    self.starting_ship_crews = 250
    self.ship_crews = self.starting_ship_crews
    self.ship_crew_income = "Pending"
    self.ship_crew_income_display_initialized = false
    self.fleet_categories = fleet_categories
    self.fleet_initial_locks = fleet_initial_locks
    self.fleet_external_unlocks = {}
    self.supercapital_slots = 0
    self.queued_fleet = {
        Corvette = 0,
        Frigate = 0,
        Capital = 0,
        SuperCapital = 0,
    }
    self.availability_update_counter = 0
    self.last_owned_fleet_counts = nil

    self.player_unit_list = self:build_costed_roster()
    self:update_availability()

    gc.Events.GalacticProductionStarted:attach_listener(self.on_production_queued, self)
    gc.Events.GalacticProductionCanceled:attach_listener(self.on_production_canceled, self)
    gc.Events.GalacticProductionFinished:attach_listener(self.on_production_finished, self)
    gc.Events.TacticalBattleEnded:attach_listener(self.on_battle_end, self)
    crossplot:subscribe("UPDATE_AVAILABILITY", self.update_availability, self)
    crossplot:subscribe("TACTICAL_CREW_UPDATE", self.tactical_crew_update, self)
    crossplot:subscribe("ADD_SUPERCAPITAL_SLOT", self.add_supercapital_slot, self)
    crossplot:subscribe("SET_SUPERCAPITAL_SLOTS", self.set_supercapital_slots, self)

    self.resources_changed_event = Observable()
end

function LockBasedResourceManager:update()
    self.availability_update_counter = self.availability_update_counter + 1
    if self.availability_update_counter < 5 then
        return
    end

    self.availability_update_counter = 0
    local current_counts = {
        Corvette = self:get_owned_fleet_count("Corvette"),
        Frigate = self:get_owned_fleet_count("Frigate"),
        Capital = self:get_owned_fleet_count("Capital"),
        SuperCapital = self:get_owned_fleet_count("SuperCapital"),
    }

    local counts_changed = self.last_owned_fleet_counts == nil
    if not counts_changed then
        for category, count in pairs(current_counts) do
            if self.last_owned_fleet_counts[category] ~= count then
                counts_changed = true
                break
            end
        end
    end

    self.last_owned_fleet_counts = current_counts
    if counts_changed then
        self:update_availability()
    end
end

function LockBasedResourceManager:get_owned_fleet_count(category)
    local count = 0
    local objects = Find_All_Objects_Of_Type(self.human) or {}

    for _, object in pairs(objects) do
        if TestValid(object) then
            local object_type = object.Get_Type()
            if object_type then
                local object_category = self.fleet_categories[string.upper(object_type.Get_Name())]
                if object_category == category then
                    count = count + 1
                end
            end
        end
    end

    return count
end

function LockBasedResourceManager:get_category(unit_type_name)
    return self.fleet_categories[string.upper(unit_type_name)]
end

function LockBasedResourceManager:get_roster_cost(unit_type_name)
    return self.player_unit_list[string.upper(unit_type_name)]
end

function LockBasedResourceManager:ensure_roster_entry(unit_type_name)
    local normalized_name = string.upper(unit_type_name)
    local existing_cost = self.player_unit_list[normalized_name]
    if existing_cost ~= nil then
        return existing_cost
    end

    local unit_script = ModContentLoader.get_space_object_script(unit_type_name)
    if not unit_script or unit_script.Ship_Crew_Requirement == nil then
        OutputDebug(
            "[CREW_COST_DEBUG] missing script unit=%s normalized=%s",
            tostring(unit_type_name),
            tostring(normalized_name)
        )
        return nil
    end

    self.player_unit_list[normalized_name] = unit_script.Ship_Crew_Requirement
    OutputDebug(
        "[CREW_COST_DEBUG] added roster entry unit=%s normalized=%s cost=%s",
        tostring(unit_type_name),
        tostring(normalized_name),
        tostring(unit_script.Ship_Crew_Requirement)
    )
    return unit_script.Ship_Crew_Requirement
end

function LockBasedResourceManager:get_fleet_count(category)
    return self:get_owned_fleet_count(category) + self.queued_fleet[category]
end

function LockBasedResourceManager:get_fleet_progression()
    local galactic_year = tonumber(GlobalValue.Get("GALACTIC_YEAR") or 0) or 0
    local abs_year = galactic_year
    if abs_year < 0 then
        abs_year = 0 - abs_year
    end

    local progression = abs_year / 25
    if progression < 0 then
        return 0
    end
    if progression > 1 then
        return 1
    end
    return progression
end

function LockBasedResourceManager:get_frigate_limit(total_non_supercapital_fleet)
    local progress = self:get_fleet_progression()
    local early_fraction = 0.60 - (0.25 * progress)
    local final_fraction = 0.35
    local ratio = early_fraction + (final_fraction - early_fraction) * progress
    local limit = tonumber(Dirty_Floor(total_non_supercapital_fleet * ratio)) or 0
    if limit < 0 then
        return 0
    end
    return limit
end

function LockBasedResourceManager:get_capital_limit(total_non_supercapital_fleet)
    local progress = self:get_fleet_progression()
    local early_fraction = 0.05 + (0.15 * progress)
    local final_fraction = 0.20
    local ratio = early_fraction + (final_fraction - early_fraction) * progress
    local limit = tonumber(Dirty_Floor(total_non_supercapital_fleet * ratio)) or 0
    if limit < 0 then
        return 0
    end
    return limit
end

function LockBasedResourceManager:add_supercapital_slot(amount)
    self.supercapital_slots = self.supercapital_slots + (amount or 1)
    if self.supercapital_slots < 0 then
        self.supercapital_slots = 0
    end
    self:update_availability()
end

function LockBasedResourceManager:set_supercapital_slots(amount)
    self.supercapital_slots = tonumber(amount) or 0
    if self.supercapital_slots < 0 then
        self.supercapital_slots = 0
    end
    self:update_availability()
end

function LockBasedResourceManager:change_queued_fleet(unit_type_name, amount)
    local category = self:get_category(unit_type_name)
    if not category then
        return
    end

    self.queued_fleet[category] = self.queued_fleet[category] + amount
    if self.queued_fleet[category] < 0 then
        self.queued_fleet[category] = 0
    end
end

function LockBasedResourceManager:is_fleet_buildable(unit_type_name)
    local category = self:get_category(unit_type_name)
    if not category then
        return true
    end

    if category == "Corvette" then
        return true
    end

    local corvettes = self:get_owned_fleet_count("Corvette")
    local frigates = self:get_owned_fleet_count("Frigate")
    local capitals = self:get_owned_fleet_count("Capital")
    local supercapitals = self:get_owned_fleet_count("SuperCapital")
    local total_ratio_fleet = corvettes + frigates + capitals

    -- Corvette-first progression remains mandatory. Higher-tier construction only opens once the
    -- prerequisite class exists in the player's owned fleet, and queued ships never count.
    if category == "Frigate" and corvettes <= 0 then
        return false
    end
    if category == "Capital" and frigates <= 0 then
        return false
    end
    if category == "SuperCapital" and capitals <= 0 then
        return false
    end

    local limit
    if category == "Frigate" then
        limit = self:get_frigate_limit(total_ratio_fleet)
    elseif category == "Capital" then
        limit = self:get_capital_limit(total_ratio_fleet)
    elseif category == "SuperCapital" then
        limit = self.supercapital_slots
    else
        return true
    end

    local buildable = self:get_fleet_count(category) < limit

    if string.upper(unit_type_name) == "ACCLAMATOR_II"
        or string.upper(unit_type_name) == "VICTORY_I_STAR_DESTROYER" then
        OutputDebug(
            "[FLEET_RATIO_DEBUG] decision unit=%s category=%s corvettes=%s frigates=%s capitals=%s supercapitals=%s total_ratio=%s current=%s limit=%s buildable=%s progress=%s",
            tostring(unit_type_name),
            tostring(category),
            tostring(corvettes),
            tostring(frigates),
            tostring(capitals),
            tostring(supercapitals),
            tostring(total_ratio_fleet),
            tostring(self:get_fleet_count(category)),
            tostring(limit),
            tostring(buildable),
            tostring(self:get_fleet_progression())
        )
    end

    return buildable
end

function LockBasedResourceManager:build_costed_roster()
    --Logger:trace("entering LockBasedResourceManager:build_costed_roster")
    local roster = require("roster-sets/"..self.player_id)
    local influence_roster = require("roster-sets/INFLUENCE")

    for unit, cost in pairs(influence_roster) do
        roster[unit] = 0
    end

    for unit, cost in pairs(roster) do
        local updated_cost = 0

        updated_cost = ModContentLoader.get_space_object_script(unit).Ship_Crew_Requirement
        if updated_cost == nil then
            updated_cost = 0
        end

        roster[unit] = updated_cost
    end

    for unit in pairs(self.fleet_categories) do
        if roster[unit] == nil then
            local unit_script = ModContentLoader.get_space_object_script(unit)
            if unit_script and unit_script.Ship_Crew_Requirement ~= nil then
                roster[unit] = unit_script.Ship_Crew_Requirement
            end
        end
    end

    return roster
end

---@private
---@param game_object_type_name string
function LockBasedResourceManager:remove_resources(game_object_type_name)
    local unit_type_name = string.upper(game_object_type_name)
    local resource = self:ensure_roster_entry(game_object_type_name)
    if resource == nil then
        OutputDebug(
            "[CREW_COST_DEBUG] missing unit=%s normalized=%s",
            tostring(game_object_type_name),
            tostring(unit_type_name)
        )
        DebugMessage("Did not find roster entry for %s. Returning.", tostring(game_object_type_name))
        return false
    end
    --Logger:trace("entering LockBasedResourceManager:remove_resources")
    local previous_crews = self.ship_crews
    self.ship_crews = self.ship_crews - resource
    crossplot:publish("UPDATE_CREWS", self.ship_crews)

    OutputDebug(
        "[CREW_COST_DEBUG] deducted unit=%s normalized=%s cost=%s crews_before=%s crews_after=%s",
        tostring(game_object_type_name),
        tostring(unit_type_name),
        tostring(resource),
        tostring(previous_crews),
        tostring(self.ship_crews)
    )

    return true
end

function LockBasedResourceManager:set_ship_crew_income(ship_crew_income,initialize_display)
    --Logger:trace("entering LockBasedResourceManager:set_ship_crew_income")

    if initialize_display == true then
        self.ship_crew_income_display_initialized = true
    end

    if self.ship_crew_income_display_initialized == true then
        self.ship_crew_income = ship_crew_income
    end

    if initialize_display == true then
        self.resources_changed_event:notify(self.ship_crews, self.ship_crew_income)
    end
end

function LockBasedResourceManager:add_ship_crews(change_amount)
    --Logger:trace("entering LockBasedResourceManager:add_resources")
    self.ship_crews = self.ship_crews + change_amount
    self:update_availability()

    self.resources_changed_event:notify(self.ship_crews, self.ship_crew_income)
    crossplot:publish("UPDATE_CREWS", self.ship_crews)
end

function LockBasedResourceManager:tactical_crew_update(ship_crews)
    --Logger:trace("entering LockBasedResourceManager:tactical_crew_update")
    self.ship_crews = ship_crews
    self:update_availability()
    self.resources_changed_event:notify(self.ship_crews, self.ship_crew_income)
end

---@param planet Planet
---@param game_object_type_name string
function LockBasedResourceManager:on_production_queued(planet, game_object_type_name)
    DebugMessage("In ResourceManager:on_production_queued")
    if not planet:get_owner().Is_Human() then
        return
    end
    self:ensure_roster_entry(game_object_type_name)
    self:change_queued_fleet(game_object_type_name, 1)
    --Logger:trace("entering LockBasedResourceManager:on_production_queued")
    local removed_resources = self:remove_resources(game_object_type_name)

    if not removed_resources then
        return
    end

    self:update_availability()
    self.resources_changed_event:notify(self.ship_crews, self.ship_crew_income)
end

---@param planet Planet
function LockBasedResourceManager:on_production_canceled(planet, game_object_type_name)
    DebugMessage("In ResourceManager:on_production_canceled")
    if not planet:get_owner().Is_Human() then
        return
    end
    self:change_queued_fleet(game_object_type_name, -1)
    --Logger:trace("entering LockBasedResourceManager:on_production_canceled")
    local unit_type_name = string.upper(game_object_type_name)
    local resource = self:ensure_roster_entry(game_object_type_name)
    if resource == nil then
        DebugMessage("Did not find GameObjectLibrary entry for %s. Returning.", tostring(game_object_type_name))
        return
    end

    self.ship_crews = self.ship_crews + resource

    self:update_availability()
    self.resources_changed_event:notify(self.ship_crews, self.ship_crew_income)
end

---@param planet Planet
---@param game_object_type_name string
function LockBasedResourceManager:on_production_finished(planet, game_object_type_name)
    if not planet:get_owner().Is_Human() then
        return
    end

    self:change_queued_fleet(game_object_type_name, -1)
    self:update_availability()
end

function LockBasedResourceManager:update_availability()
    --Logger:trace("entering LockBasedResourceManager:update_availability")
    OutputDebug(
        "[FLEET_RATIO_DEBUG] totals corvettes=%s frigates=%s capitals=%s supercapitals=%s queued_corvettes=%s queued_frigates=%s queued_capitals=%s queued_supercapitals=%s",
        tostring(self:get_owned_fleet_count("Corvette")),
        tostring(self:get_owned_fleet_count("Frigate")),
        tostring(self:get_owned_fleet_count("Capital")),
        tostring(self:get_owned_fleet_count("SuperCapital")),
        tostring(self.queued_fleet.Corvette),
        tostring(self.queued_fleet.Frigate),
        tostring(self.queued_fleet.Capital),
        tostring(self.queued_fleet.SuperCapital)
    )

    for unit_type_name, ship_cost in pairs(self.player_unit_list) do
        local engine_unit_name = unit_type_name
        local object_type = Find_Object_Type(unit_type_name)
        if object_type then
            engine_unit_name = object_type.Get_Name()
        end

        local fleet_buildable = self:is_fleet_buildable(unit_type_name)
        local crew_buildable = self.options_handler.cheat_crews_on == true
            or self.ship_crews >= ship_cost
        local initially_locked = self.fleet_initial_locks[unit_type_name] == true
        local externally_unlocked = self.fleet_external_unlocks[unit_type_name] == true

        if initially_locked
            and not externally_unlocked
            and object_type
            and object_type.Is_Build_Locked
            and not object_type.Is_Build_Locked(self.human) then
            self.fleet_external_unlocks[unit_type_name] = true
            externally_unlocked = true
            OutputDebug(
                "[FLEET_RATIO_DEBUG] external unlock unit=%s engine_name=%s",
                tostring(unit_type_name),
                tostring(engine_unit_name)
            )
        end

        local initial_lock_allows = not initially_locked or externally_unlocked
        local buildable = fleet_buildable and crew_buildable and initial_lock_allows

        if self.fleet_categories[unit_type_name] then
            OutputDebug(
                "[FLEET_RATIO_DEBUG] apply unit=%s category=%s crew=%s fleet=%s final=%s engine_name=%s",
                tostring(unit_type_name),
                tostring(self.fleet_categories[unit_type_name]),
                tostring(crew_buildable),
                tostring(fleet_buildable),
                tostring(buildable),
                tostring(engine_unit_name)
            )
        end

        UnitUtil.SetBuildable(self.human, engine_unit_name, buildable)
    end

    -- crossplot:publish("UPDATED_AVAILABILITY", "empty")
end

function LockBasedResourceManager:on_battle_end()
    --Logger:trace("entering LockBasedResourceManager:on_battle_end")

    crossplot:publish("CREW_BATTLE_ENDED", "empty")

end

return LockBasedResourceManager
