if active
	if (global.plot >= plot_begin && global.plot < plot_end)
	{
	    pal_swap_layer_init();
    
	    for (var i = 0; i < array_length(layer_name); i++)
	    {
	        pal_swap_enable_layer(layer_name[i]);
	        pal_swap_set_layer(palette_sprite, palette_index, layer_name[i], false);
	    }
    
	    pal_swap_reset();
	}
