--
-- Formspecs
--
function extinct_bees.get_bee_hive_active_formspec(life_percent)
	return "size[8,8.5]" ..
		"no_prepend[]" ..
			-- bg appearance
			"image[2,1;1,2.2;extinct_bees_bee_hive_progress_bg.png^" ..
				"[lowpart:" ..
					life_percent ..
						":extinct_bees_bee_hive_progress_fg.png]" ..
							"bgcolor[#343434;false]" ..
								"listcolors[#00000030;#F8F8FF30]" ..
									"background[0,0;8,4;extinct_bees_bee_hive_bg.png]" ..
										-- input lists
										"container[1,0.75]" ..
											"list[context;queen;0,0;1,1]" ..
												"list[context;drone;0,1.5;1,1]" ..
													"container_end[]" ..
														-- output lists [WIP]
														"container[4, 0.5]" ..
															-- top
															"list[context;dst1;0.5,0;1,1]" ..
																"list[context;dst2;1.5,0;1,1]" ..
																	-- middle
																	"list[context;dst3;0,1;1,1]" ..
																		"list[context;dst4;1,1;1,1]" ..
																			"list[context;dst5;2,1;1,1]" ..
																				-- bottom
																				"list[context;dst6;0.5,2;1,1]" ..
																					"list[context;dst7;1.5,2;1,1]" ..
																						"container_end[]" ..
																							--player inventory
																							"list[current_player;main;0,4.25;8,1;]" .. -- toolleiste
																								"list[current_player;main;0,5.5;8,3;8]" .. -- player inventory
																									"listring[current_player;main]" ..
																										"listring[context;queen]" ..
																											"listring[current_player;main]" ..
																												"listring[context;drone]" ..
																													"listring[current_player;main]" ..
																														"listring[context;dst1]" ..
																															"listring[current_player;main]" ..
																																"listring[context;dst2]" ..
																																	"listring[current_player;main]" ..
																																		"listring[context;dst3]" ..
																																			"listring[current_player;main]" ..
																																				"listring[context;dst4]" ..
																																					"listring[current_player;main]" ..
																																						"listring[context;dst5]" ..
																																							"listring[current_player;main]" ..
																																								"listring[context;dst6]" ..
																																									"listring[current_player;main]" ..
																																										"listring[context;dst7]" .. "listring[current_player;main]"
end

function extinct_bees.get_bee_hive_inactive_formspec()
	return "size[8,8.5]" ..
		"no_prepend[]" ..
			-- bg appearance
			"image[2,1;1,2.2;extinct_bees_bee_hive_progress_bg.png]" ..
				"bgcolor[#343434;false]" ..
					"listcolors[#00000030;#F8F8FF30]" ..
						"background[0,0;8,4;extinct_bees_bee_hive_bg.png]" ..
							--player inventory
							"list[current_player;main;0,4.25;8,1;]" .. -- toolleiste
								"list[current_player;main;0,5.5;8,3;8]" .. -- player inventory
									-- input lists
									"container[1,0.75]" ..
										"list[context;queen;0,0;1,1]" ..
											"list[context;drone;0,1.5;1,1]" ..
												"container_end[]" ..
													--output lists
													"container[4, 0.5]" ..
														-- top
														"list[context;dst1;0.5,0;1,1]" ..
															"list[context;dst2;1.5,0;1,1]" ..
																-- middle
																"list[context;dst3;0,1;1,1]" ..
																	"list[context;dst4;1,1;1,1]" ..
																		"list[context;dst5;2,1;1,1]" ..
																			-- bottom
																			"list[context;dst6;0.5,2;1,1]" ..
																				"list[context;dst7;1.5,2;1,1]" ..
																					"container_end[]" ..
																						"listring[current_player;main]" ..
																							"listring[context;queen]" ..
																								"listring[current_player;main]" ..
																									"listring[context;drone]" ..
																										"listring[current_player;main]" ..
																											"listring[context;dst1]" ..
																												"listring[current_player;main]" ..
																													"listring[context;dst2]" ..
																														"listring[current_player;main]" ..
																															"listring[context;dst3]" ..
																																"listring[current_player;main]" ..
																																	"listring[context;dst4]" ..
																																		"listring[current_player;main]" ..
																																			"listring[context;dst5]" ..
																																				"listring[current_player;main]" ..
																																					"listring[context;dst6]" ..
																																						"listring[current_player;main]" ..
																																							"listring[context;dst7]" .. "listring[current_player;main]"
end

