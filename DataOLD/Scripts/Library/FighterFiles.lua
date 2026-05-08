function Get_Standard_Types()
    return {
        ["BLASTBOAT"] = true,
        ["BOMBER"] = true,
        ["BOMBER2"] = true,
        ["ELITE_FIGHTERBOMBER"] = true,
        ["ELITE_INTERCEPTOR"] = true,
        ["FIGHTER"] = true,
        ["HEAVY_BOMBER"] = true,
        ["HEAVY_FIGHTER"] = true,
        ["INTERCEPTOR"] = true,
        ["LIGHT_FIGHTER"] = true,
        ["LIGHT_FIGHTERBOMBER"] = true,

        -- Loadout wrapper keys (map to standard-fighters modules)
        ["LOADOUT_FULL_FIGHTERS"] = true,
        ["LOADOUT_FULL_BOMBERS"] = true,
        ["LOADOUT_MIXED_FIGHTERS"] = true,
        ["LOADOUT_MIXED_BOMBERS"] = true,
    }
end

function Get_Random_Types()
    return {
        ["CIVILIAN_BOMBER"] = true,
        ["CIVILIAN_FIGHTER"] = true,
        ["PIRATE_FIGHTER"] = true,
    }
end
