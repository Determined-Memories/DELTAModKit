if init
{
	depth = layer_get_depth(mylayer)
	x = layer_get_x(mylayer)
	y = layer_get_y(mylayer)
	visible = layer_get_visible(mylayer)
	if variable_global_exists("retro_pal_swapper")
	{
		var data = global.retro_pal_swapper.layer_map[? mylayername]
		if !is_undefined(data)
		{
			show_debug_message(data)
			palsprite = data.sprite
			palindex = data.index
			palsurf = data.is_surf
		}
	}
	if sprite != -1
		pal_swap_set(palsprite, palindex, palsurf)
	draw_tilemap(tiledata, x, y)
	pal_swap_reset()
}