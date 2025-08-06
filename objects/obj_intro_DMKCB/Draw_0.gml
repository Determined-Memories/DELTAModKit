logotimer++
    if (init == false && con == 1)
    {
        logopieces = 0;
        init = 1;
        
        for (i = 0; i < 9; i++)
        {
            drawlogopart[i] = 0;
        }
        
        con = 2;
        logotimer = 0;
    }
        
		if logotimer == 2
		{
			OBMADE = true;
			obacktimer = 99999;
			with DEVICE_OBACK_4
				b_insurance -= 0.25
		}
		
        if (logotimer == 30)
        {
            snd_play(snd_egg);
        }
		
		if logotimer >= 160
		{
			OBMADE = false;
			alpha -= 0.1;
		}
		
        if (logotimer >= 240)
        {
            room_goto(PLACE_MENU);
        }
		
	pal_swap_set(spr_introLogo_palette, clamp((logotimer - 150) / 20, 0, 2), false)
	draw_sprite_ext(spr_introLogo_ModKit_centered, 0, room_width / 2, (room_height / 2), 1, 1, 0, c_white, ((logotimer - 30) / 10) * alpha)
	draw_sprite_ext(spr_introLogo_ChaosBranch_centered, 0, room_width / 2, (room_height / 2) + 30, 1, 1, 0, c_white, ((logotimer - 35) / 10) * alpha)
	pal_swap_reset()