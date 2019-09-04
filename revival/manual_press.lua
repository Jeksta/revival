function revival.get_manual_press_formspec()
    return "size[8,8.5]" ..
        "list[current_player;main;0,4.25;8,1;]" ..
            "list[current_player;main;0,5.5;8,3;8]" ..
                "list[context;src;1,1.5;1,1]" ..
                    "list[context;dst;4,1;2,2]" ..
                        "listring[current_player;main]" ..
                            "listring[context;src]" .. "listring[current_player;main]" .. "listring[context;dst]"
end

local attached_crank = {}

minetest.register_entity(
    "revival:attached_crank",
    {
        visual = "mesh",
        visual_size = {x = 5, y = 5},
        mesh = "revival_crank.obj",
        paramtype = "light",
        textures = {"revival_crank_texture.png"},
        collisionbox = {-0.25, -0.5, -0.25, 0.25, 0.05, 0.25},
        groups = {punch_operable = 1},
        on_activate = function(self, staticdata, dtime_s)
            -- on every load/restart the attachment has to be initialized
            local entity_pos = self.object:get_pos()
            -- entities seem to spawn on some float value
            local node_pos = {
                x = math.floor(entity_pos.x),
                y = math.floor(entity_pos.y) - 1,
                z = math.floor(entity_pos.z)
            }
            local ser_pos = minetest.serialize(node_pos)

            attached_crank[ser_pos] = self.object
            minetest.log("action", "[Revival] Crank has been attached to: " .. minetest.pos_to_string(node_pos, 1))
        end,
        on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, dir)
            -- punch_operable doesnt work
            self.object:set_hp(10)
            local entity_pos = self.object:get_pos()
            local node_pos = {x = entity_pos.x, y = entity_pos.y - 1, z = entity_pos.z}
            local node_meta = minetest.get_meta(node_pos)
            local node_inv = node_meta:get_inventory()

            -- only operate when an items is in the source list
            if not node_inv:is_empty("src") then
                -- output is full
                local last_src = node_meta:get_string("last_src")
                local current_src = node_inv:get_stack("src", 1):get_name()
                if last_src ~= current_src then
                    if node_meta:get_string("output_state") == "full" then
                        node_meta:set_string("infotext", "Press is full")
                        return
                    end
                    if not node_inv:is_empty("dst") then
                        node_meta:set_string("infotext", "Press output is still full")
                        return
                    end
                end

                -- calc number of turns
                local turns = node_meta:get_int("turns") or 0
                local turns = turns + 1
                node_meta:set_int("turns", turns)

                -- rotate crank
                local r = self.object:get_rotation()
                r.y = r.y + 0.7854 -- rotate 45° , pi/4
                self.object:set_rotation(r)

                -- check every half turn for an output
                local output = nil
                if (turns % 4) == 0 then
                    local half_turns = turns / 4
                    output = craft.get_craft_result("press", node_inv:get_list("src"), half_turns)
                end

                if output then
                    -- decrement source
                    local src = node_inv:get_stack("src", 1)
                    -- keep track of last src item and reset turn counter
                    node_meta:set_string("last_src", src:get_name())
                    node_meta:set_int("turns", 0)
                    src:take_item(1)
                    node_inv:set_stack("src", 1, src)

                    for i = 1, node_inv:get_size("dst"), 1 do
                        local stack = node_inv:get_stack("dst", i)

                        if output[i] then
                            -- the press adds the output to an existing stack or
                            -- creates a new one
                            local item = ItemStack(output[i])
                            if node_inv:contains_item("dst", item) then
                                -- if the dst is full the press spits out the leftover and has to be
                                -- emptied befor proceeding
                                local leftover = stack:add_item(item)
                                if leftover:get_count() > 0 then
                                    local drop_pos = {
                                        x = node_pos.x + math.random(-0.25, 0.25),
                                        y = node_pos.y + 1.5,
                                        z = node_pos.z + math.random(-0.25, 0.25)
                                    }
                                    minetest.add_item(drop_pos, leftover)

                                    node_meta:set_string("output_state", "full")
                                    node_meta:set_string("infotext", "Press spilled over")
                                end
                                node_inv:set_stack("dst", i, stack)
                            else
                                node_inv:set_stack("dst", i, item)
                            end
                        end
                    end
                end
            else
                node_meta:set_int("turns", 0)
                node_meta:set_string("infotext", "Nothing to press")
            end
        end
    }
)

local function can_dig(pos, player)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()

    return inv:is_empty("src") and inv:is_empty("dst")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
    if minetest.is_protected(pos, player:get_player_name()) then
        return 0
    end

    if (listname == "src" and minetest.get_item_group(stack:get_name(), "pressable") == 0) or listname == "dst" then
        return 0
    end

    return stack:get_count()
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
    return 0
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
    if minetest.is_protected(pos, player:get_player_name()) then
        return 0
    end

    return stack:get_count()
end

minetest.register_node(
    "revival:manual_press",
    {
        description = "Manual Press",
        tiles = {
            "revival_manual_press0_top.png",
            "revival_manual_press1_bottom.png",
            "revival_manual_press2_side.png",
            "revival_manual_press2_side.png",
            "revival_manual_press3_front.png",
            "revival_manual_press3_front.png"
        },
        paramtype2 = "facedir",
        drop = "revival:manual_press",
        groups = {oddly_breakable_by_hand = 1, choppy = 1, press = 1},
        legacy_facedir_simple = true,
        is_ground_content = false,
        on_construct = function(pos)
            local ser_pos = minetest.serialize(pos)
            -- set crank above press
            minetest.add_entity({x = pos.x, y = pos.y + 1, z = pos.z}, "revival:attached_crank")

            local meta = minetest.get_meta(pos)
            meta:set_string("formspec", revival.get_manual_press_formspec())
            meta:set_string("infotext", "Manual Press")

            -- keeps track of the last pressed item
            meta:set_string("last_src", "none")
            -- keeps track of the output
            meta:set_string("output_state", "empty")

            local inv = meta:get_inventory()
            inv:set_size("src", 1)
            inv:set_size("dst", 4)
        end,
        on_destruct = function(pos)
            local ser_pos = minetest.serialize(pos)
            -- remove crank from anchor
            if attached_crank[ser_pos] then
                attached_crank[ser_pos]:remove()
                attached_crank[ser_pos] = nil
            end
        end,
        --sounds = default.node_sound_stone_defaults(),
        can_dig = can_dig,
        --
        allow_metadata_inventory_put = allow_metadata_inventory_put,
        allow_metadata_inventory_move = allow_metadata_inventory_move,
        allow_metadata_inventory_take = allow_metadata_inventory_take,
        --
        on_metadata_inventory_put = function(pos, listname, index, stack, player)
            local meta = minetest.get_meta(pos)
            if listname == "src" then
                meta:set_string("turns", 0)
                meta:set_string("infotext", "Manual Press")
            end
        end,
        on_metadata_inventory_take = function(pos, listname, index, stack, player)
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()

            if listname == "src" then
                meta:set_string("turns", 0)
            elseif listname == "dst" then
                local state
                if inv:is_empty("dst") then
                    state = "empty"
                else
                    state = "remain"
                end

                meta:set_string("infotext", "Manual Press")
                meta:set_string("output_state", state)
            end
        end
    }
)
