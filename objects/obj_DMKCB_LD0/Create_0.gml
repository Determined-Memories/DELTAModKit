_METHOD = "METHOD_PUZZLEPIECENPC_DARKNESS";

scr_createmethodforkey(_METHOD, function() {
	global.bossmsg = true;
	global.returnpoint = room_dw_test;
	global.msc = 20000
	global.debug = true;
	scr_text(20000)
	global.interact = true;
})

global.debug = false
