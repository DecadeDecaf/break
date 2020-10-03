if (Life <= 0) {
	image_xscale -= 0.02
	image_yscale -= 0.02
	if (image_xscale <= 0 || image_yscale <= 0) {
		instance_destroy()
	}
	exit
}

x += lengthdir_x(Speed, Direction)
y += lengthdir_y(Speed, Direction)

Speed -= 0.25
Speed = max(Speed, 0)

Life -= 1