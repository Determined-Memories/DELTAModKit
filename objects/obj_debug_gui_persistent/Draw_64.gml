if DEBUGMODE {
	var fnt = draw_get_font();
	draw_set_font(fnt_comicsans);
	var col = draw_get_color();
	draw_set_color(c_black);
	draw_text_transformed(7, 7, safe_string_hash_to_newline(debugmessage), 1, 1, 0);
	draw_text_transformed(9, 7, safe_string_hash_to_newline(debugmessage), 1, 1, 0);
	draw_text_transformed(9, 9, safe_string_hash_to_newline(debugmessage), 1, 1, 0);
	draw_text_transformed(7, 9, safe_string_hash_to_newline(debugmessage), 1, 1, 0);
	draw_set_color(c_red);
	draw_text_transformed(8, 8, safe_string_hash_to_newline(debugmessage), 1, 1, 0);
	draw_set_color(col);
	draw_set_font(fnt);
} else exit;