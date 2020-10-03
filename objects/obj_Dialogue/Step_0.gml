var interact = (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space))

if (Progress < string_length(Message)) {
	if (interact) {
		Progress = string_length(Message)
	} else {
		Progress += 0.5
		if (Progress % 2 == 0) {
			audio_sound_pitch(snd_Text, random_range(0.95, 1.05))
			audio_play_sound(snd_Text, 1, false)
		}
	}
} else {
	if (interact) {
		ds_list_delete(Messages, 0)
		if (ds_list_size(Messages) > 0) {
			Progress = 0
			Message = Messages[| 0]
		} else {
			g.Goodbye = true
			instance_destroy()
		}
	}
}