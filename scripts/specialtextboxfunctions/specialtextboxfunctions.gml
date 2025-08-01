
function d_make(side = -1, zurasu = -1, stay = -1, runcheck = -1, arg4 = -1)
{
    var _____d = instance_create(0, 0, obj_dialoguer);
    
    if (side != -1)
        _____d.side = side;
    
    if (zurasu != -1)
        _____d.zurasu = zurasu;
    
    if (stay != -1)
        _____d.stay = stay;
    
    if (runcheck != -1)
        _____d.runcheck = runcheck;
    
    if (arg4 != -1)
        _____d.preventcskip = runcheck;
    
    return _____d;
}

function d_ex()
{
    return instance_exists(obj_dialoguer);
}

function k_d(staytimer = 0)
{
    with (obj_dialoguer)
    {
        if (staytimer > 0)
        {
            var _stayer = instance_create_depth(x, y, depth + 1, obj_writer_stay);
            _stayer.side = side;
            _stayer.xoff = xoff;
            _stayer.yoff = yoff;
            _stayer.boxwidth = boxwidth;
            _stayer.boxheight = boxheight;
            _stayer.cur_jewel = cur_jewel;
            scr_doom(_stayer, staytimer);
        }
        
        instance_destroy();
    }
    
    with (obj_writer)
    {
        instance_destroy();
    }
}
