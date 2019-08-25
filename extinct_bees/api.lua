function extinct_bees.add_species(species, color)
    local desc = utils.first_to_upper(species)
    -- queen
    minetest.register_craftitem(
        "extinct_bees:" .. species .. "_queen",
        {
            description = desc .. " Queen",
            inventory_image = "extinct_bees_bee_stripes.png",
            inventory_overlay = "extinct_bees_bee_base.png^extinct_bees_bee_crown.png",
            color = color,
            stack_max = 1,
            groups = {bee = 1, queen = 1}
        }
    )
    -- drone
    minetest.register_craftitem(
        "extinct_bees:" .. species .. "_drone",
        {
            description = desc .. " Drone",
            inventory_image = "extinct_bees_bee_stripes.png",
            inventory_overlay = "extinct_bees_bee_base.png",
            color = color,
            stack_max = 1,
            groups = {bee = 1, drone = 1}
        }
    )
end

function extinct_bees.register_bee_species(name, data)
    if not extinct_bees.data[name] then
        extinct_bees.data[name] = {}
    end

    table.insert(extinct_bees.data[name], data)
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
    for _, content in ipairs(mutation_table) do
        if drone_species == content.drone then
            return content.mutation, content.chance
        end
    end
end
