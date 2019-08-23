-- Mod namespaces
revival = {
    version = "v0.0"
}
craft = {} -- craft_api
bee = {} -- extinct_bees
flower = {} -- extinct_flowers
utils = {} -- helper stuff

minetest.log("action", "[Mod] Revival " .. revival.version .. " loading...")

local mod_path = minetest.get_modpath("revival")
revival.mod_path = mod_path

dofile(mod_path .. "/api/init.lua")
dofile(mod_path .. "/utils/init.lua")

dofile(mod_path .. "/node/init.lua")
dofile(mod_path .. "/items/init.lua")
dofile(mod_path .. "/extinct_bees/init.lua")
dofile(mod_path .. "/extinct_flowers/init.lua")
dofile(mod_path .. "/world/init.lua")

dofile(mod_path .. "/integration/init.lua")

minetest.log("action", "[Mod] Revival loaded")
