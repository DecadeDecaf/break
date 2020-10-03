var space = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E")))
var f = keyboard_check_pressed(ord("F"))
var m = keyboard_check_pressed(ord("M"))

if (space) {
	if (room == rm_Menu) {
		room_goto(rm_Game)
	}
}

if (f) {
	var full = window_get_fullscreen()
	window_set_fullscreen(!full)
	if (!full) {
		window_set_size(1920, 1080)
	} else {
		window_set_size(960, 540)
	}
}

if (m) {
	if (g.Mute) {
		audio_master_gain(1)
	} else {
		audio_master_gain(0)
	}
	g.Mute = !g.Mute
}

if (room == rm_Game) {
	if (!g.Inspect) {
		g.FrameCount += 1
		if (g.FrameCount % 180 == 0) {
			if (g.Seen >= 0 && instance_number(obj_Slime) < 10) {
				var xx = random_range(200, 3600)
				var yy = random_range(200, 2000)
				while (point_distance(xx, yy, player.x, player.y) < 512) {
					xx = random_range(200, 3600)
					yy = random_range(200, 2000)
				}
				var slime = instance_create_depth(xx, yy, 0, obj_Slime)
				if (g.Seen >= 6) {
					slime.Wisp = choose(true, false)
				}
			}
			if (g.Seen >= 1 && instance_number(obj_Gold) < 10) {
				var xx = random_range(200, 3600)
				var yy = random_range(200, 2000)
				while (point_distance(xx, yy, player.x, player.y) < 512) {
					xx = random_range(200, 3600)
					yy = random_range(200, 2000)
				}
				instance_create_depth(xx, yy, 0, obj_Gold)
			}
			if (g.Seen >= 5 && instance_number(obj_Heart) < 1) {
				var xx = random_range(200, 3600)
				var yy = random_range(200, 2000)
				while (point_distance(xx, yy, player.x, player.y) < 512) {
					xx = random_range(200, 3600)
					yy = random_range(200, 2000)
				}
				instance_create_depth(xx, yy, 0, obj_Heart)
			}
		}
	}
}