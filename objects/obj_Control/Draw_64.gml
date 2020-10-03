function draw_dropshadow(xx, yy, str, size, col) {
	draw_set_color($000000)
	draw_set_alpha(0.75)
	draw_text_transformed(xx - 1, yy + 1, str, size, size, 0)
	draw_text_transformed(xx - 2, yy + 2, str, size, size, 0)
	draw_set_color(col)
	draw_set_alpha(1)
	draw_text_transformed(xx, yy, str, size, size, 0)
}

var white = $FFFFFF
var gray = $B4B4B4
var green = $4B9833

if (room == rm_Menu) {
	draw_set_font(fnt_Regular)
	draw_set_halign(fa_center)
	draw_dropshadow(960, 320, "Made in 48 hours for the Ludum Dare 47", 1, white)
	draw_dropshadow(960, 420, "Spacebar to continue", 0.8, gray)
	draw_dropshadow(960, 470, "F to fullscreen", 0.8, gray)
	draw_dropshadow(960, 520, "M to mute", 0.8, gray)
}

if (room == rm_Game) {
	var alpha = 0.3

	draw_set_alpha(alpha)
	draw_set_color($1C121C)
	draw_rectangle(0, 0, 1920, 1080, false)
	gpu_set_blendmode_ext(bm_src_alpha, bm_one)
	var light = alpha / 2

	with (obj_Player) {
		var brightness = light / 2
		draw_set_alpha(brightness)
		var rad = 384 + random_range(-8, 8)
		var xx = x - obj_Camera.x + random_range(-8, 8) + 960
		var yy = y - obj_Camera.y + random_range(-8, 8) + 540
		draw_circle_color(xx, yy, rad, $FFFFFF, $000000, false)
	}

	with (obj_NPC) {
		var brightness = light / 2
		draw_set_alpha(brightness)
		var rad = 256 + random_range(-8, 8)
		var xx = x - obj_Camera.x + random_range(-8, 8) + 960
		var yy = y - obj_Camera.y + random_range(-8, 8) + 540
		draw_circle_color(xx, yy, rad, $FFFFFF, $000000, false)
	}

	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)

	draw_set_font(fnt_Regular)
	draw_set_halign(fa_left)

	if (g.Seen >= -1) {
		draw_sprite_ext(spr_Heart, 0, 50, 50, 0.4, 0.4, 0, -1, 1)
		draw_dropshadow(90, 25, string(g.Hearts), 1, white)
	}

	if (g.Seen >= 0) {
		draw_sprite_ext(spr_Slime, 0, 50, 150, 0.25, 0.25, 0, -1, 1)
		draw_dropshadow(90, 100, string(g.Kills), 1, white)
	}
	
	if (g.Seen >= 1) {
		draw_sprite_ext(spr_Gold, 0, 50, 200, 0.4, 0.4, 0, -1, 1)
		draw_dropshadow(90, 175, string(g.Gold), 1, white)
	}

	if (g.Inspect) {
		draw_sprite(spr_Menu, 0, 0, 0)
		draw_set_font(fnt_Code)
		draw_set_halign(fa_left)
		var code = ""
		if (g.Code >= 2) {
			if (g.Code >= 7) {
				code += "\nenemy_set_speed(2.5)"
			} else {
				code += "\nenemy_set_speed(2)"
			}
		}
		if (g.Code >= 3) {
			if (g.Code >= 8) {
				if (g.Code >= 11) {
					code += "\nenemy_set_hp(4)"
				} else {
					code += "\nenemy_set_hp(3)"
				}
			} else {
				code += "\nenemy_set_hp(2)"
			}
		}
		if (g.Code >= 10) {
			code += "\nenemy_add_loot('gold')"
		}
		if (g.Code >= 13) {
			code += "\nenemy_add_loot('heart')"
		}
		if (g.Code >= 4) {
			if (g.Code >= 9) {
				if (g.Code >= 12) {
					code += "\ngold_set_value(4)"
				} else {
					code += "\ngold_set_value(3)"
				}
			} else {
				code += "\ngold_set_value(2)"
			}
		}
		code += "\n\nforever {"
		if (g.Code >= 6) {
			code += "\n    enemy = choose('slime', 'wisp')"
			code += "\n    spawn_enemy(enemy)"
		} else {
			code += "\n    spawn_enemy('slime')"
		}
		if (g.Code >= 1) {
			code += "\n    spawn_loot('gold')"
		}
		if (g.Code >= 5) {
			code += "\n    spawn_loot('heart')"
		}
		if (g.Code >= 14) {
			code += "\n    shoot()"
		}
		if (g.Code >= 15) {
			code += "\n    break"
		}
		code += "\n}"
		var comment = "//press spacebar to close the computer"
		draw_dropshadow(250, 25, code, 0.6, white)
		draw_dropshadow(250, 1000, comment, 0.6, green)
	}
}