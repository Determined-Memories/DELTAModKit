function scr_marker(arg0, arg1, arg2)
{
    thismarker = instance_create(arg0, arg1, obj_marker);
    
    with (thismarker)
    {
        sprite_index = arg2;
        image_speed = 0;
    }
    
    return thismarker;
}

function scr_dark_marker(arg0, arg1, arg2)
{
    thismarker = instance_create(arg0, arg1, obj_marker);
    
    with (thismarker)
    {
        sprite_index = arg2;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
    }
    
    return thismarker;
}

function scr_marker_ext(x, y, sprite, xscale = 1, yscale = 1, imgspd = 0, imgindex = 0, blend = 16777215, _depth = depth, autodepth = false, doomtimer = -1, alpha = 1)
{
    var thismarker = instance_create(x, y, obj_marker);
    
    with (thismarker)
    {
        depth = _depth;
        sprite_index = sprite;
        image_speed = imgspd;
        image_xscale = xscale;
        image_yscale = yscale;
        image_index = imgindex;
        image_blend = blend;
        image_alpha = alpha;
        
        if (autodepth)
        {
            scr_depth_alt();
        }
    }
    
    if (doomtimer > 0)
    {
        scr_doom(thismarker, doomtimer);
    }
    
    return thismarker;
}

function scr_marker_fromasset(arg0, arg1 = depth, arg2 = false)
{
    if (is_undefined(arg0))
    {
        debug_message("Warning: scr_marker_fromasset() sprite_instance didn't exist");
        return -4;
    }
    
    var sprite = layer_sprite_get_sprite(arg0);
    var index = layer_sprite_get_index(arg0);
    var imagespeed = layer_sprite_get_speed(arg0);
    var xscale = layer_sprite_get_xscale(arg0);
    var yscale = layer_sprite_get_yscale(arg0);
    var angle = layer_sprite_get_angle(arg0);
    var blend = layer_sprite_get_blend(arg0);
    var alpha = layer_sprite_get_alpha(arg0);
    var xloc = layer_sprite_get_x(arg0);
    var yloc = layer_sprite_get_y(arg0);
    var thismarker = instance_create_depth(xloc, yloc, arg1, obj_marker);
    
    with (thismarker)
    {
        sprite_index = sprite;
        image_index = index;
        image_speed = imagespeed;
        image_xscale = xscale;
        image_yscale = yscale;
        image_angle = angle;
        image_blend = blend;
        image_alpha = alpha;
        
        if (arg2)
        {
            scr_depth_alt(id, arg2);
        }
    }
    
    return thismarker;
}

function scr_assetgetinfo(assetlayer)
{
    var sprite = layer_sprite_get_sprite(assetlayer);
    var index = layer_sprite_get_index(assetlayer);
    var xloc = layer_sprite_get_x(assetlayer);
    var yloc = layer_sprite_get_y(assetlayer);
    var xscale = layer_sprite_get_xscale(assetlayer);
    var yscale = layer_sprite_get_yscale(assetlayer);
    var angle = layer_sprite_get_angle(assetlayer);
    var blend = layer_sprite_get_blend(assetlayer);
    var alpha = layer_sprite_get_alpha(assetlayer);
    var imagespeed = layer_sprite_get_speed(assetlayer);
    return [sprite, index, xloc, yloc, xscale, yscale, angle, blend, alpha, imagespeed];
}
