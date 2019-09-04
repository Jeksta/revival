minetest.register_craft(
    {
        type = "shaped",
        output = "revival:dissection_table",
        recipe = {
            {"group:tree", "group:tree", "group:tree"},
            {"default:steel_ingot", "group:wood", "bucket:bucket_empty"},
            {"group:tree", "group:wood", "group:tree"}
        }
    }
)

minetest.register_craft(
    {
        type = "shaped",
        output = "revival:crank",
        recipe = {
            {"default:stick", "default:steel_ingot", "default:stick"},
            {"", "default:stick", ""}
        }
    }
)

minetest.register_craft(
    {
        type = "shaped",
        output = "revival:manual_press",
        recipe = {
            {"group:tree", "revival:crank", "group:tree"},
            {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
            {"group:tree", "group:tree", "group:tree"}
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

minetest.register_craft(
    {
        type = "shaped",
        output = "revival:diamond_scalpel",
        recipe = {
            {"default:diamond"},
            {"default:stick"}
        }
    }
)

minetest.register_craft(
    {
        type = "shaped",
        output = "revival:steel_scalpel",
        recipe = {
            {"default:steel_ingot"},
            {"default:stick"}
        }
    }
)

minetest.register_craft(
    {
        type = "shaped",
        output = "revival:stone_scalpel",
        recipe = {
            {"default:cobble"},
            {"default:stick"}
        }
    }
)

--[[
    Press
]]
craft.register_craft(
    {
        type = "press",
        required_turns = 5,
        output = {"revival:apple_juice", "revival:fruit_mush"},
        recipe = "default:apple"
    }
)
