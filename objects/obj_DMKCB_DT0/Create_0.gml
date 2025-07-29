wraptimes = 0;

target = obj_mainchara

target.xprev = target.x
target.yprev = target.y

_METHOD = "METHOD_PUZZLEPIECEGONERNPC_DARKNESS";

mainnpc = obj_npc_room.id;

scr_createmethodforkey(_METHOD, function() {
	global.bossmsg = false;
	global.returnpoint = room_dw_lostindarkness;
	global.msc = 20000
	scr_text(20000)
	global.interact = true;
})

wrapnpc = instance_create(-9999, -9999, obj_npc_room);
wrapnpc.CUSTOM = true;
wrapnpc.CUSTOM_TEXT = _METHOD;
wrapnpc.CUSTOM_SPRITE = spr_npc_puzzlepiece_goner_faceaway;
wrapnpc.image_xscale = 2;
wrapnpc.image_yscale = 2;
wrapnpc.image_yscale = 2;