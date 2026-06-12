require("deepcore/std/class")
require("deepcore/crossplot/crossplot")
require("eawx-util/GalacticUtil")
require("eawx-util/ChangeOwnerUtilities")
require("TRCommands")
require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("UnitSwitcherLibrary")
require("eawx-util/Sort")
CONSTANTS = ModContentLoader.get("GameConstants")

---@class GovernmentEmpire
GovernmentEmpire = class()

function GovernmentEmpire:new(gc, absorb, _, id)
    self.id = id

    self.PlayerHuman = Find_Player("local")
    self.HumanFactionName = self.PlayerHuman.Get_Faction_Name()

    self.StartingEra = GlobalValue.Get("CURRENT_ERA")

    GlobalValue.Set("IMPERIAL_REGIME_HOST", "EMPIRE")

    self.PlanetTable = require("eawx-util/PlanetTable")

    self.human_is_imperial = false
    if Find_Player("EMPIRE").Is_Human() then
        self.human_is_imperial = true
    end

    self.ORBIT_COMBAT_POWER_THRESHOLD = 15000
    self.MAX_STRUCTURE_KILLS = 2
    self.MAX_GROUND_UNIT_KILLS = 2
    -- Bombardment cost settings
    self.BOMBARDMENT_COST_PERCENT = 0.15 -- 15% of total fleet build cost by default
    self.BOMBARDMENT_COST_MIN = 2000 -- minimum charge
    self.SHIELD_WARNING_TEXT = "Orbital bombardment blocked: planetary shield detected."
    self.CONCLUDED_TEXT = "Orbital bombardment concluded."

    self.galactic_hero_killed_event = gc.Events.GalacticHeroKilled
    self.galactic_hero_killed_event:attach_listener(self.on_galactic_hero_killed, self)

    self.planet_owner_changed_event = gc.Events.PlanetOwnerChanged
    self.planet_owner_changed_event:attach_listener(self.on_planet_owner_changed, self)

    self.production_finished_event = gc.Events.GalacticProductionFinished
    self.production_finished_event:attach_listener(self.on_production_finished, self)

    crossplot:subscribe("FACTION_DISPLAY_NAME_CHANGE", self.faction_display_name_change, self)
    crossplot:subscribe("LOADOUT_OPTION_CHOICE", self.change_loadout, self)
	crossplot:subscribe("LOADOUT_OPTION_SELECTED", self.loadout_Set_Selected, self)
    crossplot:subscribe("BOMBARDMENT_CALLED_PLAYER", self.orbital_bombardment, self)
    if self.human_is_imperial == true then
        crossplot:subscribe("UPDATE_GOVERNMENT", self.UpdateDisplay, self)
    end
end

function GovernmentEmpire:update()
    --Logger:trace("entering GovernmentEmpire:Update")
    return
end

function GovernmentEmpire:change_loadout()
	local current_loadout = GlobalValue.Get("CUSTOM_LOADOUT")
	DebugMessage(
		"%s -- change_loadout opened, current CUSTOM_LOADOUT: %s",
		tostring(Script),
		tostring(current_loadout)
	)
	StoryUtil.ShowScreenText("Current loadout: " .. tostring(current_loadout), 10)
	local options = {"FULL_FIGHTER", "FULL_BOMBER", "MIXED"}
	crossplot:publish("POPUPEVENT", "LOADOUT", options, "LOADOUT_OPTION_SELECTED")
end

function GovernmentEmpire:loadout_Set_Selected(selected_option)
	StoryUtil.ShowScreenText("Selected option: " .. tostring(selected_option), 10)
	if selected_option == "LOADOUT_FULL_FIGHTER" or selected_option == "FULL_FIGHTER" then
		GlobalValue.Set("CUSTOM_LOADOUT", "FULL_FIGHTER")
	elseif selected_option == "LOADOUT_FULL_BOMBER" or selected_option == "FULL_BOMBER" then
		GlobalValue.Set("CUSTOM_LOADOUT", "FULL_BOMBER")
	elseif selected_option == "LOADOUT_MIXED" or selected_option == "MIXED" then
		GlobalValue.Set("CUSTOM_LOADOUT", "MIXED")
	else
		StoryUtil.ShowScreenText("Loadout selection was invalid/nil.", 10)
		DebugMessage(
			"%s -- loadout_Set_Selected received unexpected option: %s",
			tostring(Script),
			tostring(selected_option)
		)
		return
	end

	local new_loadout = GlobalValue.Get("CUSTOM_LOADOUT")
	DebugMessage(
		"%s -- loadout_Set_Selected: option=%s, new CUSTOM_LOADOUT=%s",
		tostring(Script),
		tostring(selected_option),
		tostring(new_loadout)
	)
	StoryUtil.ShowScreenText("Selected loadout: " .. tostring(new_loadout), 10)
end

