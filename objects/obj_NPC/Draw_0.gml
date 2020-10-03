var dis = point_distance(x, y, player.x, player.y)

var e = 176
if (Computer || sprite_index == spr_Xandra) {
	e = 144
}

if (dis < 96) {
	draw_set_color($FFFFFF)
	draw_set_halign(fa_center)
	draw_text(x, y - e, "E")
	for (var i = 0; i < 360; i += 36) {
		gpu_set_fog(true, $FFFFFF, depth, depth)
		var oldx = x
		var oldy = y
		x += lengthdir_x(3, i)
		y += lengthdir_y(3, i)
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, -1, 1)
		gpu_set_fog(false, $FFFFFF, 1, 1)
		x = oldx
		y = oldy
	}
} else if (Xandra && g.Code == 0 && g.Seen == 0) {
	draw_set_color($FFFFFF)
	draw_set_halign(fa_center)
	draw_text(x, y - e, "!")
} else if (Computer) {
	if (g.Code != g.Seen) {
		draw_set_color($FFFFFF)
		draw_set_halign(fa_center)
		draw_text(x, y - e, "!")
	}
} else if (Goblin) {
	draw_set_color($FFFFFF)
	draw_set_halign(fa_left)
	draw_sprite_ext(spr_Gold, 0, x - 24, y - e + 25, 0.4, 0.4, 0, -1, 1)
	draw_text(x + 12, y - e, string(Payment))
} else if (Thug) {
	draw_set_color($FFFFFF)
	draw_set_halign(fa_left)
	draw_sprite_ext(spr_Slime, 0, x - 24, y - e + 50, 0.25, 0.25, 0, -1, 1)
	draw_text(x + 12, y - e, string(Payment))
} else if (Dark) {
	draw_set_color($FFFFFF)
	draw_set_halign(fa_left)
	draw_sprite_ext(spr_Heart, 0, x - 24, y - e + 25, 0.4, 0.4, 0, -1, 1)
	draw_text(x + 12, y - e, string(Payment))
}

draw_self()