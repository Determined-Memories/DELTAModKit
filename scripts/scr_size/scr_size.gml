function scr_size(xscale = image_xscale, yscale = image_yscale, instance = id)
{
    with (instance)
    {
        image_xscale = xscale;
        image_yscale = yscale;
    }
}

function scr_sizeexact(width, height, instance = id)
{
    with (instance)
    {
        if (!sprite_exists(sprite_index))
        {
            debug_message("Can't size, no sprite");
            exit;
        }
        
        var _w = sprite_get_width(sprite_index);
        var _h = sprite_get_width(sprite_index);
        image_xscale = width / _w;
        image_yscale = height / _h;
    }
}
