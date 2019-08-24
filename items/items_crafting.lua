--[[minetest.register_craft(
    {
        type = "shapeless",
        output = "revival:insect_parts 2",
        recipe = {
            "revival:scalpel",
            "group:catchable"
        }
    }
)]]
craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "revival:insect_parts 2",
        recipe = {
            {"butterflies:butterfly_white"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "revival:insect_parts 2",
        recipe = {
            {"butterflies:butterfly_red"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "revival:insect_parts 2",
        recipe = {
            {"butterflies:butterfly_violet"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "revival:insect_parts 2",
        recipe = {
            {"fireflies:firefly"}
        }
    }
)

minetest.register_craft(
    {
        type = "shaped",
        output = "revival:crown",
        recipe = {
            {"default:gold_ingot", "", "default:gold_ingot"},
            {"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"}
        }
    }
)

minetest.register_craft(
    {
        type = "shaped",
        output = "revival:empty_syringe 2",
        recipe = {
            {"vessels:glass_bottle", ""},
            {"", "default:steel_ingot"}
        }
    }
)

craft.register_craft(
    {
        type = "dissection",
        shape = "shaped",
        output = "revival:filled_syringe",
        recipe = {
            {"revival:amber_with_bee", "revival:empty_syringe"}
        }
    }
)
