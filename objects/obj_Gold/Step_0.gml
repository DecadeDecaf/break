FrameCount += 1

if (FrameCount < 17) {
	image_xscale += 0.025
	image_yscale += 0.025
	exit
}

var dir = point_direction(x, y, player.x, player.y)

var dis = point_distance(x, y, player.x, player.y)

if (dis < 256) {
	var suck = (256 - dis) / 30
	x += lengthdir_x(suck, dir)
	y += lengthdir_y(suck, dir)
}

if (dis < 32) {
	var value = 1
	if (g.Seen >= 4) {
		if (g.Seen >= 9) {
			if (g.Seen >= 12) {
				value = 8
			} else {
				value = 4
			}
		} else {
			value = 2
		}
	}
	g.Gold += value
	repeat (4) {
		var xx = x + random_range(-16, 16)
		var yy = y + random_range(-32, 0)
		var part = instance_create_depth(xx, yy, 0, obj_Particle)
		part.image_index = 2
		part.Life = 10
		part.Direction = dir + random_range(135, 225)
	}
	instance_destroy()
	exit
}

depth = round(-y)