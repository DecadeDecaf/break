var space = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E")))

if (space) {
	if (room == rm_Game && g.Inspect) {
		g.Goodbye = true
		g.Seen = g.Code
		audio_play_sound(snd_ComputerOff, 1, false)
		audio_stop_sound(snd_ComputerOn)
	}
}