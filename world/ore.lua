minetest.register_node(
    "revival:amber_ore",
    {
        description = "Amber Ore",
        tiles = {"revival_amber_ore.png"},
        drop = {
            max_items = 2,
            items = {
                {items = {"revival:amber"}},
                {items = {"revival:amber"}, rarity = 1.33},
                {items = {"revival:amber_with_bee"}, rarity = 4}
            }
        },
        groups = {cracky = 3}
    }
)
