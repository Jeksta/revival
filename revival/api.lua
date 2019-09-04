--[[
   Helper API
]]
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

-- basically what table remove does
function utils.compress_table(t)
   local temp = {}
   for i = 1, #t, 1 do
      if t[i] ~= nil and t[i] ~= "" then
         temp[#temp + 1] = t[i]
      end
   end
   return temp
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
      t[element] = nil
   end

   return utils.compress_table(t)
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
   for i = 1, #t2, 1 do
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
         copy[deep_copy(orig_key)] = deep_copy(orig_value)
      end
      setmetatable(copy, deepcopy(getmetatable(orig)))
   else -- number, string, boolean, etc
      copy = orig
   end
   return copy
end

--[[
   Craft API
]]
local all_recipes = {}

-- registers the a new craft based on a custom type
function craft.register_craft(def)
   -- definition is empty
   if not def then
      return
   end

   local typ = def.type
   if not (typ and (def.shape or def.required_turns) and def.output and def.recipe) then
      return
   end

   if type(def.recipe) == "string" then
      def.recipe = {def.recipe}
   end

   if not all_recipes[typ] then
      all_recipes[typ] = {}
   end

   local a_r = all_recipes[typ]
   if def.shape then
      a_r[#a_r + 1] = {shape = def.shape, output = def.output, recipe = def.recipe}
   elseif def.required_turns then
      a_r[#a_r + 1] = {required_turns = def.required_turns, output = def.output, recipe = def.recipe}
   end
end

function craft.get_craft_recipe(typ, item)
   --TODO
   for _, r in ipairs(all_recipes[typ]) do
      if r.output == item:get_name() then
         return r.recipe
      end
   end
end

local function get_shaped_result(craft, crafting_grid, grid_size)
   local recipe = craft.recipe

   -- get the size of the recipe
   local recipe_cols = #craft.recipe[1]
   local recipe_rows = #craft.recipe

   -- concat the recipe to one table to make it easier to use
   local conc_recipe = {}
   for i = 1, recipe_rows, 1 do
      conc_recipe = utils.concatenate_table(conc_recipe, recipe[i])
   end

   -- anchor on the crafting grid to check for recipe grid
   local anchor = {
      exists = false,
      output = "",
      area = {},
      index = 1,
      max_x = math.ceil(grid_size.width / recipe_cols),
      max_y = math.ceil(grid_size.height / recipe_rows)
   }

   -- start to iterate through crafting_grid
   for i, item in ipairs(crafting_grid) do
      -- calc x,y from 1-dim table
      local x = (i - 1) % grid_size.width + 1
      local y = math.ceil(i / grid_size.height)

      local group = ""
      if conc_recipe[anchor.index] then
         group = string.gsub(conc_recipe[anchor.index], "group:", "")
      end

      if anchor.exists then
         -- only check inside the anchor area
         if x >= anchor.area.x1 and y >= anchor.area.y1 and x <= anchor.area.x2 and y <= anchor.area.y2 then
            if item == conc_recipe[anchor.index] or minetest.get_item_group(item, group) > 0 then
               anchor.index = anchor.index + 1

               if anchor.index == #conc_recipe + 1 then
                  anchor.output = craft.output
               end
            else
               anchor.output = nil
               break
            end
         elseif item ~= "" then
            anchor.output = nil
            break
         end
      end

      if not anchor.exists then
         if (x <= anchor.max_x and y <= anchor.max_y) then
            -- [[ only if the recipe fits into the current grid(x,y) ]]
            if item == conc_recipe[anchor.index] or minetest.get_item_group(item, group) > 0 then
               -- [[ find the first item of the recipe to set the anchor ]]
               anchor.exists = true
               anchor.area = {
                  x1 = x,
                  y1 = y,
                  x2 = x + recipe_cols - 1,
                  y2 = y + recipe_rows - 1
               }
               anchor.index = anchor.index + 1
               anchor.output = craft.output
            end
         end

         if not anchor.exists and item ~= "" then
            -- [[ if no anchor has been found yet every grid item has to be empty ]]
            anchor.output = nil
            break
         end
      end
   end

   return anchor.output
end

local function parse_group(data)
   local parse = {}
   local trim = string.gsub(data, "group:", "")

   -- seperate group and count
   for str in string.gmatch(trim, "([^%s]+)") do
      parse[#parse + 1] = str
   end

   if #parse == 1 then
      return parse[1], 1
   end
   return parse[1], tonumber(parse[2])
end

local function parse_recipe(data)
   -- cumulates data to {item1 = #, item2 = #, group = #}
   local parse = {}
   local groups = {}

   if type(data) == "string" then
      data = {data}
   end

   for i = 1, #data, 1 do
      if data[i] ~= "" then
         if string.find(data[i], "group:") then
            -- seperates group_name from count
            group,
               count = parse_group(data[i])
            groups[group] = count
         else
            --
            local stack = ItemStack(data[i])
            parse[stack:get_name()] = stack:get_count()
         end
      end
   end

   -- add groups to the end
   -- algorithm searches for specific items first then groups
   for group, count in pairs(groups) do
      parse[group] = count
   end
   return parse
end

local function get_shapeless_result(craft, crafting_grid)
   -- compares crafting_grid with craft.recipe
   local recipe = utils.shallow_copy(parse_recipe(craft.recipe))
   local cg = utils.shallow_copy(crafting_grid)

   -- trim off empty spaces
   cg = utils.compress_table(cg)

   for item, count in pairs(recipe) do
      for i = 1, #cg, 1 do
         if cg[i] == item or minetest.get_item_group(cg[i], item) > 0 then
            recipe[item] = recipe[item] - 1
            cg[i] = nil
            -- you dont have to check the grid anymore when the count reaches 0
            if recipe[item] == 0 then
               break
            end
         end
      end

      -- after running through the crafting grid the recipe count has to be 0 to proceed
      -- at this point it can only be above 0 or 0
      if recipe[item] ~= 0 then
         return
      end
   end
   -- check whether crafting grid is also empty
   if next(cg) == nil then
      return craft.output
   end
end

local function get_press_result(craft, crafting_grid, turns)
   if crafting_grid[1] == craft.recipe[1] then
      if craft.required_turns == turns then
         return craft.output
      end
   end
end

function craft.get_craft_result(typ, list, param)
   -- if one of both inputs is empty
   if not (typ and list) then
      return
   end

   -- get the crafting grid from the list
   local conc_crafting_grid = {}
   for i = 1, #list, 1 do
      conc_crafting_grid[#conc_crafting_grid + 1] = list[i]:get_name()
   end

   local craft_type = all_recipes[typ]
   for i = 1, #craft_type, 1 do
      local output = nil

      if craft_type[i].shape then
         if craft_type[i].shape == "shaped" then
            output = get_shaped_result(craft_type[i], conc_crafting_grid, param)
         elseif craft_type[i].shape == "shapeless" then
            output = get_shapeless_result(craft_type[i], conc_crafting_grid)
         end
      end

      if craft_type[i].required_turns then
         output = get_press_result(craft_type[i], conc_crafting_grid, param)
      end

      if output then
         return output
      end
   end
end