function GovernmentEmpire:on_galactic_hero_killed(hero_name, owner, killer)
    --Logger:trace("entering GovernmentEmpire:on_galactic_hero_killed")
    return
end

function GovernmentEmpire:on_planet_owner_changed(planet, new_owner_name, old_owner_name)
    --Logger:trace("entering GovernmentEmpire:on_planet_owner_changed")
    return
end

function GovernmentEmpire:on_production_finished(planet, game_object_type_name)
    --Logger:trace("entering GovernmentEmpire:on_production_finished")
    return
end

function GovernmentEmpire:check_leader_dead(hero_team_name)
    return
end

function GovernmentEmpire:get_orbital_cp(units)
    local total_combat_power = 0

    for _, unit in pairs(units) do
        if TestValid(unit) and is_valid_category(unit, "spaceOnly") then
            local unit_type = unit.Get_Type and unit.Get_Type()
            if unit_type and unit_type.Get_Combat_Rating then
                total_combat_power = total_combat_power + unit_type.Get_Combat_Rating()
            end
        end
    end

    return total_combat_power
end

function GovernmentEmpire:is_ground_unit(unit)
    return unit.Is_Category
        and (unit.Is_Category("Infantry")
        or unit.Is_Category("Vehicle")
        or unit.Is_Category("AirGunship")
        or unit.Is_Category("AirSpeeder"))
end

function GovernmentEmpire:collect_ground_targets(planet_object, planet_owner)
    local structure_candidates = {}
    local unit_candidates = {}

    local owner_objects = Find_All_Objects_Of_Type(planet_owner) or {}
    for _, object in pairs(owner_objects) do
        if TestValid(object) and object.Get_Planet_Location and object.Get_Planet_Location() == planet_object then
            local is_gts_immune = object.Has_Property and object.Has_Property("GTSImmune")
            if not is_gts_immune then
                if object.Is_Category and object.Is_Category("Structure") then
                    table.insert(structure_candidates, object)
                elseif self:is_ground_unit(object) then
                    table.insert(unit_candidates, object)
                end
            end
        end
    end

    return structure_candidates, unit_candidates
end

function GovernmentEmpire:announce_despawn(victim, planet_object)
    if not TestValid(victim) then
        return false
    end

    if victim.Despawn then
        victim.Despawn()
    elseif victim.Kill then
        victim.Kill()
    end

    if planet_object.Attach_Particle_Effect then
        planet_object.Attach_Particle_Effect("Galactic_GtS_Attrition_Explosion")
    end

    return true
end

function GovernmentEmpire:kill_random_target(targets, planet_object, max_kills)
    local kills = 0

    while kills < max_kills and table.getn(targets) > 0 do
        local index = GameRandom.Free_Random(1, table.getn(targets))
        local victim = table.remove(targets, index)

        if self:announce_despawn(victim, planet_object) then
            kills = kills + 1
        end
    end

    return kills
end

function GovernmentEmpire:announce_bombard_end()
    StoryUtil.ShowScreenText(self.CONCLUDED_TEXT, 10)
end

function GovernmentEmpire:announce_bombard_shield()
    StoryUtil.ShowScreenText(self.SHIELD_WARNING_TEXT, 10)
end

function GovernmentEmpire:compute_bombardment_cost(units)
    local total_build_cost = 0
    for _, u in pairs(units) do
        if TestValid(u) and u.Get_Game_Scoring_Type then
            local gst = u.Get_Game_Scoring_Type and u.Get_Game_Scoring_Type()
            if gst and gst.Get_Build_Cost then
                total_build_cost = total_build_cost + gst.Get_Build_Cost()
            end
        end
    end

    local cost = tonumber(Dirty_Floor(total_build_cost * self.BOMBARDMENT_COST_PERCENT + 0.5))
    if not cost then
        cost = 0
    end
    if cost < self.BOMBARDMENT_COST_MIN then
        cost = self.BOMBARDMENT_COST_MIN
    end

    return cost
end

function GovernmentEmpire:charge_for_bombardment(cost)
    if not TestValid(self.PlayerHuman) then
        return false
    end

    local credits = self.PlayerHuman.Get_Credits and self.PlayerHuman.Get_Credits()
    if not credits or credits < cost then
        if StoryUtil and StoryUtil.ShowScreenText then
            StoryUtil.ShowScreenText("Insufficient funds for orbital bombardment: need " .. tostring(cost) .. ", have " .. tostring(credits or 0), 10)
        end
        return false
    end

    -- Deduct cost (Give_Money accepts negative values to remove funds)
    if self.PlayerHuman.Give_Money then
        self.PlayerHuman.Give_Money(-cost)
    end

    return true
end

