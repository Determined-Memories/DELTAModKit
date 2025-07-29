if (init == false) {
	if CUSTOM
	{
		if CUSTOM_IMAGESPEED != -1
		{
			TALKSPRITE = false;
			normalanim = false;
			image_speed = CUSTOM_IMAGESPEED;
		}
		sprite_index = CUSTOM_SPRITE;

		if !is_array(CUSTOM_TEXT)
		{
			if is_string(CUSTOM_TEXT)
			{
	            var _method = noone
	            if asset_get_index("scr_getmethodbykey") > 0  // Just incase if the methodkey system is missing.
				    _method = scr_getmethodbykey(CUSTOM_TEXT, noone);
				if _method != noone
				{
					USECUSTOMFUNC = true;
					CUSTOM_FUNC = _method;
				}
				else
				{
					CUSTOM_TEXT = [string(CUSTOM_TEXT)];
				}
				show_debug_message(_method)
			}
			else
			{
				CUSTOM_TEXT = ["* The gash weaves down as if you cry./%"];
			}
		}
		debug_message("*** Custom NPC Created, Use Func: (" + string(USECUSTOMFUNC) + ") Message: (" + string(CUSTOM_TEXT) + ")")
	}
	init = true;
}

var objInd = obj_writer;

if (normalanim == 1)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
        {
            image_speed = 0;
            image_index = 0;
        }
        
        if (objInd.halt == 0)
            image_speed = remanimspeed;
    }
}

if (normalanim == 1 || normalanim == 2)
{
    if (myinteract == 0)
    {
        image_index = 0;
        image_speed = 0;
    }
}

if (normalanim == 3)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
            image_speed = remanimspeed;
        
        if (objInd.halt == 0)
            image_speed = remanimspeed / 2;
    }
    else
    {
        image_speed = remanimspeed;
    }
}

if (normalanim == 4)
{
    image_index = 0;
    image_speed = 0;
}

if (normalanim == 5)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        image_speed = 0;
        image_index = 1;
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
}

if (normalanim == 6)
{
    if (myinteract > 0 && instance_exists(objInd))
    {
        if (objInd.halt > 0)
        {
            image_speed = 0;
            image_index = 0;
        }
        
        if (objInd.halt == 0)
        {
            image_speed = 0;
            image_index = 1;
        }
    }
}