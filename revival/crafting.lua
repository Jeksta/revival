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
