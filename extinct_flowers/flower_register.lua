function flower.register_flower(name, desc, box, f_groups)
    -- Common flowers' groups
    f_groups.snappy = 3
    f_groups.flower = 1
    f_groups.flora = 1
    f_groups.attached_node = 1

    minetest.register_node(
        "revival:" .. name,
        {
            description = desc,
            drawtype = "plantlike",
            waving = 1,
            tiles = {"revival_" .. name .. ".png"},
            inventory_image = "revival_" .. name .. ".png",
            wield_image = "revival" .. name .. ".png",
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

for _, item in pairs(flower.data) do
    flower.register_flower(unpack(item))
end
