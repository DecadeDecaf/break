Speed = 1.5

if (g.Seen >= 2) {
	Speed = 2.5
}

HP = 1

if (g.Seen >= 3) {
	if (g.Seen >= 8) {
		HP = 3
	} else {
		HP = 2
	}
}

Cooldown = 0

Knockback = 0
Direction = 0

Wisp = false
Golden = false

FrameCount = 0

image_xscale = 0
image_yscale = 0