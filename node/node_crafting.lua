minetest.register_craft(
    {
        output = "revival:bee_hive",
        type = "shaped",
        --temporary
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
        output = "revival:dissection_table",
        recipe = {
            {"group:tree", "group:tree", "group:tree"},
            {"default:steel_ingot", "group:wood", "bucket:bucket_empty"},
            {"group:tree", "group:wood", "group:tree"}
        }
    }
)
