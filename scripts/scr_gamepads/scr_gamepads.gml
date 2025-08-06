function scr_gamepad_axis_check(gamepad, fourdirectionaxisvalue)
{
    axis_value = obj_time.axis_value;
    __returnvalue = false;
    
    if (fourdirectionaxisvalue == 0)
    {
        if (gamepad_axis_value(gamepad, gp_axislv) >= axis_value)
        {
            __returnvalue = true;
        }
    }
    
    if (fourdirectionaxisvalue == 1)
    {
        if (gamepad_axis_value(gamepad, gp_axislh) >= axis_value)
        {
            __returnvalue = true;
        }
    }
    
    if (fourdirectionaxisvalue == 2)
    {
        if (gamepad_axis_value(gamepad, gp_axislv) <= -axis_value)
        {
            __returnvalue = true;
        }
    }
    
    if (fourdirectionaxisvalue == 3)
    {
        if (gamepad_axis_value(gamepad, gp_axislh) <= -axis_value)
        {
            __returnvalue = true;
        }
    }
    
    return __returnvalue;
}

function scr_gamepad_check_pressed_any()
{
    var button_pressed;
    
    if !i_ex(obj_gamecontroller)
        return false;
    else
    {
        button_pressed = false;
        
        for (var i = 0; i < 10; i += 1)
	    if gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, global.input_g[i])
	    {
	        button_pressed = true;
	        break;
	    }
    }
    
    return button_pressed;
}

function scr_gamepad_check_any()
{
    var any_input;
    
    if (!i_ex(obj_gamecontroller))
        return false;
    else
    {
        any_input = false;
        
        for (var i = 0; i < 4; i += 1)
        if scr_gamepad_axis_check(obj_gamecontroller.gamepad_id, i) {
            any_input = true;
            break;
        }
        
        for (var i = 0; i < 10; i += 1)
        if gamepad_button_check(obj_gamecontroller.gamepad_id, global.input_g[i]) {
            any_input = true;
            break;
        }
    }
    
    return any_input;
}
