Speed = 1.5

if (g.Seen >= 2) {
	if (g.Seen >= 7) {
		Speed = 2.5
	} else {
		Speed = 2
	}
}

HP = 1

if (g.Seen >= 3) {
	if (g.Seen >= 8) {
		if (g.Seen >= 11) {
			HP = 4
		} else {
			HP = 3
		}
	} else {
		HP = 2
	}
}

Cooldown = 0

Knockback = 0
Direction = 0

Wisp = false

FrameCount = 0

image_xscale = 0
image_yscale = 0