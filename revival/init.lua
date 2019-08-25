revival = {}
craft = {}
utils = {}

local mod_path = minetest.get_modpath("revival")
revival.mod_path = mod_path

dofile(mod_path .. "/craft_api.lua")
dofile(mod_path .. "/helper.lua")
dofile(mod_path .. "/items.lua")
dofile(mod_path .. "/tools.lua")
dofile(mod_path .. "/crafting.lua")
dofile(mod_path .. "/dissection_table.lua")
