depth = 99999999
tiledata = []
if layer_exists(mylayer)
{
	depth = layer_get_depth(mylayer)
	x = layer_get_x(mylayer)
	y = layer_get_y(mylayer)
	visible = layer_get_visible(mylayer)
	show_debug_message(layer_get_all_elements(mylayer))
}