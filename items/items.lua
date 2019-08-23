minetest.register_craftitem(
    "revival:amber",
    {
        description = "Amber",
        inventory_image = "revival_amber.png",
        wield_image = "amber.png",
        groups = {amber = 1}
    }
)

minetest.register_craftitem(
    "revival:amber_with_bee",
    {
        description = "Amber with enclosed Bee",
        inventory_image = "revival_amber_with_bee.png",
        wield_image = "revival_amber_with_bee.png",
        groups = {amber = 1}
    }
)

minetest.register_craftitem(
    "revival:honey_comb_filled",
    {
        description = "Honey Comb",
        inventory_image = "revival_honey_comb_filled.png",
        wield_image = "revival_honey_comb_filled.png",
        groups = {comb = 1},
        on_use = minetest.item_eat(4)
    }
)

minetest.register_craftitem(
    "revival:insect_parts",
    {
        description = "Insect Parts",
        inventory_image = "revival_insect_parts.png",
        wield_image = "revival_insect_parts.png",
        groups = {bug = 1}
    }
)

minetest.register_craftitem(
    "revival:empty_syringe",
    {
        description = "Empty Syringe",
        inventory_image = "revival_empty_syringe.png",
        wield_image = "revival_empty_syringe.png"
        --groups = {}
    }
)

minetest.register_craftitem(
    "revival:filled_syringe",
    {
        description = "Filled Syringe",
        inventory_image = "revival_filled_syringe.png",
        wield_image = "revival_filled_syringe.png"
        --groups = {}
    }
)

minetest.register_craftitem(
    "revival:crown",
    {
        description = "Crown",
        inventory_image = "revival_crown.png",
        wield_image = "revival_crown.png"
        --groups = {}
    }
)
