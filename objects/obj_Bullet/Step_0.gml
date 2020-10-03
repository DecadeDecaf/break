if (Life <= 0) {
	image_xscale -= 0.02
	image_yscale -= 0.02
	if (image_xscale <= 0 || image_yscale <= 0) {
		instance_destroy()
	}
	exit
}

x += lengthdir_x(Speed, Direction)
y += lengthdir_y(Speed, Direction)

Speed += 0.25
Speed = min(Speed, 10)

var dis = point_distance(x, y, player.x, player.y - 48)

if (dis < 48) {
	if (g.Flash <= 0) {
		g.Hearts -= 1
		g.Flash = 60
		if (g.Hearts <= 0) {
			g.Hearts = 3
			g.Gold = 0
			player.x = 1900
			player.y = 1150
		}
	}
	Life = 0
}

FrameCount += 1

if (FrameCount < 9) {
	image_xscale += 0.02
	image_yscale += 0.02
	exit
}

if (FrameCount % 3 == 0) {
	var part = instance_create_depth(x, y, 0, obj_Particle)
	part.Direction = Direction + random_range(150, 210)
	if (Wisp) {
		part.image_index = 3
	}
}

Life -= 1