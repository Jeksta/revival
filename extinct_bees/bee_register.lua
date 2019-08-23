local function add_species(species)
    local desc = utils.first_to_upper(species)
    -- queen
    minetest.register_craftitem(
        "revival:" .. species .. "_queen",
        {
            description = desc .. " Queen",
            inventory_image = "revival_" .. species .. "_queen.png",
            wield_image = "revival_" .. species .. "_queen.png",
            stack_max = 1,
            groups = {bee = 1, queen = 1}
        }
    )
    -- drone
    minetest.register_craftitem(
        "revival:" .. species .. "_drone",
        {
            description = desc .. " Drone",
            inventory_image = "revival_" .. species .. "_drone.png",
            wield_image = "revival_" .. species .. "_drone.png",
            stack_max = 1,
            groups = {bee = 1, drone = 1}
        }
    )
end

function bee.register_bee_species(name, data)
    if not bee.data[name] then
        bee.data[name] = {}
    end

    table.insert(bee.data[name], data)
    add_species(name)
end

function bee.register_bees(data)
    for species, content in pairs(data) do
        bee.register_bee_species(species, content)
    end
end

-- register default bees
for species, _ in pairs(bee.data) do
    add_species(species)
end
