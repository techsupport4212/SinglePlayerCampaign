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

    self.imperial_table = {
        ["EMPIRE"] = {
            controls_planets = false,
        },
    }

    self.human_is_imperial = false
    for faction_name, _ in pairs(self.imperial_table) do
        if Find_Player(faction_name).Is_Human() then
            self.human_is_imperial = true
        end
    end

    --SSD heroes who are leaders do not need to be on this list
    self.leader_table = {
        -- Green Empire leaders
        ["PESTAGE_TEAM"] = {"SATE_PESTAGE"},
        ["YSANNE_ISARD_TEAM"] = {"YSANNE_ISARD"},
        "HISSA_MOFFSHIP",
        "THRAWN_CHIMAERA",
        "FLIM_TIERCE_IRONHAND",

        -- Pentastar leaders
        ["ARDUS_KAINE_TEAM"] = {"ARDUS_KAINE"},

        -- Greater Maldrood leaders
        "TREUTEN_13X",
        "TREUTEN_CRIMSON_SUNRISE",
        "KOSH_LANCET",

        -- Zsinj's Empire leaders
        "ZSINJ_IRON_FIST_VSD",

        -- Eriadu Authority leaders
        "DELVARDUS_BRILLIANT",
        "DELVARDUS_THALASSA",

        -- Imperial leaders
        ["EMPEROR_PALPATINE_TEAM"] = {"EMPEROR_PALPATINE"},
        ["CARNOR_JAX_TEAM"] = {"CARNOR_JAX"},
        "DAALA_GORGON",
        "PELLAEON_CHIMAERA_GRAND"
    }

    --SSD heroes need to be on *this* list whether or not they are leaders
    self.hero_ssd_table = {
        ["ISARD_LUSANKYA"] = "TEXT_GOVERNMENT_EMPIRE_SSD_LEADER_ISARD",
        ["CRONUS_NIGHT_HAMMER"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_CRONUS_NIGHT_HAMMER",
        ["DELVARDUS_NIGHT_HAMMER"] = "TEXT_GOVERNMENT_EMPIRE_SSD_LEADER_DELVARDUS",
        ["DAALA_KNIGHT_HAMMER"] = "TEXT_GOVERNMENT_EMPIRE_SSD_LEADER_DAALA",
        ["PELLAEON_REAPER"] = "TEXT_GOVERNMENT_EMPIRE_SSD_LEADER_PELLAEON_REAPER",
        ["PELLAEON_MEGADOR"] = "TEXT_GOVERNMENT_EMPIRE_SSD_LEADER_PELLAEON_MEGADOR",
        ["ROGRISS_DOMINION"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_ROGRISS_DOMINION",
        ["KAINE_REAPER"] = "TEXT_GOVERNMENT_EMPIRE_SSD_LEADER_KAINE",
        ["SYSCO_VENGEANCE"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_SYSCO_VENGEANCE",
        ["ZSINJ_IRON_FIST_EXECUTOR"] = "TEXT_GOVERNMENT_EMPIRE_SSD_LEADER_ZSINJ",
        ["RASLAN_RAZORS_KISS"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_RASLAN_RAZORS_KISS",
        ["DROMMEL_GUARDIAN"] = "TEXT_GOVERNMENT_EMPIRE_SSD_WARLORD_DROMMEL",
        ["GRUNGER_AGGRESSOR"] = "TEXT_GOVERNMENT_EMPIRE_SSD_WARLORD_GRUNGER",
        ["GRONN_ACULEUS"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_GRONN",
        ["BALAN_JAVELIN"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_BALAN",
        ["KIEZ_WHELM"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_KIEZ",
        ["COMEG_BELLATOR"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_COMEG",
        ["X1_EXECUTOR"] = "TEXT_GOVERNMENT_EMPIRE_SSD_WARLORD_X1",
        ["THORN_ASSERTOR"] = "TEXT_GOVERNMENT_EMPIRE_SSD_HERO_THORN",
    }

    self.dead_leader_table = {}

    self.galactic_hero_killed_event = gc.Events.GalacticHeroKilled
    self.galactic_hero_killed_event:attach_listener(self.on_galactic_hero_killed, self)

    self.planet_owner_changed_event = gc.Events.PlanetOwnerChanged
    self.planet_owner_changed_event:attach_listener(self.on_planet_owner_changed, self)

    self.production_finished_event = gc.Events.GalacticProductionFinished
    self.production_finished_event:attach_listener(self.on_production_finished, self)

    crossplot:subscribe("FACTION_DISPLAY_NAME_CHANGE", self.faction_display_name_change, self)

    if self.human_is_imperial == true then
        crossplot:subscribe("UPDATE_GOVERNMENT", self.UpdateDisplay, self)
    end

    self.Events = {}
    self.Events.FactionIntegrated = Observable()
end

function GovernmentEmpire:update()
    --Logger:trace("entering GovernmentEmpire:Update")
    for faction_name, table in pairs(self.imperial_table) do
        if self.imperial_table[faction_name].controls_planets == true and EvaluatePerception("Planet_Ownership", Find_Player(faction_name)) == 0 then
            self.imperial_table[faction_name].controls_planets = false
        end
    end
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
   if not next(self.dead_leader_table) then
        return false
    else
        for _,dead_team_name in pairs(self.dead_leader_table) do
            if hero_team_name == dead_team_name then
                return true
            end
        end
    end
    return false
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
