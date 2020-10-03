var edgeX = 480
var edgeY = 72

var border = 24
edgeX -= border
edgeY -= border

show_debug_message(Message)
var body = string_copy(Message, 1, Progress)

var size = 2/3

var xx = 960
var yy = 1080 - border

draw_sprite(spr_Box, 0, xx, yy)

draw_set_color($000000)
draw_set_font(fnt_Regular)

if (g.Shutdown) {
	draw_set_font(fnt_Code)
}

draw_set_halign(fa_left)
draw_text_transformed(xx - edgeX, yy - edgeY, body, size, size, 0)

draw_set_halign(fa_right)
draw_text_transformed(xx + edgeX, yy - edgeY, "E", size, size, 0)