extinct_flowers = {}

local mod_path = minetest.get_modpath("extinct_flowers")
extinct_flowers.mod_path = mod_path

dofile(mod_path .. "/api.lua")
dofile(mod_path .. "/flower_data.lua")
dofile(mod_path .. "/crafting.lua")
