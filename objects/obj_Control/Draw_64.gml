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
var red = $5D55F5

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

	if (g.Code >= 1) {
		draw_sprite_ext(spr_Disk, 0, 50, 1025, 0.4, 0.4, 0, -1, 1)
		draw_dropshadow(90, 1000, g.Code - g.Seen, 1, white)
	}
	
	draw_set_halign(fa_center)
	
	if (g.Seen >= -1) {
		draw_sprite_ext(spr_Mouse, 0, 1775, 1000, 0.4, 0.4, 0, -1, 1)
		draw_dropshadow(1775, 1025, "Wand", 0.6, white)
	}

	if (g.Seen >= 10) {
		draw_sprite_ext(spr_Mouse, 1, 1850, 1000, 0.4, 0.4, 0, -1, 1)
		draw_dropshadow(1850, 1025, "Alt", 0.6, white)
	} else {
		draw_sprite_ext(spr_Mouse, 1, 1850, 1000, 0.4, 0.4, 0, -1, 1)
		draw_dropshadow(1850, 1025, "???", 0.6, white)
	}

	if (g.Inspect) {
		draw_sprite(spr_Menu, 0, 0, 0)
		draw_set_font(fnt_Code)
		draw_set_halign(fa_left)
		var code = ""
		var newcode = ""
		var important = ds_list_create()
		if (g.Code >= 7) {
			if (g.Code >= 13) {
				code += "\nplayer_set_firingspeed(12)"
				newcode += "\n"
				if (g.Seen < 13) {
					newcode += "(new)"
				}
			} else {
				code += "\nplayer_set_firingspeed(18)"
				newcode += "\n"
				if (g.Seen < 7) {
					newcode += "(new)"
				}
			}
		}
		if (g.Code >= 10) {
			code += "\nplayer_allow_altfire(true)"
			newcode += "\n"
			if (g.Seen < 10) {
				newcode += "(new)"
			}
		}
		if (g.Code >= 2) {
			code += "\nenemy_set_speed(2.5)"
			newcode += "\n"
			if (g.Seen < 2) {
				newcode += "(new)"
			}
		}
		if (g.Code >= 3) {
			if (g.Code >= 8) {
				code += "\nenemy_set_hp(3)"
				newcode += "\n"
				if (g.Seen < 8) {
					newcode += "(new)"
				}
			} else {
				code += "\nenemy_set_hp(2)"
				newcode += "\n"
				if (g.Seen < 3) {
					newcode += "(new)"
				}
			}
		}
		if (g.Code >= 4) {
			if (g.Code >= 9) {
				if (g.Code >= 12) {
					code += "\ngold_set_value(8)"
					newcode += "\n"
					if (g.Seen < 12) {
						newcode += "(new)"
					}
				} else {
					code += "\ngold_set_value(4)"
					newcode += "\n"
					if (g.Seen < 9) {
						newcode += "(new)"
					}
				}
			} else {
				code += "\ngold_set_value(2)"
				newcode += "\n"
				if (g.Seen < 4) {
					newcode += "(new)"
				}
			}
		}
		code += "\n\nforever {"
		newcode += "\n\n"
		if (g.Code >= 11) {
			code += "\n    enemy = choose('slime', 'wisp', 'gold slime', 'gold wisp')"
			code += "\n    spawn_enemy(enemy)"
			newcode += "\n"
			if (g.Seen < 11) {
				newcode += "(new)"
			}
			newcode += "\n"
		} else if (g.Code >= 6) {
			code += "\n    enemy = choose('slime', 'wisp')"
			code += "\n    spawn_enemy(enemy)"
			newcode += "\n"
			if (g.Seen < 6) {
				newcode += "(new)"
			}
			newcode += "\n"
		} else {
			code += "\n    spawn_enemy('slime')"
			newcode += "\n"
			if (g.Seen < 0) {
				newcode += "(new)"
			}
		}
		if (g.Code >= 1) {
			code += "\n    spawn_loot('gold')"
			newcode += "\n"
			if (g.Seen < 1) {
				newcode += "(new)"
			}
		}
		if (g.Code >= 5) {
			code += "\n    spawn_loot('heart')"
			newcode += "\n"
			if (g.Seen < 5) {
				newcode += "(new)"
			}
		}
		if (g.Code >= 14) {
			code += "\n    player_shoot()"
			newcode += "\n"
			if (g.Seen < 14) {
				newcode += "(new)"
			}
		}
		if (g.Code >= 15) {
			code += "\n    break"
			newcode += "\n"
			if (g.Seen < 15) {
				newcode += "(new)"
			}
		}
		code += "\n}"
		var comment = "//press spacebar to close the computer"
		draw_dropshadow(220, 0, code, 0.6, white)
		draw_dropshadow(120, 0, newcode, 0.6, red)
		draw_dropshadow(220, 1000, comment, 0.6, green)
		ds_list_destroy(important)
	}
}