if global.tempflag[6]
{
	global.tempflag[6] = false;
	global.fountainopen = true;
}
snd_free_all()

timer = 0;
con = 0;
myfloor = scr_marker_ext(240, 280, 1021, 161, 200, 0, undefined, undefined, 900000);
myfloorbg = scr_marker_ext(0, 280, 1021, 640, 200, 0, undefined, 0, 900001);
myint = instance_create(240, 240, obj_trigger_interact);
scr_size(10, 2.5, myint);
myint.strict = true;
myint.talked = 0;
fountain = instance_create(224, 0, obj_darkfountain);
scr_size(2, 2, fountain);

shadinit = 0;
con = -1;
customcon = 0;
clean_up = false;

if (global.plot >= 225 && global.plot < 230)
{
    con = 0;
    scr_setparty(1, 0, 0);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    
}
else if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init("wind_highplace.ogg");
    global.currentsong[1] = mus_loop(global.currentsong[0]);
}
