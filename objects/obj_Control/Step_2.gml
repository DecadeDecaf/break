if (g.Goodbye) {
	g.Talking = false
	g.Inspect = false
	g.Goodbye = false
	if (g.Die) {
		g.Die = false
		g.Flash = 60
		g.Hearts = 3
		g.Gold = 0
		player.x = 1900
		player.y = 1150
		with (obj_NPC) {
			if (Dark) {
				instance_destroy()
			}
		}
	}
	if (g.Shutdown) {
		g.Shutdown = false
		game_end()
		exit
	}
	if (g.Seen >= 15) {
		with (obj_NPC) {
			if (Computer) {
				dialogue_start()
				g.Shutdown = true
			}
		}
	}
}