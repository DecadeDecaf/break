var lay = layer_get_id("Tiles")
var tiles = layer_tilemap_get_id(lay)

var height = tilemap_get_height(tiles)
var width = tilemap_get_width(tiles)

if (room == rm_Game) {
	for (var yy = 0; yy < height; yy++) {
		for (var xx = 0; xx < width; xx++) {
			var tile = tilemap_get(tiles, xx, yy)
			if (tile == 8) {
				var newtile = choose(1, 8, 9, 16, 17)
				tilemap_set(tiles, newtile, xx, yy)
			}
		}
	}
}