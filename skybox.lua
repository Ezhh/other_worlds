--Heights for skyboxes
local space_low = 5000 
local space_high = 5999
local redsky_low = 6000
local redsky_high = 6999


local player_list = {} -- Holds name of skybox showing for each player

--Outerspace skybox
local spaceskybox = {
	"sky_pos_z.png",
	"sky_neg_z.png^[transformR180",
	"sky_neg_y.png^[transformR270",
	"sky_pos_y.png^[transformR270",
	"sky_pos_x.png^[transformR270",
	"sky_neg_x.png^[transformR90",
}

--Redsky skybox
local redskybox = {
	"sky_pos_z.png^[colorize:#99000050",
	"sky_neg_z.png^[transformR180^[colorize:#99000050",
	"sky_neg_y.png^[transformR270^[colorize:#99000050",
	"sky_pos_y.png^[transformR270^[colorize:#99000050",
	"sky_pos_x.png^[transformR270^[colorize:#99000050",
	"sky_neg_x.png^[transformR90^[colorize:#99000050",
}


local timer = 0

minetest.register_globalstep(function(dtime)

	timer = timer + dtime

	if timer < 2 then
		return
	end

	timer = 0

	for _, player in pairs(minetest.get_connected_players()) do

		local name = player:get_player_name()
		local pos = player:getpos()
		local current = player_list[name] or ""

		-- Earth
		if pos.y < space_low and current ~= "earth" then
			player:set_sky({}, "regular", {})
			player:set_clouds({density = 0.4})
			player_list[name] = "earth"
			if otherworlds.settings.gravity.enable then
				player:set_physics_override({gravity = 1})
			end

		-- Outerspace
		elseif pos.y > space_low and pos.y < space_high and current ~= "space" then
			player:set_sky({}, "skybox", spaceskybox)
			player:set_clouds({density = 0})
			player_list[name] = "space"
			if otherworlds.settings.gravity.enable then
				player:set_physics_override({gravity = 0.4})
			end

		-- Redsky
		elseif pos.y > redsky_low and pos.y < redsky_high and current ~= "redsky" then
			player:set_sky({}, "skybox", redskybox)
			player:set_clouds({density = 0})
			player_list[name] = "redsky"
			if otherworlds.settings.gravity.enable then
				player:set_physics_override({gravity = 0.2})
			end

		-- Everything else (blackness)
		elseif pos.y > redsky_high and current ~= "blackness" then
			player:set_sky(000000, "plain", {})
			player:set_clouds({density = 0})
			player_list[name] = "blackness"
			if otherworlds.settings.gravity.enable then
				player:set_physics_override({gravity = 0.1})
			end
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	player_list[name] = nil
	if otherworlds.settings.gravity.enable then
		player:set_physics_override({gravity = 1})
	end
end)
