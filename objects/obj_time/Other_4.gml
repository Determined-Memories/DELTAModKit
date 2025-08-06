if os_browser
{
	var i = 0
	var layers = []
	var _layers = layer_get_all()
	while i < array_length(_layers)
	{
		var _layer = _layers[i];
		var allelements = layer_get_all_elements(_layer)
		if array_length(allelements) == 1
		{
			if layer_get_element_type(allelements[0]) == 5
			{
				var tilerender = instance_create(0, 0, obj_roomtilerenderer)
				tilerender.mylayername = layer_get_name(_layer)
				array_push(layers, layer_get_name(_layer))
			}
		}
		i++;
	}
	//with obj_roomtilerenderer
	//	show_debug_message(mylayername)
	//show_debug_message(layers)
	
}