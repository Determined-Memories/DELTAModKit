function scr_darkbox(x1, y1, x2, y2){
    cur_jewel += 1;
	
    textbox_width = x2 - x1 - 63;
    if textbox_width < 0
		textbox_width = 0;
    
    textbox_height = y2 - y1 - 63;
    if textbox_height < 0 
		textbox_height = 0;
    
    if textbox_width > 0 {
        draw_sprite_stretched(spr_textbox_top, 0, x1 + 32, y1, textbox_width, 32);
        draw_sprite_ext(spr_textbox_top, 0, x1 + 32, y2 + 1, textbox_width, -2, 0, c_white, 1);
    }
    
    if textbox_height > 0 {
        draw_sprite_ext(spr_textbox_left, 0, x2 + 1, y1 + 32, -2, textbox_height, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_left, 0, x1, y1 + 32, 2, textbox_height, 0, c_white, 1);
    }
    if !scr_flag_get(8) {
        draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, x1, y1, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, x2 + 1, y1, -2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, x1, y2 + 1, 2, -2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, x2 + 1, y2 + 1, -2, -2, 0, c_white, 1);
    }
    else {
        draw_sprite_ext(spr_textbox_topleft, 0, x1, y1, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, 0, x2 + 1, y1, -2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, 0, x1, y2 + 1, 2, -2, 0, c_white, 1);
        draw_sprite_ext(spr_textbox_topleft, 0, x2 + 1, y2 + 1, -2, -2, 0, c_white, 1);
    }
}


function scr_darkbox_black(x1, y1, x2, y2){
    draw_set_color(c_black);
    draw_rectangle(x1 + 20, y1 + 20, x2 - 20, y2 - 20, false);
    scr_darkbox(x1, y1, x2, y2);
	draw_set_color(c_white);
}

function scr_terminate_writer(){
    __writerkilled = false;
    __writerkillable = false;
    __writerended = false;
    
    if instance_exists(obj_writer){
        obj_writer.__endcheckid = id;
        
        with obj_writer
            if reachedend == true
                with __endcheckid
                    __writerended++;
        
        if __writerended == instance_number(obj_writer)
            __writerkillable = true;
    }
    else
        __writerkilled = true;
    
    if button1_p() && __writerkillable == true {
        with (obj_writer)
            instance_destroy();
        
        __writerkilled = true;
    }
    
    return __writerkilled;
}