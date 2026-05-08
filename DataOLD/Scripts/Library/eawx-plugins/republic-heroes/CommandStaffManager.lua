-- TechSupport: imperial command staff manager, need to add in heroes and units but otherwise functional
require("deepcore/std/class")
require("HeroSystem")
require("eawx-util/StoryUtil")

---@class CommandStaffManager
CommandStaffManager = class()

---@param gc GalacticConquest
---@param id string
---@param human_player PlayerObject
function CommandStaffManager:new(gc, id, human_player)
    self.gc = gc
    self.id = id
    self.human_player = human_player
    self.empire_player = Find_Player("Empire")

    -- Tweak category limits here for balancing.
    self.default_category_slots = 1
    self.category_slot_limits = {
        GRAND_ADMIRALS = self.default_category_slots,
        SPACE_COMMANDERS = 2,
        GENERALS = 2,
        ADMINS = self.default_category_slots,
        SPECIAL_FORCES = 2
    }

    self.viewers = {
        ["VIEW_GRAND_ADMIRALS_EMPIRE"] = "GRAND_ADMIRALS",
        ["VIEW_SPACE_COMMANDERS_EMPIRE"] = "SPACE_COMMANDERS",
        ["VIEW_GENERALS_EMPIRE"] = "GENERALS",
        ["VIEW_ADMINS_EMPIRE"] = "ADMINS",
        ["VIEW_SPECIAL_FORCES_EMPIRE"] = "SPECIAL_FORCES"
    }

    self.object_dispatch = {}

    self.active_view = "GRAND_ADMIRALS"

    gc.Events.GalacticProductionFinished:attach_listener(self.on_production_finished, self)

    self:define_command_staff_data()

    if self.id == "ZAARIN" then
        self:unlock_view_buttons()
    end
end

---@param planet Planet
---@param object_type_name string
function CommandStaffManager:on_production_finished(planet, object_type_name)
    if not self.inited then
        self.inited = true
        for _, hero_data in pairs(self.library) do
            init_hero_system(hero_data)
        end
        self:switch_view(self.active_view)
    end

    local dispatch = self.object_dispatch[object_type_name]
    if dispatch == nil then
        return
    end

    if dispatch.kind == "view" then
        if self.human_player == self.empire_player then
            self:switch_view(dispatch.target)
            local viewer = Find_First_Object(object_type_name)
            if TestValid(viewer) then
                viewer.Despawn()
            end
        end
        return
    end

    if dispatch.kind == "hero" then
        Handle_Build_Options(object_type_name, dispatch.hero_data)
        return
    end

    if dispatch.kind == "retire" then
        local retire_dummy = Find_First_Object(object_type_name)
        if TestValid(retire_dummy) then
            retire_dummy.Despawn()
        end
        Handle_Hero_Despawn(dispatch.hero_data, dispatch.hero_tag)
        return
    end
end

