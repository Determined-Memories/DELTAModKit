mylayer = layer_get_id(mylayername)

if init == false && layer_exists(mylayer)
{
	layer = mylayer
	depth = layer_get_depth(mylayer)
	x = layer_get_x(mylayer)
	y = layer_get_y(mylayer)
	visible = layer_get_visible(mylayer)
	
	//show_debug_message("LAYER " + string(mylayername) + " --- TILEMAP:" + string(layer_tilemap_get_id(mylayer)))
	
	tiledata = layer_tilemap_get_id(mylayer)
	init = true;
}

if !init
{
	__tries++
	if __tries > 20
	{
		show_debug_message("*** FAILED TO FIND TILESET " + string(mylayername))
		instance_destroy()
	}
}