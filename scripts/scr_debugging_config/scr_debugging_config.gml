global.debug = true
function scr_debug() { return global.debug; }
function scr_debug_get_start_room() {
	global.char[0] = 1
	global.char[1] = 4
	global.char[2] = 0
	show_debug_message(array_length(global.char))
	global.darkzone = true; 
	return keyboard_check_direct(vk_anykey) ? PLACE_MENU : room_dw_test; 
	}