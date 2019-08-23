local all_recipes = {}

-- registers the a new craft based on a custom type
function craft.register_craft(def)
   -- definition is empty
   if not def then
      return
   end

   local typ = def.type
   if not (typ and def.shape and def.output and def.recipe) then
      return
   end

   if type(def.recipe) == "string" then
      def.recipe = {def.recipe}
   end

   local recipe = {}
   for i, v in ipairs(def.recipe) do
      local stack = ItemStack(v)
      local name = stack:get_name()
      local count = stack:get_count()

      if not recipe[name] then
         recipe[name] = count
      else
         recipe[name] = recipe[name] + count
      end
   end

   if not all_recipes[typ] then
      all_recipes[typ] = {}
   end

   table.insert(all_recipes[typ], {shape = def.shape, output = def.output, recipe = def.recipe})
end

function craft.get_craft_recipe(typ, item)
   --TODO
   for _, r in ipairs(all_recipes[typ]) do
      if r.output == item:get_name() then
         return r.recipe
      end
   end
end

local function get_shaped_result(craft, crafting_grid, grid_width, grid_height)
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
      output,
      area = {},
      index = 1,
      max_x = math.ceil(grid_width / recipe_cols),
      max_y = math.ceil(grid_height / recipe_rows)
   }

   -- start to iterate through crafting_grid
   for i, item in ipairs(crafting_grid) do
      -- calc x,y from 1-dim table
      local x = (i - 1) % grid_width + 1
      local y = math.ceil(i / grid_height)

      if anchor.exists then
         -- only check inside the anchor area
         if x >= anchor.area.x1 and y >= anchor.area.y1 and x <= anchor.area.x2 and y <= anchor.area.y2 then
            if item == conc_recipe[anchor.index] then
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
            if item == conc_recipe[anchor.index] then
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

local function get_shapeless_result()
   --TODO
end

function craft.get_craft_result(typ, list)
   -- if one of both inputs is empty
   if not (typ and list) then
      return
   end

   -- get the crafting grid from the list
   local crafting_grid = {}
   local grid_width = 3
   local grid_height = 3

   for _, data in ipairs(list) do
      table.insert(crafting_grid, data:get_name())
   end

   -- compare grid with the recipes
   for _, craft in ipairs(all_recipes[typ]) do
      local output

      if craft.shape == "shaped" then
         output = get_shaped_result(craft, crafting_grid, grid_width, grid_height)
      elseif craft.shape == "shapeless" then
         --TODO
         output = get_shapeless_result()
      end

      if output then
         return output
      end
   end
end
