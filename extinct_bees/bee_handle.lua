function bee.get_species_properties(species)
    return bee.data[species]
end

-- turns bee name into species
function bee.get_species_from_name(name)
    name = string.gsub(name, "revival:", "")
    return string.sub(name, 1, name:find("_") - 1)
end

-- returns the possible mutation + chance
function bee.get_mutation(mutation_table, drone_species)
    for _, content in ipairs(mutation_table) do
        if drone_species == content.drone then
            return content.mutation, content.chance
        end
    end
end
