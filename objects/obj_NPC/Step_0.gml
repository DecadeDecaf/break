function dialogue_start() {
	var dialogue = instance_create_depth(0, 0, -2500, obj_Dialogue)
	if (Goblin && g.Gold >= Payment) {
		g.Gold -= Payment
		Payment = round(Payment * 1.5)
		ds_list_copy(dialogue.Messages, Alts)
		g.Code += 1
	} else if (Thug && g.Kills >= Payment) {
		Payment = round(Payment * 1.5)
		ds_list_copy(dialogue.Messages, Alts)
		g.Code += 1
	} else if (Dark && g.Hearts >= Payment) {
		ds_list_copy(dialogue.Messages, Alts)
		g.Code += 1
		g.Die = true
	} else if (Xandra) {
		if (g.Code == 0 && g.Seen == 0) {
			ds_list_copy(dialogue.Messages, Alts)
			g.Code += 1
		} else {
			ds_list_copy(dialogue.Messages, Messages)
		}
	} else {
		ds_list_copy(dialogue.Messages, Messages)
	}
	dialogue.Message = dialogue.Messages[| 0]
	g.Talking = true
}

var interact = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E")))

var dis = point_distance(x, y, player.x, player.y)

if (interact && dis < 96 && !g.Talking) {
	if (Computer) {
		g.Inspect = true
		g.Talking = true
		audio_play_sound(snd_ComputerOn, 1, false)
	} else {
		dialogue_start()
	}
}

if (!Computer) {
	if (x < player.x - 32) {
		image_xscale = 0.25
	} else if (x > player.x + 32) {
		image_xscale = -0.25
	}
}

depth = round(-y)