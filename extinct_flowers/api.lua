function extinct_flowers.register_flower(name, desc, box, f_groups)
    -- Common flowers' groups
    f_groups.snappy = 3
    f_groups.flower = 1
    f_groups.flora = 1
    f_groups.attached_node = 1

    minetest.register_node(
        "extinct_flowers:" .. name,
        {
            description = desc,
            drawtype = "plantlike",
            waving = 1,
            tiles = {"extinct_flowers_" .. name .. ".png"},
            inventory_image = "extinct_flowers_" .. name .. ".png",
            wield_image = "extinct_flowers_" .. name .. ".png",
            sunlight_propagates = true,
            paramtype = "light",
            walkable = false,
            buildable_to = true,
            stack_max = 99,
            groups = f_groups,
            sounds = default.node_sound_leaves_defaults(),
            selection_box = {
                type = "fixed",
                fixed = box
            }
        }
    )
end
