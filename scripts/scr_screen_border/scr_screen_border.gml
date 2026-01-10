function scr_enable_screen_border(enable){
    enable = enable != false; // this is pointless // I would assume it's meant to be like "If you're not a bool, you're a bool now" Though... Still, It is pointless.
    
    if (enable != global.screen_border_active)
    {
        global.screen_border_active = enable != false;
        global.screen_border_state = 0;
        global.screen_border_dynamic_fade_id = 0;
        global.screen_border_dynamic_fade_level = 0;
    }
}
