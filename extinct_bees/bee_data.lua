local CLOSE = {radius = 1, count = 3}
local NORMAL_CLOSE = {radius = 2, count = 6}
local NORMAL_FAR = {radius = 3, count = 8}
local FAR = {radius = 4, count = 12}

-- sometime later when i have more combs
--local DEFAULT_COMB = {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3}

extinct_bees.data = {
    test = {
        color = {"#e7ce66f0"},
        lifespan = 5,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:diamond", chance = 1, min_drop = 0, max_drop = 1}
        },
        mutation = {
            {drone = "test", mutation = "test", chance = 10},
            {drone = "coral", mutation = "mummified", chance = 2}
        }
    },
    ancient = {
        color = {"#dacda3f0"},
        lifespan = 125,
        flower = NORMAL_CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:mossycobble", chance = 2, min_drop = 0, max_drop = 2}
        },
        mutation = {
            {drone = "relic", mutation = "dry", chance = 10},
            {drone = "tropical", mutation = "dry", chance = 6.66},
            {drone = "glacial", mutation = "snowy", chance = 10},
            {drone = "floaty", mutation = "snowy", chance = 6.66},
            {drone = "primal", mutation = "gentle", chance = 10},
            {drone = "worker", mutation = "gentle", chance = 6.66}
        }
    },
    relic = {
        color = {"#c6b165f0"},
        lifespan = 125,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:sand", chance = 1, min_drop = 0, max_drop = 1}
        },
        mutation = {
            {drone = "ancient", mutation = "dry", chance = 10},
            {drone = "gentle", mutation = "dry", chance = 6.66},
            {drone = "glacial", mutation = "worker", chance = 10},
            {drone = "tropical", mutation = "worker", chance = 6.66},
            {drone = "primal", mutation = "tropical", chance = 10},
            {drone = "gentle", mutation = "tropical", chance = 6.66}
        }
    },
    glacial = {
        color = {"#7fabd4f0"},
        lifespan = 175,
        flower = CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:snow", chance = 3, min_drop = 1, max_drop = 6}
        },
        mutation = {
            {drone = "relic", mutation = "worker", chance = 10},
            {drone = "floaty", mutation = "worker", chance = 6.66},
            {drone = "ancient", mutation = "snowy", chance = 10},
            {drone = "dry", mutation = "snowy", chance = 6.66},
            {drone = "primal", mutation = "floaty", chance = 10},
            {drone = "worker", mutation = "floaty", chance = 6.66}
        }
    },
    primal = {
        color = {"#80d0b1f0"},
        lifespan = 150,
        flower = NORMAL_FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:flint", chance = 5, min_drop = 0, max_drop = 2}
        },
        mutation = {
            {drone = "relic", mutation = "tropical", chance = 10},
            {drone = "dry", mutation = "tropical", chance = 6.66},
            {drone = "glacial", mutation = "floaty", chance = 10},
            {drone = "snowy", mutation = "floaty", chance = 6.66},
            {drone = "ancient", mutation = "gentle", chance = 10},
            {drone = "snowy", mutation = "gentle", chance = 6.66}
        }
    },
    -- Desert Branch
    dry = {
        color = {"#b59c7ff0", "#313028ff"},
        lifespan = 325,
        flower = NORMAL_CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:sandstonextinct_beesrick", chance = 4, min_drop = 0, max_drop = 4}
        },
        mutation = {
            {drone = "tropical", mutation = "barb", chance = 8.33},
            {drone = "blossom", mutation = "barb", chance = 5},
            {drone = "worker", mutation = "rural", chance = 8.33},
            {drone = "barb", mutation = "shrub", chance = 10}
        }
    },
    barb = {
        color = {"#66a366f0", "#313028ff"},
        lifespan = 325,
        flower = NORMAL_FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:cactus", chance = 2, min_drop = 0, max_drop = 2}
        },
        mutation = {
            {drone = "dry", mutation = "shrub", chance = 10}
        }
    },
    shrub = {
        color = {"#aabb77f0", "#313028ff"},
        lifespan = 325,
        flower = NORMAL_CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:sandstonextinct_beesrick", chance = 3, min_drop = 0, max_drop = 5}
        },
        mutation = {
            {drone = "unknown", mutation = "mummified", chance = 20}
        }
    },
    mummified = {
        color = {"#fbf8f1f0", "#514545ff"},
        lifespan = 325,
        flower = NORMAL_FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:paper", chance = 5, min_drop = 1, max_drop = 4}
        },
        mutation = {}
    },
    -- Arctic Branch
    snowy = {
        color = {"#8fbbe4f0", "#2f3d48ff"},
        lifespan = 400,
        flower = CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:snow", chance = 2, min_drop = 0, max_drop = 10}
        },
        mutation = {
            {drone = "gentle", mutation = "fluffy", chance = 8.33},
            {drone = "coral", mutation = "fluffy", chance = 5},
            {drone = "floaty", mutation = "coral", chance = 8.33},
            {drone = "fluffy", mutation = "powdery", chance = 10}
        }
    },
    fluffy = {
        color = {"#d0ccccf0", "#2f3333ff"},
        lifespan = 400,
        flower = NORMAL_CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "farming:cotton", chance = 3, min_drop = 1, max_drop = 5}
        },
        mutation = {
            {drone = "snowy", mutation = "powdery", chance = 10}
        }
    },
    powdery = {
        color = {"#c4d1d7f0", "#4b7585ff"},
        lifespan = 400,
        flower = CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:snow", chance = 2, min_drop = 0, max_drop = 10}
        },
        mutation = {}
    },
    icy = {
        color = {"#79dbe2f0", "#067881ff"},
        lifespan = 400,
        flower = NORMAL_CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:ice", chance = 5, min_drop = 0, max_drop = 3}
        },
        mutation = {
            {drone = "powdery", mutation = "sholing", chance = 20}
        }
    },
    -- Noble Branch
    gentle = {
        color = {"#ded1dcf0", "#7f6065ff"},
        lifespan = 350,
        flower = NORMAL_FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "dye:white", chance = 2, min_drop = 0, max_drop = 2}
        },
        mutation = {
            {drone = "relic", mutation = "tropical", chance = 6.66},
            {drone = "snowy", mutation = "fluffy", chance = 8.33},
            {drone = "worker", mutation = "imperial", chance = 8.33},
            {drone = "rural", mutation = "imperial", chance = 5},
            {drone = "imperial", mutation = "titled", chance = 10}
        }
    },
    imperial = {
        color = {"#6687e7f0", "#440000ff"},
        lifespan = 350,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:iron_lump", chance = 3, min_drop = 0, max_drop = 1}
        },
        mutation = {
            {drone = "gentle", mutation = "titled", chance = 10}
        }
    },
    titled = {
        color = {"#b29600f0", "#440000ff"},
        lifespan = 350,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "dye:red", chance = 2, min_drop = 0, max_drop = 2}
        },
        mutation = {
            {drone = "powdery", mutation = "pure", chance = 20}
        }
    },
    pure = {
        color = {"#fffffff0", "#b29600ff"},
        lifespan = 350,
        flower = NORMAL_CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:gold_lump", chance = 2, min_drop = 0, max_drop = 2}
        },
        mutation = {}
    },
    -- Agrarian Branch
    worker = {
        color = {"#f5ff00f0", "#0c0c4fff"},
        lifespan = 375,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "farming:seed_wheat", chance = 4, min_drop = 0, max_drop = 3}
        },
        mutation = {
            {drone = "ancient", mutation = "gentle", chance = 6.66},
            {drone = "gentle", mutation = "imperial", chance = 8.33},
            {drone = "dry", mutation = "rural", chance = 8.33},
            {drone = "imperial", mutation = "rural", chance = 5},
            {drone = "rural", mutation = "field", chance = 10}
        }
    },
    rural = {
        color = {"#bbbb00f0", "#003300ff"},
        lifespan = 375,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "farming:wheat", chance = 1, min_drop = 0, max_drop = 3}
        },
        mutation = {
            {drone = "worker", mutation = "field", chance = 10}
        }
    },
    field = {
        color = {"#aaaa00f0", "#3c2807ff"},
        lifespan = 375,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "farming:seed_wheat", chance = 3, min_drop = 0, max_drop = 3}
        },
        mutation = {
            {drone = "citric", mutation = "fruity", chance = 20}
        }
    },
    fruity = {
        color = {"#ffffddf0", "#500200ff"},
        lifespan = 375,
        flower = NORMAL_FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:apple", chance = 3, min_drop = 0, max_drop = 2}
        },
        mutation = {}
    },
    -- Exotic Branch
    tropical = {
        color = {"#00aaaaf0", "#005500ff"},
        lifespan = 325,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:junglewood", chance = 3, min_drop = 0, max_drop = 3}
        },
        mutation = {
            {drone = "ancient", mutation = "dry", chance = 6.66},
            {drone = "relic", mutation = "worker", chance = 6.66},
            {drone = "dry", mutation = "barb", chance = 8.33},
            {drone = "floaty", mutation = "blossom", chance = 8.33},
            {drone = "fluffy", mutation = "blossom", chance = 5},
            {drone = "blossom", mutation = "citric", chance = 10}
        }
    },
    blossom = {
        color = {"#ff99c8f0", "#66002fff"},
        lifespan = 325,
        flower = NORMAL_FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "flowers:geranium", chance = 4, min_drop = 0, max_drop = 2},
            {item = "flowers:chrysanthemum_green", chance = 4, min_drop = 0, max_drop = 2},
            {item = "flowers:dandelion_white", chance = 4, min_drop = 0, max_drop = 2}
        },
        mutation = {
            {drone = "tropical", mutation = "citric", chance = 10}
        }
    },
    citric = {
        color = {"#b2b200f0", "#4c4c00ff"},
        lifespan = 325,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:junglewood", chance = 2, min_drop = 0, max_drop = 3}
        },
        mutation = {
            {drone = "abyss", mutation = "unknown", chance = 20}
        }
    },
    unknown = {
        color = {"#999999f0", "#444444ff"},
        lifespan = 325,
        flower = CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:obsidian", chance = 8, min_drop = 0, max_drop = 2}
        },
        mutation = {}
    },
    -- Oceanic Bran
    floaty = {
        color = {"#4f8ba4f0", "#1f2d38ff"},
        lifespan = 350,
        flower = NORMAL_CLOSE,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:glass", chance = 4, min_drop = 0, max_drop = 3}
        },
        mutation = {
            {drone = "ancient", mutation = "snowy", chance = 6.66},
            {drone = "tropical", mutation = "blossom", chance = 8.33},
            {drone = "snowy", mutation = "coral", chance = 8.33},
            {drone = "barb", mutation = "coral", chance = 5},
            {drone = "coral", mutation = "sholing", chance = 10}
        }
    },
    coral = {
        color = {"#aaaaaaf0", "#49345fff"},
        lifespan = 350,
        flower = NORMAL_FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:coral_brown", chance = 5, min_drop = 0, max_drop = 1},
            {item = "default:coral_orange", chance = 5, min_drop = 0, max_drop = 1}
        },
        mutation = {
            {drone = "floaty", mutation = "sholing", chance = 10}
        }
    },
    shoaling = {
        color = {"#4f8ba4f0", "#004c4cff"},
        lifespan = 350,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:glass", chance = 2, min_drop = 0, max_drop = 3}
        },
        mutation = {
            {drone = "field", mutation = "abyss", chance = 20}
        }
    },
    abyss = {
        color = {"#1f5b74f0", "#1f2d38ff"},
        lifespan = 350,
        flower = FAR,
        drops = {
            {item = "extinct_bees:honey_comb_filled", chance = 4, min_drop = 1, max_drop = 3},
            {item = "default:sand_with_kelp", chance = 2, min_drop = 0, max_drop = 2}
        },
        mutation = {}
    }
}

-- register default bees
for species, data in pairs(extinct_bees.data) do
    extinct_bees.add_species(species, data.color)
end
