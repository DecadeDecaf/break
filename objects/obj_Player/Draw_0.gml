var deep = Deep

var gunX = x + (image_xscale * 192)
var gunY = y - 48 + abs(deep * image_xscale)

var rot = point_direction(gunX, gunY, mouse_x, mouse_y)

var xscale = abs(image_xscale) * 1.5
var yscale = image_xscale * 1.5

var img = 0

if (Cooldown > 8) {
	img = 4
} else if (Cooldown > 6) {
	img = 3
} else if (Cooldown > 4) {
	img = 2
} else if (Cooldown > 4) {
	img = 0
} else if (Cooldown > 0) {
	img = 1
}

draw_sprite_ext(spr_Staff, img, gunX, gunY, xscale, yscale, rot, -1, 1)

var flip = 0

if (image_xscale < 0) {
	flip = abs(sprite_get_width(sprite_index) * image_xscale)
}

var yflip = (sprite_get_height(sprite_index) - deep) * image_yscale

var width = abs(sprite_get_width(sprite_index) * image_xscale) / 2

if (g.Flash > 0) {
	if (g.Flash % 20 < 10) {
		gpu_set_fog(true, $FFFFFF, depth, depth)
	}
	g.Flash -= 1
}

draw_sprite_part_ext(sprite_index, image_index, 0, 0, sprite_get_width(sprite_index), sprite_get_height(sprite_index) - deep, x - width + flip, y - yflip, image_xscale, image_yscale, image_blend, image_alpha)

gpu_set_fog(false, $FFFFFF, 1, 1)