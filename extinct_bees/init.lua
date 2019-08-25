extinct_bees = {}

local mod_path = minetest.get_modpath("extinct_bees")
extinct_bees.mod_path = mod_path

dofile(mod_path .. "/api.lua")
dofile(mod_path .. "/bee_data.lua")
dofile(mod_path .. "/items.lua")
dofile(mod_path .. "/crafting.lua")
dofile(mod_path .. "/bee_hive.lua")
dofile(mod_path .. "/oregen.lua")
dofile(mod_path .. "/override.lua")
