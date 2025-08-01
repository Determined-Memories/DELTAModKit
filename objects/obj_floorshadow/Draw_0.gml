// I'm ready for ALL of this to break when Gamemaker Finally splits booleans apart from reals < Though toby wouldn't have to deal with it since their team are on LTS, Not Beta >

if (!i_ex(target) || !target.visible)
{
    exit;
}

image_blend = merge_color(c_black, c_white, image_alpha);
sprite_index = target.sprite_index;
image_index = target.image_index;
image_xscale = target.image_xscale;
image_yscale = target.image_yscale;

if (sprite_index == noone) || !sprite_exists(sprite_index) // Last I checked, noone is not the correct thing here toby.
{
    exit;
}

var _xoff = xoff;
var _yoff = yoff;

if (!ignorepreset)
{
    if (name == "kris")
    {
        _yoff = -6 - (2 * (stretch - 1));
    }
    
    if (name == "ralsei")
    {
        _yoff = -4 - (4 * (stretch - 1));
    }
    
    if (name == "susie")
    {
        _yoff = -2;
    }
}

if (target.image_angle != 0 && stretch == true)
{
    var _angle = target.image_angle % 360;
    var _ydist;
    
    if (_angle > 90 && _angle < 270)
    {
        _ydist = lengthdir_y(sprite_yoffset, _angle + 90);
    }
    else
    {
        _ydist = lengthdir_y(sprite_height - sprite_yoffset, _angle - 90);
    }
    
    var _xdist;
    
    if (_angle >= 0 && _angle <= 180)
    {
        _xdist = lengthdir_y(sprite_xoffset, _angle + 180);
    }
    else
    {
        _xdist = lengthdir_y(sprite_width - sprite_xoffset, _angle);
    }
    
    draw_sprite_ext(sprite_index, image_index, target.x + _xoff, target.y + _yoff + ((_ydist + _xdist) * 2), image_xscale, -image_yscale, -target.image_angle, c_black, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, target.x + _xoff, target.y + abs((sprite_height * (stretch + 1)) - (sprite_yoffset * (stretch + 1))) + _yoff, image_xscale, -image_yscale * stretch, -target.image_angle, c_black, image_alpha);
}
