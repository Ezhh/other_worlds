local sbox = {
	type = "fixed",
	fixed = {
		{-0.25, -0.5, -0.1875, 0.25, 0.1875, 0.1875},
		{-0.1875, -0.5, -0.25, 0.1875, 0.1875, 0.25},
		{-0.3125, -0.5, -0.0625, 0.3125, -0.25, 0.0625},
		{-0.0625, -0.5, -0.3125, 0.0625, -0.25, 0.3125},
		{-0.25, -0.125, -0.25, 0.25, 0.125, 0.25},
		{-0.3125, -0.0625, -0.1875, 0.3125, 0.0625, 0.1875},
		{-0.1875, -0.0625, -0.3125, 0.1875, 0.0625, 0.3125},
		{-0.1875, 0.1875, -0.1875, 0.1875, 0.25, 0.1875},
		{-0.1875, 0.25, -0.125, 0.1875, 0.375, 0.125},
		{-0.125, 0.25, -0.1875, 0.125, 0.375, 0.1875},
		{-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125},
		{-0.0625, 0.4375, -0.0625, 0.0625, 0.5, 0.0625}
	}
}

local tbox = {
	type = "fixed",
	fixed = {
		{-0.3125, -0.5, -0.1875, 0.3125, -0.375, 0.1875},
		{-0.1875, -0.5, -0.3125, 0.1875, -0.375, 0.3125},
		{-0.25, -0.5, -0.25, 0.25, -0.3125, 0.25},
		{-0.3125, -0.375, -0.0625, 0.3125, -0.25, 0.0625},
		{-0.0625, -0.375, -0.3125, 0.0625, -0.25, 0.3125},
		{-0.25, -0.3125, -0.1875, 0.25, -0.1875, 0.1875},
		{-0.1875, -0.3125, -0.25, 0.1875, -0.1875, 0.25},
		{-0.25, -0.1875, -0.125, 0.25, 0, 0.125},
		{-0.125, -0.1875, -0.25, 0.125, 0, 0.25},
		{-0.1875, -0.1875, -0.1875, 0.1875, 0.0625, 0.1875},
		{-0.25, 0, -0.0625, 0.25, 0.125, 0.0625},
		{-0.0625, 0, -0.25, 0.0625, 0.125, 0.25},
		{-0.1875, 0.0625, -0.125, 0.1875, 0.1875, 0.125},
		{-0.125, 0.0625, -0.1875, 0.125, 0.1875, 0.1875},
		{-0.1875, 0.1875, -0.0625, 0.1875, 0.3125, 0.0625},
		{-0.0625, 0.1875, -0.1875, 0.0625, 0.3125, 0.1875},
		{-0.125, 0.1875, -0.125, 0.125, 0.375, 0.125},
		{-0.125, 0.375, -0.0625, 0.125, 0.4375, 0.0625},
		{-0.0625, 0.375, -0.125, 0.0625, 0.4375, 0.125},
		{-0.0625, 0.4375, -0.0625, 0.0625, 0.5, 0.0625}
	}
}

local crystal_list = {
	{"ghost_crystal", "ghost_crystal.png"},
	{"red_crystal", "red_crystal.png"},
	{"rose_quartz", "rose_quartz.png"}
}

for i in ipairs(crystal_list) do
	local name = crystal_list[i][1]
	local texture = crystal_list[i][2]

	minetest.register_node(":crystals:"..name.."_1", {
		description = "Glowing Crystal",
		drawtype = "mesh",
		mesh = "crystal_shape01.obj",
		tiles = {{name = "crystals_"..texture, backface_culling = true}},
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = sbox,
		collision_box = sbox,
		light_source = 10,
		use_texture_alpha = true,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3},
		sounds = default.node_sound_glass_defaults()
	})

	minetest.register_node(":crystals:"..name.."_2", {
		description = "Glowing Crystal",
		drawtype = "mesh",
		mesh = "crystal_shape02.obj",
		tiles = {{name = "crystals_"..texture, backface_culling = true}},
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = tbox,
		collision_box = tbox,
		light_source = 10,
		use_texture_alpha = true,
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3},
		sounds = default.node_sound_glass_defaults()
	})
end