function CommandStaffManager:define_command_staff_data()
    local empire = self.empire_player

    self.library = {
        ["GRAND_ADMIRALS"] = {
            total_slots = self:get_category_slots("GRAND_ADMIRALS"),
            free_hero_slots = self:get_category_slots("GRAND_ADMIRALS"),
            vacant_hero_slots = 0,
            vacant_limit = 0,
            initialized = false,
            retire_object = "RETIRE_GRAND_ADMIRALS_EMPIRE",
            full_list = {
                ["Teshik"] = {"TESHIK_ASSIGN", {"TESHIK_ELEEMOSYNARY"}, "Osvald Teshik", ["retire_object"] = "RETIRE_TESHIK", ["no_random"] = true},
                ["Batch"] = {"BATCH_ASSIGN", {"BATCH_MENISCUS"}, "Martio Batch", ["retire_object"] = "RETIRE_BATCH", ["no_random"] = true},
                ["IlRaz"] = {"IL_RAZ_ASSIGN", {"IL_RAZ_EMPERORSDISCIPLE"}, "Ishin-Il-Raz", ["retire_object"] = "RETIRE_IL_RAZ", ["no_random"] = true},
                ["Declann"] = {"DECLANN_ASSIGN", {"DECLANN_RECONDITE"}, "Nial Declann", ["retire_object"] = "RETIRE_DECLANN", ["no_random"] = true}
            },
            available_list = {"Teshik", "Batch", "IlRaz", "Declann"},
            story_locked_list = {},
            active_player = empire,
            extra_name = "EXTRA_GRAND_ADMIRALS_SLOT_DISABLED",
            random_name = "RANDOM_GRAND_ADMIRALS_ASSIGN",
            global_display_list = "GRAND_ADMIRALS_LIST",
            disabled = true
        },
        ["SPACE_COMMANDERS"] = {
            total_slots = self:get_category_slots("SPACE_COMMANDERS"),
            free_hero_slots = self:get_category_slots("SPACE_COMMANDERS"),
            vacant_hero_slots = 0,
            vacant_limit = 0,
            initialized = false,
            retire_object = "RETIRE_SPACE_COMMANDERS_EMPIRE",
            full_list = {
                ["Okins"] = {"OKINS_ASSIGN", {"OKINS_ALLEGIANCE"}, "Ledre Okins", ["retire_object"] = "RETIRE_OKINS", ["no_random"] = true},
                ["Coross"] = {"COROSS_ASSIGN", {"COROSS_VENGEANCE_II"}, "Coross", ["retire_object"] = "RETIRE_COROSS", ["no_random"] = true},
                ["Kermen"] = {"KERMEN_ASSIGN", {"KERMEN_BELLIGERENT"}, "Uther Kermen", ["retire_object"] = "RETIRE_KERMEN", ["no_random"] = true}
            },
            available_list = {"Okins", "Coross", "Kermen"},
            story_locked_list = {},
            active_player = empire,
            extra_name = "EXTRA_SPACE_COMMANDERS_SLOT_DISABLED",
            random_name = "RANDOM_SPACE_COMMANDERS_ASSIGN",
            global_display_list = "SPACE_COMMANDERS_LIST",
            disabled = true
        },
        ["GENERALS"] = {
            total_slots = self:get_category_slots("GENERALS"),
            free_hero_slots = self:get_category_slots("GENERALS"),
            vacant_hero_slots = 0,
            vacant_limit = 0,
            initialized = false,
            retire_object = "RETIRE_GENERALS_EMPIRE",
            full_list = {
                ["Covell"] = {"COVELL_ASSIGN", {"COVELL_AT_AT_WALKER"}, "Freja Covell", ["retire_object"] = "RETIRE_COVELL", ["Companies"] = {"COVELL_AT_AT_TEAM"}, ["no_random"] = true},
                ["Veers"] = {"VEERS_ASSIGN", {"VEERS_AT_AT_WALKER"}, "Maximilian Veers", ["retire_object"] = "RETIRE_VEERS", ["Companies"] = {"VEERS_AT_AT_TEAM"}, ["no_random"] = true},
                ["Ashen"] = {"ASHEN_ASSIGN", {"TAL_ASHEN_AT_AT_WALKER"}, "Tal Ashen", ["retire_object"] = "RETIRE_ASHEN", ["Companies"] = {"TAL_ASHEN_TEAM"}, ["no_random"] = true}
            },
            available_list = {"Covell", "Veers", "Ashen"},
            story_locked_list = {},
            active_player = empire,
            extra_name = "EXTRA_GENERALS_SLOT_EMPIRE",
            random_name = "RANDOM_GENERALS_ASSIGN_EMPIRE",
            global_display_list = "GENERALS_LIST",
            disabled = true
        },
        ["ADMINS"] = {
            total_slots = self:get_category_slots("ADMINS"),
            free_hero_slots = self:get_category_slots("ADMINS"),
            vacant_hero_slots = 0,
            vacant_limit = 0,
            initialized = false,
            retire_object = "RETIRE_ADMINS_EMPIRE",
            full_list = {
                ["Pestage"] = {"PESTAGE_ASSIGN", {"PESTAGE_CLONE"}, "Sate Pestage", ["retire_object"] = "RETIRE_PESTAGE", ["Companies"] = {"PESTAGE_TEAM"}, ["no_random"] = true},
                ["Dangor"] = {"DANGOR_ASSIGN", {"ARS_DANGOR"}, "Ars Dangor", ["retire_object"] = "RETIRE_DANGOR", ["Companies"] = {"ARS_DANGOR_TEAM"}, ["no_random"] = true}
            },
            available_list = {"Pestage", "Dangor"},
            story_locked_list = {},
            active_player = empire,
            extra_name = "EXTRA_ADMINS_SLOT_DISABLED",
            random_name = "RANDOM_ADMINS_ASSIGN",
            global_display_list = "ADMINS_LIST",
            disabled = true
        },
        ["SPECIAL_FORCES"] = {
            total_slots = self:get_category_slots("SPECIAL_FORCES"),
            free_hero_slots = self:get_category_slots("SPECIAL_FORCES"),
            vacant_hero_slots = 0,
            vacant_limit = 0,
            initialized = false,
            retire_object = "RETIRE_SPECIAL_FORCES",
            full_list = {
                ["Starkiller"] = {"STARKILLER_ASSIGN", {"DARK_APPRENTICE"}, "Starkiller", ["retire_object"] = "RETIRE_STARKILLER", ["Companies"] = {"DARK_APPRENTICE_TEAM"}, ["no_random"] = true},
                ["Bly"] = {"BLY_ASSIGN", {"BLY"}, "Bly", ["retire_object"] = "RETIRE_BLY", ["Companies"] = {"BLY_TEAM"}, ["no_random"] = true},
                ["Cody"] = {"CODY_ASSIGN", {"CODY"}, "Cody", ["retire_object"] = "RETIRE_CODY", ["Companies"] = {"CODY_TEAM"}, ["no_random"] = true},
                ["Tremayne"] = {"TREMAYNE_ASSIGN", {"ANTINNIS_TREMAYNE"}, " Antinnis Tremayne", ["retire_object"] = "RETIRE_TREMAYNE", ["Companies"] = {"ANTINNIS_TREMAYNE_TEAM"}, ["no_random"] = true},
                ["Strang"] = {"STRANG_ASSIGN", {"VICTOR_STRANG"}, " Victor Strang", ["retire_object"] = "RETIRE_STRANG", ["Companies"] = {"STRANG_TEAM"}, ["no_random"] = true}
            },
            available_list = {"Starkiller", "Bly", "Cody", "Tremayne", "Strang"},
            story_locked_list = {},
            active_player = empire,
            extra_name = "EXTRA_SPECIAL_FORCES_SLOT_DISABLED",
            random_name = "RANDOM_SPECIAL_FORCES_ASSIGN",
            global_display_list = "SPECIAL_FORCES_LIST",
            disabled = true
        }
    }

    for view_name, view_key in pairs(self.viewers) do
        self.object_dispatch[view_name] = { kind = "view", target = view_key }
    end

    for _, hero_data in pairs(self.library) do
        for hero_tag, entry in pairs(hero_data.full_list) do
            self.object_dispatch[entry[1]] = { kind = "hero", hero_data = hero_data }
            if entry.retire_object then
                self.object_dispatch[entry.retire_object] = { kind = "retire", hero_data = hero_data, hero_tag = hero_tag }
            end
        end
        self.object_dispatch[hero_data.retire_object] = { kind = "hero", hero_data = hero_data }
        self.object_dispatch[hero_data.random_name] = { kind = "hero", hero_data = hero_data }
        if hero_data.extra_name then
            self.object_dispatch[hero_data.extra_name] = { kind = "hero", hero_data = hero_data }
        end
    end

    for _, hero_data in pairs(self.library) do
        self:validate_hero_data_table(hero_data)
    end
