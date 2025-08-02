with (obj_darkcontroller)
{
    charcon = false;
}

global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
{
    global.typer = 6;
}

global.fc = 0;
global.fe = 0;
global.interact = 1;
image_index = 1;
global.msg[0] = stringsetloc("* (It won't open.)/%", "obj_treasure_room_slash_Other_10_gml_14_0");
var empty = false;

if (global.flag[itemflag] == 1)
{
    empty = true;
}

if (tempchest == 1)
{
    empty = false;
}

if (empty)
{
    global.msg[0] = stringsetloc("* (The chest is empty.)/%", "obj_treasure_room_slash_Other_10_gml_18_0");
}
else
{
    snd_play(snd_locker);
    var itemgetstring = scr_itemget_anytype_text(itemidchest, itemtype);
    msgsetsub(0, "* (You opened the treasure chest.^1)&* (Inside was \\cY~1\\cW.)/", itemname, "obj_treasure_room_slash_Other_10_gml_65_0");
	if extratext
		msgnext(scr_getstringloc(CUSTOM_EXTRATEXT) + "/");
    msgnext(itemgetstring);
    
	if itemtype == "flag" // Custom.
	{
		scr_speaker("no_name")
		msgset(0, "* (You opened the treasure chest.)/")
		if extratext
			msgnext(scr_getstringloc(CUSTOM_EXTRATEXT) + "/%");
		else
			msgnext("* (Inside was nothing.)&* (It feels like something has changed.)");
		show_debug_message(CUSTOM_ITEM)
		scr_flag_set(CUSTOM_EXTRAVALUE, itemidchest)
	}
	
    if (itemtype == "nothing")
    {
        scr_speaker("no_name");
        msgset(0, "* (You opened the treasure chest.)/", "obj_treasure_room_slash_Other_10_gml_30_0");
        msgnext("* (Inside was nothing.)/%", "obj_treasure_room_slash_Other_10_gml_31_0");
        noroom = 0;
        close = 0;
    }
    
    if (noroom == false)
    {
        if (tempchest == 1)
        {
            tempchest = 2;
        }
        else
        {
            global.flag[itemflag] = true;
        }
        
        //with (obj_event_manager) // This is for Playstation trophies.
        //{
        //    trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_23, UnknownEnum.Value_939);
        //}
    }
    else
    {
        close = true;
    }
}

myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
talked += 1;