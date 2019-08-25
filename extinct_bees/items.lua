minetest.register_craftitem(
    "extinct_bees:amber",
    {
        description = "Amber",
        inventory_image = "extinct_bees_amber.png",
        wield_image = "extinct_bees_amber.png",
        groups = {amber = 1}
    }
)

minetest.register_craftitem(
    "extinct_bees:amber_with_bee",
    {
        description = "Amber with enclosed Bee",
        inventory_image = "extinct_bees_amber_with_bee.png",
        wield_image = "extinct_bees_amber_with_bee.png",
        groups = {amber = 1}
    }
)

minetest.register_craftitem(
    "extinct_bees:honey_comb_filled",
    {
        description = "Honey Comb",
        inventory_image = "extinct_bees_honey_comb_filled.png",
        wield_image = "extinct_bees_honey_comb_filled.png",
        groups = {comb = 1},
        on_use = minetest.item_eat(4)
    }
)

minetest.register_craftitem(
    "extinct_bees:insect_parts",
    {
        description = "Insect Parts",
        inventory_image = "extinct_bees_insect_parts.png",
        wield_image = "extinct_bees_insect_parts.png",
        groups = {bug = 1}
    }
)

minetest.register_craftitem(
    "extinct_bees:bee_dna",
    {
        description = "Bee DNA",
        inventory_image = "extinct_bees_bee_dna.png",
        wield_image = "extinct_bees_bee_dna.png"
        --groups = {}
    }
)

minetest.register_craftitem(
    "extinct_bees:crown",
    {
        description = "Crown",
        inventory_image = "extinct_bees_crown.png",
        wield_image = "extinct_bees_crown.png"
        --groups = {}
    }
)
