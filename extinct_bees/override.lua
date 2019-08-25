minetest.override_item(
	"default:pine_tree",
	{
		drop = {
			max_items = 1,
			items = {
				{items = {"extinct_bees:amber"}, rarity = 20}
			}
		}
	}
)
