--[[
	- TODO
	- change the flower structure to bee structure
]]
extinct_flowers.data = {
	{
		"strange_rose",
		"Strange Rose",
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 3 / 16, 2 / 16},
		{flammable = 1}
	}
}

for _, item in pairs(extinct_flowers.data) do
	extinct_flowers.register_flower(unpack(item))
end
