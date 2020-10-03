var m1 = (mouse_check_button(mb_left))

var left = (keyboard_check(ord("A")) || keyboard_check(vk_left))
var right = (keyboard_check(ord("D")) || keyboard_check(vk_right))
var up = (keyboard_check(ord("W")) || keyboard_check(vk_up))
var down = (keyboard_check(ord("S")) || keyboard_check(vk_down))

var h = 0
var v = 0

if (!g.Talking) {
	if (left) {
		h -= 1
	}

	if (right) {
		h += 1
	}

	if (up) {
		v -= 1
	}

	if (down) {
		v += 1
	}
}

var dir = point_direction(0, 0, h, v)
var spd = Speed

if (abs(h) + abs(v) > 0) {
	XV = lengthdir_x(spd, dir)
	YV = lengthdir_y(spd, dir)
} else {
	XV /= 1.5
	YV /= 1.5
}

x += XV

if (x < 0 || x > 3800) {
	x -= XV
}

y += YV

if (y < 0 || y > 2200) {
	y -= YV
}

if (mouse_x > x) {
	image_xscale = 0.25
} else if (mouse_x < x) {
	image_xscale = -0.25
}

depth = round(-y)

var lay = layer_get_id("Tiles")
var tiles = layer_tilemap_get_id(lay)

var tile = tilemap_get_at_pixel(tiles, x, y)
var water = (tile == 14)

if (water) {
	Deep += 16
	Deep = min(Deep, 128)
} else {
	Deep -= 16
	Deep = max(Deep, 0)
}

var gunX = x + (image_xscale * 192)
var gunY = y - 48 + abs(Deep * image_xscale)

var rot = point_direction(gunX, gunY, mouse_x, mouse_y)

if (Cooldown > 0) {
	Cooldown -= 1
} else {
	if (m1) {
		var bulletX = gunX + lengthdir_x(64, rot)
		var bulletY = gunY + lengthdir_y(64, rot)
		var bullet = instance_create_depth(bulletX, bulletY, 0, obj_Bullet)
		bullet.Direction = rot
		Cooldown = 24
	}
}

if (g.FrameCount % 180 == 0 && g.Seen >= 14) {
	var bulletX = gunX + lengthdir_x(64, rot)
	var bulletY = gunY + lengthdir_y(64, rot)
	var bullet = instance_create_depth(bulletX, bulletY, 0, obj_Bullet)
	bullet.Direction = rot
}