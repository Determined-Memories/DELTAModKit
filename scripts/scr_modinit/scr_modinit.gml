
#macro DEBUGMODE false /* Set to False to Disable Debug.*/

function scr_modinit() {
	global.fountainopen = true;
	scr_addglobalstosavesystem("--TESTCATERGORY--", ["chapter", "debug", "fountainopen"])
	scr_createfacingsprites("noellech4room", spr_noelle_walk_down_lw_sideb_room, spr_noelle_walk_left_lw_sideb_room, spr_noelle_walk_up_lw_sideb_room, spr_noelle_walk_right_lw_sideb_room)
}