minetest.register_node(
    "extinct_bees:amber_ore",
    {
        description = "Amber Ore",
        tiles = {"extinct_bees_amber_ore.png"},
        drop = {
            max_items = 2,
            items = {
                {items = {"extinct_bees:amber"}},
                {items = {"extinct_bees:amber"}, rarity = 1.33},
                {items = {"extinct_bees:amber_with_bee"}, rarity = 4}
            }
        },
        groups = {cracky = 3}
    }
)

minetest.register_ore(
    {
        ore_type = "scatter",
        ore = "extinct_bees:amber_ore",
        wherein = "default:stone",
        clust_scarcity = 10 * 10 * 10,
        clust_num_ores = 3,
        clust_size = 2,
        y_min = -64,
        y_max = 32
    }
)