end

---@param category_name string
---@return integer
function CommandStaffManager:get_category_slots(category_name)
    local category_slots = self.category_slot_limits[category_name]
    if category_slots and category_slots > 0 then
        return category_slots
    end
    return self.default_category_slots
end

function CommandStaffManager:unlock_view_buttons()
    if not self.empire_player.Is_Human() then
        return
    end

    for view_name, _ in pairs(self.viewers) do
        self.empire_player.Unlock_Tech(Find_Object_Type(view_name))
    end
end

---@param new_view string
function CommandStaffManager:switch_view(new_view)
    if not self.library[new_view] then
        return
    end

    if self.active_view and self.library[self.active_view] then
        self:set_retire_buttons_state(self.active_view, false)
        Disable_Hero_Options(self.library[self.active_view])
    end

    self.active_view = new_view

    Enable_Hero_Options(self.library[new_view])
    self:hide_category_retire_button(new_view)
    self:set_retire_buttons_state(new_view, true)
    Show_Hero_Info(self.library[new_view])
end

---@param category_name string
---@param should_unlock boolean
function CommandStaffManager:set_retire_buttons_state(category_name, should_unlock)
    if not self.library[category_name] then
        return
    end

    for _, hero_entry in pairs(self.library[category_name].full_list) do
        if hero_entry.retire_object then
            local retire_type = Find_Object_Type(hero_entry.retire_object)
            if TestValid(retire_type) then
                if should_unlock then
                    self.empire_player.Unlock_Tech(retire_type)
                else
                    self.empire_player.Lock_Tech(retire_type)
                end
            end
        end
    end
end

---@param category_name string
function CommandStaffManager:hide_category_retire_button(category_name)
    local hero_data = self.library[category_name]
    if not hero_data or not hero_data.retire_object then
        return
    end

    local retire_type = Find_Object_Type(hero_data.retire_object)
    if TestValid(retire_type) then
        self.empire_player.Lock_Tech(retire_type)
    end
end

---@param hero_data HeroData
function CommandStaffManager:validate_hero_data_table(hero_data)
    if not hero_data or not hero_data.full_list then
        return
    end

    for tag, data in pairs(hero_data.full_list) do
        local debug_text = ""
        local assign = data[1] or ""
        local units = data[2] or {}

        if not TestValid(Find_Object_Type(assign)) then
            debug_text = debug_text .. ", Assign: " .. assign
        end

        for i, unit in ipairs(units) do
            if not TestValid(Find_Object_Type(unit)) then
                debug_text = debug_text .. ", Unit" .. i .. ": " .. unit
            end
        end

        if data["Companies"] then
            for i, company in ipairs(data["Companies"]) do
                if not TestValid(Find_Object_Type(company)) then
                    debug_text = debug_text .. ", Company" .. i .. ": " .. company
                end
            end
        end

        if debug_text ~= "" then
            StoryUtil.ShowScreenText("BadTag: " .. tag .. debug_text, 15, nil, {r = 225, g = 150, b = 20})
        end
    end
end
