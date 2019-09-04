--local x = os.clock()

revival = {}
craft = {}
utils = {}

local mod_path = minetest.get_modpath("revival")
revival.mod_path = mod_path

dofile(mod_path .. "/api.lua")
dofile(mod_path .. "/items.lua")
dofile(mod_path .. "/tools.lua")
dofile(mod_path .. "/crafting.lua")
dofile(mod_path .. "/dissection_table.lua")
dofile(mod_path .. "/manual_press.lua")
dofile(mod_path .. "/override.lua")

--minetest.log("action", string.format("elapsed time: %.2f\n", os.clock() - x))
