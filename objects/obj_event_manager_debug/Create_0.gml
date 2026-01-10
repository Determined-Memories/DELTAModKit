debug_verbose = false;
debug_notifs_enabled = false;
debug_progress_enabled = false;

trophy_enable_debug_notifications = function() {
	debug_notifs_enabled = true
};

trophy_disable_debug_notifications = function() {
	debug_notifs_enabled = false
};

trophy_enable_debug_verbose = function() {
	debug_verbose = true
};

trophy_disable_debug_verbose = function() {
	debug_verbose = false
};

trophy_show_debug_progress = function() {
	debug_progress_enabled = true
};

trophy_hide_debug_progress = function() {
	debug_progress_enabled = false
};

trophy_show_debug_message = function(_debug_message, arg1 = -1, arg2 = true) {
	debug_message(_debug_message)
	debug_message(arg1)
	debug_message(arg2)
};

trophy_get_name = function(arg0) {
	
};

trophy_get_flag_name = function(arg0) {
};
