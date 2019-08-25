--[[
    Normal Craft
]]
minetest.register_craft(
    {
        output = "extinct_bees:bee_hive",
        type = "shaped",
        recipe = {
            {"group:tree", "group:tree", "group:tree"},
            {"group:wood", "", "group:wood"},
            {"group:wood", "group:wood", "group:wood"}
        }
    }
)

minetest.register_craft(
    {
        type = "shaped",
        output = "extinct_bees:crown",
        recipe = {
            {"default:gold_ingot", "", "default:gold_ingot"},
            {"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"}
        }
    }
)

--[[
    Dissection Table
]]
craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:insect_parts 2",
        recipe = {
            {"butterflies:butterfly_white"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:insect_parts 2",
        recipe = {
            {"butterflies:butterfly_red"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:insect_parts 2",
        recipe = {
            {"butterflies:butterfly_violet"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:insect_parts 2",
        recipe = {
            {"fireflies:firefly"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:bee_dna",
        recipe = {
            {"extinct_bees:amber_with_bee", "revival:empty_syringe"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:ancient_drone",
        recipe = {
            {"extinct_bees:bee_dna", "extinct_bees:insect_parts", ""},
            {"extinct_bees:insect_parts", "default:cobble", "extinct_bees:insect_parts"},
            {"extinct_bees:insect_parts", "extinct_bees:insect_parts", "extinct_bees:insect_parts"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:ancient_queen",
        recipe = {
            {"extinct_bees:bee_dna", "extinct_bees:insect_parts", "extinct_bees:crown"},
            {"extinct_bees:insect_parts", "default:cobble", "extinct_bees:insect_parts"},
            {"extinct_bees:insect_parts", "extinct_bees:insect_parts", "extinct_bees:insect_parts"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:relic_drone",
        recipe = {
            {"extinct_bees:bee_dna", "extinct_bees:insect_parts", ""},
            {"extinct_bees:insect_parts", "default:desert_sand", "extinct_bees:insect_parts"},
            {"extinct_bees:insect_parts", "extinct_bees:insect_parts", "extinct_bees:insect_parts"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:relic_queen",
        recipe = {
            {"extinct_bees:bee_dna", "extinct_bees:insect_parts", "extinct_bees:crown"},
            {"extinct_bees:insect_parts", "default:desert_sand", "extinct_bees:insect_parts"},
            {"extinct_bees:insect_parts", "extinct_bees:insect_parts", "extinct_bees:insect_parts"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:glacial_drone",
        recipe = {
            {"extinct_bees:bee_dna", "extinct_bees:insect_parts", ""},
            {"extinct_bees:insect_parts", "default:snow", "extinct_bees:insect_parts"},
            {"extinct_bees:insect_parts", "extinct_bees:insect_parts", "extinct_bees:insect_parts"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:glacial_queen",
        recipe = {
            {"extinct_bees:bee_dna", "extinct_bees:insect_parts", "extinct_bees:crown"},
            {"extinct_bees:insect_parts", "default:snow", "extinct_bees:insect_parts"},
            {"extinct_bees:insect_parts", "extinct_bees:insect_parts", "extinct_bees:insect_parts"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:primal_drone",
        recipe = {
            {"extinct_bees:bee_dna", "extinct_bees:insect_parts", ""},
            {"extinct_bees:insect_parts", "default:gravel", "extinct_bees:insect_parts"},
            {"extinct_bees:insect_parts", "extinct_bees:insect_parts", "extinct_bees:insect_parts"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "extinct_bees:primal_queen",
        recipe = {
            {"extinct_bees:bee_dna", "extinct_bees:insect_parts", "extinct_bees:crown"},
            {"extinct_bees:insect_parts", "default:gravel", "extinct_bees:insect_parts"},
            {"extinct_bees:insect_parts", "extinct_bees:insect_parts", "extinct_bees:insect_parts"}
        }
    }
)
