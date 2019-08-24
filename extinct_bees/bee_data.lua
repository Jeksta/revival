bee.data = {
    test = {
        lifespan = 5,
        flower = {radius = 2, count = 5},
        drops = {
            {item = "revival:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 4},
            {item = "default:diamond", chance = 1, min_drop = 0, max_drop = 1}
        },
        mutation = {
            {drone = "test", mutation = "test", chance = 10}
        }
    },
    ancient = {
        lifespan = 120,
        flower = {radius = 2, count = 6},
        drops = {
            {item = "revival:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:mossycobble", chance = 2, min_drop = 0, max_drop = 2}
        },
        mutation = {}
    },
    relic = {
        lifespan = 150,
        flower = {radius = 4, count = 10},
        drops = {
            {item = "revival:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:sand", chance = 1, min_drop = 0, max_drop = 1}
        },
        mutation = {}
    },
    glacial = {
        lifespan = 180,
        flower = {radius = 1, count = 4},
        drops = {
            {item = "revival:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:snow", chance = 3, min_drop = 1, max_drop = 6}
        },
        mutation = {}
    },
    primal = {
        lifespan = 100,
        flower = {radius = 3, count = 5},
        drops = {
            {item = "revival:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:flint", chance = 5, min_drop = 0, max_drop = 2}
        },
        mutation = {}
    }
}
