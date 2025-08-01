if (!shadinit)
{
    shadinit = 1;
    
    with (instance_create(0, 0, obj_floorshadow))
    {
        target = obj_mainchara;
        yoff = -8;
        stretch = 3;
    }
    
	with obj_caterpillarchara
	{
	    with (instance_create(0, 0, obj_floorshadow))
	    {
	        target = other.id;
	        yoff = -4;
	        stretch = 3;
	    }
	}
    
    with (obj_mainchara)
    {
        image_blend = c_black;
    }
    
    with (obj_caterpillarchara)
    {
        image_blend = c_black;
    }
    
    with (instance_create(0, 0, obj_sprhighlight))
    {
        target = obj_mainchara;
        yoffset = 4;
    }
    
	with obj_caterpillarchara
	{
	    with (instance_create(0, 0, obj_sprhighlight))
	    {
	        target = other.id;
			yoffset = 4;
	    }
	}
}

myfloor.image_blend = merge_color(c_black, obj_darkfountain.colcol, 0.5);

with (obj_sprhighlight)
{
    image_blend = obj_darkfountain.colcol;
}

with (myint)
{
	
	if myinteract == 999 && !d_ex()
	{
		myinteract = false;
	    global.interact = false;
	}
	
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgset(0, "* (It glows with a backwards light.)/");
		msgnext("* Seal the fountain?/")
		msgnext("\\C2")
		global.choice = -1
        global.choicemsg[0] = "#Seal it."
        global.choicemsg[1] = "#Do not."
        with (d_make())
        {
            side = 1;
        }
        
        myinteract = 4;
    }
    
    if (myinteract == 4 && global.choice != -1)
    {
	    myinteract = 999;
		k_d()
		if global.choice == 0
		{
			myinteract = false;
		    global.interact = false;
			global.tempflag[6] = true
			global.darkzone = false;
			global.fountainopen = false;
			room_goto(room_lw_dwtestclosed)
		}
    }
	
}

if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    
    with (obj_floorshadow)
    {
        instance_destroy();
    }
    
    with (obj_sprhighlight)
    {
        instance_destroy();
    }
}

if con == 2.5
{
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
	
	var _overridetarget = function() {
		if target.object_index == obj_mainchara
		{
			originaltarget = target
			target = other.kr_actor
		}
		if target.object_index == obj_caterpillarchara || object_get_parent(target.object_index) == obj_caterpillarchara
		{
			originaltarget = target
			with obj_actor
			{
				if name == other.target.name // Actors and Caterpillars both have [name]
				{
					other.target = id
				}
			}
		}}
	
	with obj_floorshadow
		method(id, _overridetarget)()
		
	with obj_sprhighlight
		method(id, _overridetarget)()
	
    with (obj_actor)
    {
        image_blend = c_black;
    }
    
}

if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    _floor_shadow_kris = instance_create(0, 0, obj_floorshadow);
    
    with (_floor_shadow_kris)
    {
        yoff = -8;
        stretch = 3;
    }
    
    _floor_shadow_kris.target = kr_actor;
    _floor_shadow_susie = instance_create(0, 0, obj_floorshadow);
    
    with (_floor_shadow_susie)
    {
        yoff = -24;
        stretch = 3;
    }
    
    _floor_shadow_susie.target = su_actor;
    _highlight_kris = instance_create(0, 0, obj_sprhighlight);
    
    with (_highlight_kris)
    {
        yoffset = 4;
    }
    
    _highlight_kris.target = kr_actor;
    _highlight_susie = instance_create(0, 0, obj_sprhighlight);
    
    with (_highlight_susie)
    {
        yoffset = 4;
    }
    
    _highlight_susie.target = su_actor;
    
    with (obj_actor)
    {
        image_blend = c_black;
    }
    
    var y_offset = 20;
    c_sel(kr);
    c_sprite(spr_kris_dw_landed);
    c_setxy(256, 221 + y_offset);
    c_sel(su);
    c_sprite(spr_susie_dw_landed);
    c_setxy(323, 205 + y_offset);
    c_mus2("initloop", "wind_highplace.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 180);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 180);
    c_wait(210);
    c_sel(su);
    c_autowalk(0);
    c_imageindex(1);
    c_wait(4);
    c_facing("d");
    c_halt();
    c_addxy(8, 0);
    c_var_instance(_floor_shadow_susie, "yoff", -4);
    c_sel(kr);
    c_autowalk(0);
    c_imageindex(1);
    c_wait(4);
    c_facing("d");
    c_halt();
    c_addxy(0, 4);
    c_wait(30);
    c_var_instance(id, "clean_up", true);
    c_wait(10);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_customfunc(function()
    {
        with (obj_caterpillarchara)
        {
            scr_caterpillar_interpolate();
        }
        
        obj_caterpillarchara.visible = 1;
        obj_caterpillarchara.fun = 0;
    });
    c_terminatekillactors();
}

if (clean_up)
{
    clean_up = false;
    obj_caterpillarchara.fun = 1;
    obj_caterpillarchara.x = su_actor.x;
    obj_caterpillarchara.y = su_actor.y;
    obj_caterpillarchara.sprite_index = su_actor.sprite_index;
    obj_caterpillarchara.image_index = su_actor.image_index;
    
    with (obj_caterpillarchara)
    {
        scr_caterpillar_interpolate();
    }
    
    shadinit = 0;
    exit;
}

if con == 4
{
	scr_levelup()
}

if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 230;
    con = 99;
    
    //with (_floor_shadow_kris)
    //{
    //    instance_destroy();
    //}
    
    //with (_floor_shadow_susie)
    //{
    //    instance_destroy();
    //}
    
    //with (_highlight_kris)
    //{
    //    instance_destroy();
    //}
    
    //with (_highlight_susie)
    //{
    //    instance_destroy();
    //}
}
