minetest.override_item(
	"default:pine_tree",
	{
		drop = {
			max_items = 1,
			items = {
				{items = {"revival:amber"}, rarity = 20}
			}
		}
	}
)
