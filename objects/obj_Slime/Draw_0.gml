if (Wisp) {
	if (Golden) {
		sprite_index = spr_Wisp
	} else {
		sprite_index = spr_Wisp
	}
} else if (Golden && sprite_index != spr_GoldSlime) {
	sprite_index = spr_GoldSlime
}

draw_self()