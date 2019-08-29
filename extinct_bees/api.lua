function extinct_bees.add_species(species, color)
    local desc = utils.first_to_upper(species)

    -- color = {stripes, body, wings}

    -- body color
    if not color[2] then
        color[2] = "#000000c0"
    end
    -- wing color
    if not color[3] then
        color[3] = "#00000000"
    end

    -- queen
    minetest.register_craftitem(
        "extinct_bees:" .. species .. "_queen",
        {
            description = desc .. " Queen",
            inventory_image = "extinct_bees_bee_body2.png^[colorize:" ..
                color[2] ..
                    ":alpha]^extinct_bees_bee_wings.png^[colorize:" .. color[3] .. ":alpha]^extinct_bees_bee_crown.png",
            inventory_overlay = "extinct_bees_bee_stripes.png^[colorize:" .. color[1] .. ":alpha]",
            groups = {bee = 1, queen = 1}
        }
    )
    -- drone
    minetest.register_craftitem(
        "extinct_bees:" .. species .. "_drone",
        {
            description = desc .. " Drone",
            inventory_image = "extinct_bees_bee_body2.png^[colorize:" ..
                color[2] .. ":alpha]^extinct_bees_bee_wings.png^[colorize:" .. color[3] .. ":alpha]",
            inventory_overlay = "extinct_bees_bee_stripes.png^[colorize:" .. color[1] .. ":alpha]",
            groups = {bee = 1, drone = 1}
        }
    )
end

function extinct_bees.register_bee_species(name, data)
    if not extinct_bees.data[name] then
        extinct_bees.data[name] = {}
    end

    extinct_bees.data[name] = data
    --table.insert(extinct_bees.data[name], data)
    extinct_bees.add_species(name, data.color)
end

function extinct_bees.register_bees(data)
    for species, content in pairs(data) do
        extinct_bees.register_bee_species(species, content)
    end
end

--[[ 
    Helper functions
]]
function extinct_bees.get_species_properties(species)
    return extinct_bees.data[species]
end

-- turns bee name into species
function extinct_bees.get_species_from_name(name)
    name = string.gsub(name, "extinct_bees:", "")
    return string.sub(name, 1, name:find("_") - 1)
end

-- returns the possible mutation + chance
function extinct_bees.get_mutation(mutation_table, drone_species)
    for i = 1, #mutation_table, 1 do
        if drone_species == mutation_table[i].drone then
            return mutation_table[i].mutation, mutation_table[i].chance
        end
    end
end

function extinct_bees.get_random_amount(chance, min, max)
    --TODO
    local c = 1 / chance
end
