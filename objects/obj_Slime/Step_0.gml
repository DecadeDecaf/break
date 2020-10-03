FrameCount += 1

if (FrameCount < 11) {
	image_xscale += 0.025
	image_yscale += 0.025
	exit
}

if (Knockback > 0) {
	x += lengthdir_x(Knockback, Direction)
	y += lengthdir_y(Knockback, Direction)
	Knockback -= 1
	exit
}

var dir = point_direction(x, y, player.x, player.y)
var dis = point_distance(x, y, player.x, player.y)

if (!g.Talking) {
	Direction -= angle_difference(Direction, dir) / 10
	
	if (Wisp) {
		if (dis > 384) {
			x += lengthdir_x(Speed, Direction)
			y += lengthdir_y(Speed, Direction)
		} else if (dis > 128 && Cooldown <= 0) {
			var bulletX = x + lengthdir_x(64, dir)
			var bulletY = y - 32 + lengthdir_y(64, dir)
			var bullet = instance_create_depth(bulletX, bulletY, 0, obj_Bullet)
			bullet.Direction = dir
			bullet.Wisp = true
			Cooldown = 48
		} else if (Cooldown > 0) {
			Cooldown -= 1
		}
	} else {
		x += lengthdir_x(Speed, Direction)
		y += lengthdir_y(Speed, Direction)
	}
}

dis = point_distance(x, y, player.x, player.y)

if (dis < 32) {
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
	Knockback = 20
	Direction += 180
}

var bullet = instance_nearest(x, y, obj_Bullet)

if (place_meeting(x, y, bullet)) {
	if (!bullet.Wisp) {
		HP -= 1
		bullet.Life = 0
		if (HP <= 0) {
			repeat (5) {
				var xx = x + random_range(-16, 16)
				var yy = y + random_range(-32, 0)
				var part = instance_create_depth(xx, yy, 0, obj_Particle)
				part.image_index = 1
				if (Wisp) {
					if (Golden) {
						part.image_index = 5
					} else {
						part.image_index = 4
					}
				} else if (Golden) {
					part.image_index = 2
				}
				part.Life = 10
				part.Direction = bullet.Direction + random_range(-45, 45)
			}
			g.Kills += 1
			if (Golden) {
				instance_create_depth(x, y, 0, obj_Gold)
			}
			instance_destroy()
			exit
		} else {
			Knockback = 10
			Direction = bullet.Direction
		}
	}
}

if (Wisp && FrameCount % 3 == 0) {
	var part = instance_create_depth(x, y - 32, 0, obj_Particle)
	part.Direction = random_range(60, 120)
	if (Golden) {
		part.image_index = 5
	} else {
		part.image_index = 4
	}
	part.Life = 10
}

if (x < player.x - 32) {
	image_xscale = 0.25
} else if (x > player.x + 32) {
	image_xscale = -0.25
}

depth = round(-y)