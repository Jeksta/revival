-- counts the amount of flowers in a radius around a node
-- returns a list of positions
function utils.count_flowers_around_node(pos, radius)
    return minetest.find_nodes_in_area(
        {
            x = pos.x - radius,
            y = pos.y - radius,
            z = pos.z - radius
        },
        {
            x = pos.x + radius,
            y = pos.y + radius,
            z = pos.z + radius
        },
        {"group:flower"}
    )
end

function utils.swap_node(pos, name)
    local node = minetest.get_node(pos)
    if node.name == name then
        return
    end
    node.name = name
    minetest.swap_node(pos, node)
end

-- capitalize the first char
function utils.first_to_upper(str)
    return (str:gsub("^%l", string.upper))
end

-- deletes n random values from a given table t
function utils.delete_rand_n_from_table(t, n)
    -- clamping
    if n < 1 then
        return t
    end
    if #t <= n then
        return {}
    end

    for i = 1, n, 1 do
        -- get a random index of the table
        local element = math.random(#t)
        -- remove the index from the table
        table.remove(t, element)
    end
    return t
end

-- fisher and yates shuffle
-- returns a random permutation of a given table t
function utils.rand_permutation(t, n)
    for i = #t, 1, -1 do
        local r = math.random(i)
        -- swap
        local temp = t[i]
        t[i] = t[r]
        t[r] = temp
    end
    return t
end

-- returns the concatenation of t1 and t2
function utils.concatenate_table(t1, t2)
    if t1 == nil then
        return t2
    elseif t2 == nil then
        return t1
    end
    -- add t2 to t1
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end

-- creates a basic copy of the original
function utils.shallow_copy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == "table" then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- creates a deep (also meta data) copy of the original
function utils.deep_copy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == "table" then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
