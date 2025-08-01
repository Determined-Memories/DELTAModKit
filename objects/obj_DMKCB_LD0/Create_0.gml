_METHOD = "METHOD_PUZZLEPIECENPC_DARKNESS";

holidaysmode = false;

if scr_havechar(DRCharacter.Noelle) && scr_sideb_active()
	holidaysmode = true;

noelle = noone

scr_createmethodforkey(_METHOD, function() {
	global.bossmsg = true;
	global.returnpoint = room_dw_test;
	global.msc = 20000
	global.debug = true;
	scr_text(20000)
	global.interact = true;
})

global.debug = false

if holidaysmode
{
	noelle = instance_create(obj_mainchara.x, obj_mainchara.y, obj_caterpillarchara);
	with noelle
	{
		scr_set_facing_sprites("noellech4room")
		name = "noelle"
	}
	with obj_mainchara
	{
		scr_set_facing_sprites("krislight")
		name = "kris"
		_palsprite = pal_krislight
	}
	
	with all
	{
		if variable_instance_exists(id, "extflag")
		{
			if extflag == "holidaysremove"
				instance_destroy();
		}
	}
	
}