local function add_mutation_to_drops(drops, properties, drone_species)
	-- get the possible mutation between queen and drone
	local mutation, mut_chance
	mutation, mut_chance = extinct_bees.get_mutation(properties.mutation, drone_species)

	-- provided no mutation is possible, the drones species has a 50% chance
	-- to recur
	if not mutation then
		mutation = drone_species
		mut_chance = 2
	end
	if 0.5 < math.random() then
		mutation = "extinct_bees:" .. mutation .. "_queen"
	else
		mutation = "extinct_bees:" .. mutation .. "_drone"
	end

	drops[#drops + 1] = {item = mutation, chance = mut_chance, min_drop = 0, max_drop = 1}
	return drops
end

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

	return inv:is_empty("queen") and inv:is_empty("drone") and inv:is_empty("dst1") and inv:is_empty("dst2") and
		inv:is_empty("dst3") and
		inv:is_empty("dst4") and
		inv:is_empty("dst5") and
		inv:is_empty("dst6") and
		inv:is_empty("dst7")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	-- pos = position of the node
	-- listname = names of the list
	-- index = gibt immer 1 zurück?
	-- stack = the item stack des ausgewählten item
	-- player = ?

	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end

	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

	-- only drones can be placed in the bottom list
	if listname == "drone" then
		-- only queens can be placed in the top list
		if minetest.get_item_group(stack:get_name(), "drone") ~= 0 then
			return stack:get_count()
		else
			return 0
		end
	elseif listname == "queen" then
		-- nothing can be placed in the dst list
		if minetest.get_item_group(stack:get_name(), "queen") ~= 0 then
			return stack:get_count()
		else
			return 0
		end
	else
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
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

local function hive_node_timer(pos, elapsed)
	--
	-- [[ Inizialize metadata ]]
	--
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

	local total_lifespan = meta:get_float("total_lifespan") or 0
	local remaining_lifespan = meta:get_float("remaining_lifespan") or 0
	local life_percent = meta:get_float("life_percent") or 0
	local hive_state = meta:get_string("hive_state")

	local flower_radius = meta:get_int("flower_radius") or 0
	local flower_count = meta:get_int("flower_count") or 0
	-- timer abbruch bedingung
	local restart = false
	--
	-- [[ Checking input lists ]]
	--
	-- hive activates when both inputs have a bee
	if hive_state == "inactive" and not inv:is_empty("queen") and not inv:is_empty("drone") then
		utils.swap_node(pos, "extinct_bees:bee_hive_active")

		hive_state = "active"

		local queen = inv:get_stack("queen", 1)
		local species = extinct_bees.get_species_from_name(queen:get_name())
		local properties = extinct_bees.get_species_properties(species)

		flower_radius = properties["flower"].radius
		flower_count = properties["flower"].count

		total_lifespan = properties.lifespan
		remaining_lifespan = total_lifespan
	elseif hive_state == "active" and inv:is_empty("queen") or inv:is_empty("drone") then
		remaining_lifespan = 0
	end

	--
	-- [[ Update formspecs and calculates the output ]]
	--
	local formspec
	local infotext
	if remaining_lifespan > 0 then
		local flowers_in_area = utils.count_flowers_around_node(pos, flower_radius)
		if #flowers_in_area < flower_count then
			infotext = "Not enough flowers around Hive!"
		else
			remaining_lifespan = remaining_lifespan - 1
		end
		life_percent = 100 - math.floor((remaining_lifespan / total_lifespan) * 100)
		formspec = extinct_bees.get_bee_hive_active_formspec(100 - life_percent)

		-- lifespan over
		if remaining_lifespan == 0 then
			math.randomseed(os.time() + tonumber(tostring({}):sub(8)))

			local queen = inv:get_stack("queen", 1)
			local drone = inv:get_stack("drone", 1)

			local queen_species = extinct_bees.get_species_from_name(queen:get_name())
			local drone_species = extinct_bees.get_species_from_name(drone:get_name())
			local queen_properties = extinct_bees.get_species_properties(queen_species)

			-- randomize the output
			local output_dst = {"dst1", "dst2", "dst3", "dst4", "dst5", "dst6", "dst7"}
			output_dst = utils.rand_permutation(output_dst)

			-- guaranteed drops
			local output = {ItemStack(queen:get_name()), ItemStack(drone:get_name())}
			local drops = utils.shallow_copy(queen_properties.drops)
			drops = add_mutation_to_drops(drops, queen_properties, drone_species)

			for _, drop in ipairs(drops) do
				local stack = ItemStack(drop.item)

				local count = drop.min_drop
				local n = drop.max_drop - drop.min_drop
				for _ = 1, n, 1 do
					local r = math.random()
					if r <= (1 / drop.chance) then
						count = count + 1
					end
				end
				stack:set_count(count)
				table.insert(output, stack)
			end

			-- delete input
			inv:remove_item("queen", queen:get_name())
			inv:remove_item("drone", drone:get_name())

			-- fill output
			for i, dst in ipairs(output_dst) do
				if output[i] then
					inv:add_item(dst, output[i])
				end
			end
		end

		restart = true
	else
		utils.swap_node(pos, "extinct_bees:bee_hive")
		hive_state = "inactive"
		life_percent = 0
		formspec = extinct_bees.get_bee_hive_inactive_formspec()
		-- stop timer on the inhive_state furnace
		minetest.get_node_timer(pos):stop()
	end

	if not infotext then
		if hive_state == "active" then
			infotext = "Progress: " .. (life_percent) .. "%"
		else
			infotext = "Hive is inactive"
		end
	end

	--
	-- [[ Set meta values ]]
	--
	meta:set_float("total_lifespan", total_lifespan)
	meta:set_float("remaining_lifespan", remaining_lifespan)
	meta:set_float("life_percent", life_percent)
	meta:set_string("hive_state", hive_state)
	meta:set_int("flower_radius", flower_radius)
	meta:set_int("flower_count", flower_count)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return restart
end

--
-- [[ Node definitions ]]
--
minetest.register_node(
	"extinct_bees:bee_hive",
	{
		description = "Bee Hive",
		tiles = {
			"extinct_bees_bee_hive0_top.png",
			"extinct_bees_bee_hive0_top.png",
			"extinct_bees_bee_hive1_sides.png",
			"extinct_bees_bee_hive1_sides.png",
			"extinct_bees_bee_hive1_sides.png",
			"extinct_bees_bee_hive2_front.png"
		},
		paramtype2 = "facedir",
		drop = "extinct_bees:bee_hive",
		groups = {oddly_breakable_by_hand = 1, hive = 1},
		legacy_facedir_simple = true,
		is_ground_content = false,
		--sounds = default.node_sound_stone_defaults(),

		can_dig = can_dig,
		on_timer = hive_node_timer,
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", extinct_bees.get_bee_hive_inactive_formspec())
			meta:set_string("infotext", "Empty Bee Hive")
			meta:set_string("hive_state", "inactive")

			local inv = meta:get_inventory()
			inv:set_size("queen", 1)
			inv:set_size("drone", 1)
			inv:set_size("dst1", 1) -- top
			inv:set_size("dst2", 1) -- top
			inv:set_size("dst3", 1) -- middle
			inv:set_size("dst4", 1) -- middle
			inv:set_size("dst5", 1) -- middle
			inv:set_size("dst6", 1) -- bottom
			inv:set_size("dst7", 1) -- bottom
		end,
		--
		allow_metadata_inventory_put = allow_metadata_inventory_put,
		allow_metadata_inventory_move = allow_metadata_inventory_move,
		allow_metadata_inventory_take = allow_metadata_inventory_take,
		--
		on_metadata_inventory_put = function(pos)
			minetest.get_node_timer(pos):start(1.0)
		end,
		on_blast = function(pos)
			local drops = {}
			default.get_inventory_drops(pos, "queen", drops)
			default.get_inventory_drops(pos, "drone", drops)
			for i = 1, 7, 1 do
				default.get_inventory_drops(pos, "dst" .. i, drops)
			end
			drops[#drops + 1] = "extinct_bees:bee_hive"
			minetest.remove_node(pos)
			return drops
		end
	}
)

minetest.register_node(
	"extinct_bees:bee_hive_active",
	{
		description = "Bee Hive",
		tiles = {
			"extinct_bees_bee_hive0_top.png",
			"extinct_bees_bee_hive0_top.png",
			"extinct_bees_bee_hive1_sides.png",
			"extinct_bees_bee_hive1_sides.png",
			"extinct_bees_bee_hive1_sides.png",
			"extinct_bees_bee_hive2_front.png"
		},
		paramtype2 = "facedir",
		light_source = 5,
		drop = "extinct_bees:bee_hive",
		groups = {oddly_breakable_by_hand = 1, not_in_creative_inventory = 1, hive = 1},
		legacy_facedir_simple = true,
		is_ground_content = false,
		--sounds = default.node_sound_stone_defaults(),
		can_dig = can_dig,
		on_timer = hive_node_timer,
		--
		allow_metadata_inventory_put = allow_metadata_inventory_put,
		allow_metadata_inventory_move = allow_metadata_inventory_move,
		allow_metadata_inventory_take = allow_metadata_inventory_take
	}
)
