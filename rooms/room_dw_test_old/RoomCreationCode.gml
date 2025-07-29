global.bossmsg = true;
global.returnpoint = room_dw_test;

scr_createmethodforkey("TESTMETHODNPC_RETURNTONEW", function() {
	global.msc = 20000
	scr_text(20000)
	global.interact = true;
})