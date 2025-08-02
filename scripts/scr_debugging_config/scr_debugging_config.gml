global.debug = true
function scr_debug() { return global.debug; }
function scr_debug_get_start_room() {
	//global.char[0] = 4
	//global.char[1] = 2
	//global.char[2] = 1
	//global.darkzone = true; 
	//global.flag[915] = 0xFF
	//return room_dw_lostindarkness
	//show_debug_message(array_length(global.char))
	
	global.darkzone = true; 
	return keyboard_check_direct(vk_alt) ? PLACE_MENU : room_dw_test; 
	}