-- Helper: attempt an orbital strike on the currently selected planet.
-- The selected planet is resolved from the global selected-planet name.
-- Returns true if a unit was killed, false otherwise.
function GovernmentEmpire:orbital_bombardment()
    local selected_planet_name = GlobalValue.Get("SELECTED_PLANET")
    if not selected_planet_name then
        return false
    end

    local planet_object = FindPlanet(selected_planet_name)
    if not TestValid(planet_object) then
        return false
    end

    local planet_owner = nil
    if planet_object.Get_Owner then
        planet_owner = planet_object.Get_Owner()
    end

    if not TestValid(planet_object) or not TestValid(planet_owner) then
        return false
    end

    -- don't strike your own planets
    if planet_owner == self.PlayerHuman then
        return false
    end

    -- A planetary shield blocks orbital bombardment outright.
    if EvaluatePerception("Planetary_Shield_Present", planet_owner, planet_object) > 0 then
        self:announce_bombard_shield()
        return false
    end

    -- Find if the human player has any allied ships in orbit over this planet.
    local friendly_orbiting_units = get_friendly_units_on_planet(self.PlayerHuman, planet_object) or {}
    local friendly_orbiting_ships = {}
    for _, unit in pairs(friendly_orbiting_units) do
        if TestValid(unit) and is_valid_category(unit, "spaceOnly") then
            table.insert(friendly_orbiting_ships, unit)
        end
    end

    -- Require at least one Frigate or Capital in orbit (corvettes alone cannot bombard)
    local has_required_ship = false
    for _, ship in pairs(friendly_orbiting_ships) do
        if TestValid(ship) and ship.Is_Category and (ship.Is_Category("AntiFrigate") or ship.Is_Category("AntiCapital")) then
            has_required_ship = true
            break
        end
    end
    if not has_required_ship then
        return false
    end

    local orbit_combat_power = self:get_orbital_cp(friendly_orbiting_ships)
    local structure_candidates, unit_candidates = self:collect_ground_targets(planet_object, planet_owner)

    if orbit_combat_power < self.ORBIT_COMBAT_POWER_THRESHOLD then
        local candidates = {}
        for _, unit in pairs(structure_candidates) do table.insert(candidates, unit) end
        for _, unit in pairs(unit_candidates) do table.insert(candidates, unit) end

        if table.getn(candidates) == 0 then
            self:announce_bombard_end()
            return false
        end

        local victim = candidates[GameRandom.Free_Random(1, table.getn(candidates))]

        -- Charge the player before executing the bombardment
        local cost = self:compute_bombardment_cost(friendly_orbiting_ships)
        if StoryUtil and StoryUtil.ShowScreenText then
            StoryUtil.ShowScreenText("Orbital bombardment cost: " .. tostring(cost) .. " credits", 10)
        end
        if not self:charge_for_bombardment(cost) then
            return false
        end

        local result = self:announce_despawn(victim, planet_object)
        self:announce_bombard_end()
        return result
    end

    -- Charge the player before executing the bombardment
    local cost = self:compute_bombardment_cost(friendly_orbiting_ships)
    if StoryUtil and StoryUtil.ShowScreenText then
        StoryUtil.ShowScreenText("Orbital bombardment cost: " .. tostring(cost) .. " credits", 10)
    end
    if not self:charge_for_bombardment(cost) then
        return false
    end

    local total_kills = 0
    total_kills = total_kills + self:kill_random_target(structure_candidates, planet_object, self.MAX_STRUCTURE_KILLS)
    total_kills = total_kills + self:kill_random_target(unit_candidates, planet_object, self.MAX_GROUND_UNIT_KILLS)

    self:announce_bombard_end()

    return total_kills > 0
end

---@param player_name string (must be XML faction name)
---@param new_display_name string
---@param new_particle string (must be XML particle name)
function GovernmentEmpire:faction_display_name_change(player_name, new_display_name, new_particle)
    if new_display_name then
        CONSTANTS.ALL_FACTION_TEXTS[player_name] = new_display_name
        CONSTANTS.ALL_FACTION_NAMES[player_name] = new_display_name
    end

    if new_particle then
        CONSTANTS.PARTICLES[player_name] = new_particle
    end
end

function GovernmentEmpire:UpdateDisplay()
    --Logger:trace("entering GovernmentEmpire:UpdateDisplay")
    if self.human_is_imperial ~= true then
        return
    end

    local plot = Get_Story_Plot("Conquests\\Player_Agnostic_Plot.xml")
    local government_display_event = plot.Get_Event("Government_Display")

    government_display_event.Clear_Dialog_Text()

    government_display_event.Set_Reward_Parameter(1, self.PlayerHuman.Get_Faction_Name())

    government_display_event.Add_Dialog_Text("TEXT_GOVERNMENT_EMPIRE_HEADER")
    government_display_event.Add_Dialog_Text("TEXT_DOCUMENTATION_BODY_SEPARATOR")
    government_display_event.Add_Dialog_Text("TEXT_GOVERNMENT_EMPIRE_DESCRIPTION")

    Story_Event("GOVERNMENT_DISPLAY")
end

return GovernmentEmpire
