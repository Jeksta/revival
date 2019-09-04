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
    "revival:apple_juice",
    {
        description = "Apple Juice",
        inventory_image = "revival_apple_juice.png",
        wield_image = "revival_apple_juice.png",
        groups = {fruit = 1, liquid = 1},
        on_use = minetest.item_eat(4)
    }
)

minetest.register_craftitem(
    "revival:fruit_mush",
    {
        description = "Fruit Mush",
        inventory_image = "revival_fruit_mush.png",
        wield_image = "revival_fruit_mush.png",
        groups = {fruit = 1, solid = 1},
        on_use = minetest.item_eat(1)
    }
)

minetest.register_craftitem(
    "revival:crank",
    {
        description = "Crank",
        inventory_image = "revival_crank.png",
        wield_image = "revival_crank.png"
        --groups = {fruit = 1}
    }
)
