function revival.get_dissection_table_formspec()
    return "size[8,8.5]" ..
        "list[current_player;main;0,4.25;8,1;]" ..
            "list[current_player;main;0,5.5;8,3;8]" ..
                "container[0.5,0.5]" ..
                    "list[context;require;0,0;1,1]" ..
                        "list[context;tool;0,2;1,1]" ..
                            "container_end[]" ..
                                "list[context;craft;2.5,0.5;3,3]" ..
                                    "list[context;output;6.5,1.5;1,1]" ..
                                        "listring[current_player;main]" ..
                                            "listring[context;craft]" ..
                                                "listring[current_player;main]" ..
                                                    "listring[context;output]" .. "listring[current_player;main]"
end

local function update_output(pos)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()

    -- search for new output
    local size = {width = 3, height = 3}
    local result = craft.get_craft_result("dissection", inv:get_list("craft"), size)
    inv:set_list("output", {result})
end

local function decrement_list(inv, listname)
    for i, s in pairs(inv:get_list(listname)) do
        s:take_item(1)
        inv:set_stack(listname, i, s)
    end
end

local function can_dig(pos, player)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    return inv:is_empty("require") and inv:is_empty("tool") and inv:is_empty("craft")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
    if minetest.is_protected(pos, player:get_player_name()) then
        return 0
    end

    if
        (listname == "require" and not minetest.get_item_group(stack:get_name(), "dissection_require")) or
            (listname == "tool" and not minetest.get_item_group(stack:get_name(), "dissection_tool")) or
            (listname == "output")
     then
        return 0
    end

    return stack:get_count()
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
    if from_list == "output" and to_list == "craft" then
        return 0
    end

    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    local stack = inv:get_stack(from_list, from_index)
    return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
    if minetest.is_protected(pos, player:get_player_name()) then
        return 0
    end

    return stack:get_count()
end

minetest.register_node(
    "revival:dissection_table",
    {
        description = "Dissection Table",
        tiles = {
            "revival_dissection_table0_top.png",
            "revival_dissection_table1_bottom.png",
            "revival_dissection_table2_right.png",
            "revival_dissection_table3_left.png",
            "revival_dissection_table4_back.png",
            "revival_dissection_table5_front.png"
        },
        paramtype2 = "facedir",
        drop = "revival:dissection_table",
        groups = {
            oddly_breakable_by_hand = 1,
            table = 1
        },
        legacy_facedir_simple = true,
        is_ground_content = false,
        --sounds = default.node_sound_stone_defaults(),

        on_construct = function(pos)
            local meta = minetest.get_meta(pos)
            meta:set_string("formspec", revival.get_dissection_table_formspec())
            meta:set_string("infotext", "Dissection Table")

            local inv = meta:get_inventory()

            inv:set_size("require", 1)
            inv:set_size("tool", 1)
            inv:set_size("craft", 9)
            inv:set_size("output", 1)
        end,
        can_dig = can_dig,
        --
        allow_metadata_inventory_put = allow_metadata_inventory_put,
        allow_metadata_inventory_move = allow_metadata_inventory_move,
        allow_metadata_inventory_take = allow_metadata_inventory_take,
        --
        on_metadata_inventory_put = update_output,
        on_metadata_inventory_move = update_output,
        on_metadata_inventory_take = function(pos, listname, index, stack, player)
            if listname == "output" then
                local meta = minetest.get_meta(pos)
                local inv = meta:get_inventory()
                local output = inv:get_stack("output", 1)

                if not output:is_empty() then
                    -- leftover items get send into player inventory
                    local pinv = player:get_inventory()
                    local leftover = output

                    if pinv:room_for_item("main", leftover) then
                        pinv:add_item("main", leftover)
                        inv:set_stack("output", 1, {})
                    else
                        minetest.item_drop(leftover, player, player:get_pos())
                    end
                end
                decrement_list(inv, "craft")
            end
            update_output(pos)
        end,
        --
        on_blast = function(pos)
            local drops = {}
            default.get_inventory_drops(pos, "require", drops)
            default.get_inventory_drops(pos, "tool", drops)
            default.get_inventory_drops(pos, "craft", drops)
            drops[#drops + 1] = "revival:dissection_table"
            minetest.remove_node(pos)
            return drops
        end
    }
)
