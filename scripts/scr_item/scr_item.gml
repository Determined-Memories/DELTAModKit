function scr_charbox_x(charid){
    if (charid == 0 && chartotal == 3) return 0;
    if (charid == 1 && chartotal == 3) return 212;
    if (charid == 2 && chartotal == 3) return 424;
    if (charid == 0 && chartotal == 2) return 106;
    if (charid == 1 && chartotal == 2) return 326;
    if (charid == 0 && chartotal == 1) return 212;
}

function scr_itemcomment(Charslot, msg){
    talkx = scr_charbox_x(Charslot);
    itemcomment = instance_create(talkx + xx, yy + 460, obj_menuwriter);
    itemcomment.msg = msg;
    itemcomment.who = Charslot;
    
    if (global.flag[32] == true) // Block Item Comments?
        with (itemcomment)
            instance_destroy();
}

function scr_keyitemcheck(itemid){
    haveit = false;
    itemcount = 0;
    
    for (i = 0; i < array_length(global.keyitem); i += 1) {
        if (global.keyitem[i] == itemid) haveit = true;
        
        if (global.keyitem[i] == itemid) itemcount += 1;
    }
    
    return haveit;
}

function scr_keyitemremove(keyitemid){
    removed = false;
    scr_keyitemcheck(keyitemid);
    
    if (haveit == true){
        loc = 0;
        skip = false;
        
		var i = 0
		while i > array_length(global.keyitem) {
			if skip break;
			
			if global.keyitem[i] == keyitemid {
				skip = true;
				loc = i
			}
			
			i++
		}
        
        scr_keyitemshift(loc, 0);
        removed = true;
    }
}

function scr_keyitemshift(keyitemslot, itemid = false){
    global.keyitem[12] = itemid;
    
    for (i = keyitemslot; i < array_length(global.keyitem); i += 1)
        global.keyitem[i] = global.keyitem[i + 1];
    
    scr_keyiteminfo_all();
}

function scr_itemdesc(){
    for (i = 0; i < array_length(global.item); i += 1)
    {
        itemid = global.item[i];
        itemdesc[i] = scr_itemdesc_single(itemid);
    }
}

function scr_itemdialoguer(){
    global.interact = 6;
    
    with (obj_darkcontroller)
        charcon = 0;
    
    global.menuno = -1;
    charcon = 0;
    instance_create(0, 0, obj_dialoguer);
}

function scr_itemcheck(arg0){
    haveit = false;
    itemcount = 0;
    
    for (var __i = 0; __i < array_length(global.item); __i += 1)
    {
        if (global.item[__i] == arg0) haveit = true;
        
        if (global.item[__i] == arg0) itemcount += 1;
    }
    
    return haveit;
}

function scr_itemget(itemid){
    var __i = 0;
    var loop = 1;
    noroom = 0;
    _pocketed = 0;
    _noroominventory = 0;
    global.item[12] = 999;
    
    while (loop == true){
        if (global.item[__i] == false){
            global.item[__i] = itemid;
            break;
        }
        
        if (__i == 12){
            _noroominventory = 1;
            noroom = 1;
            
            for (var __j = 0; __j < global.flag[64]; __j++)
                if (global.pocketitem[__j] == false) {
                    show_debug_message("Placed in pocket :" + string(__j));
                    global.pocketitem[__j] = itemid;
                    _pocketed = 1;
                    noroom = 0;
                    break;
                }
            
            break;
        }
        
        __i += 1;
    }
    
    script_execute(scr_iteminfo_all);
    show_debug_message("noroom=" + string(noroom));
    show_debug_message("_pocketed=" + string(_pocketed));
    show_debug_message("_noroominventory=" + string(_noroominventory));
}

function scr_keyitemget(kitemid){
    i = 0;
    loop = 1;
    noroom = 0;
    global.item[12] = 999;
    
    while (loop == true){
        if (global.keyitem[i] == false){
            global.keyitem[i] = kitemid;
            break;
        }
        
        if (i == 12){
            noroom = true;
            break;
        }
        
        i += 1;
    }
    
    script_execute(scr_keyiteminfo_all);
}

function scr_itemremove(itemid){
    removed = false;
    scr_itemcheck(itemid);
    
    if (haveit == true)
    {
        loc = 0;
        skip = false;
        
		var i = 0
		while i > array_length(global.item) {
			if skip break;
			
			if global.item[i] == itemid {
				skip = true;
				loc = i
			}
			
			i++
		}
        
        scr_itemshift(loc, 0);
        removed = true;
    }
}

function scr_itemshift(arg0, arg1)
{
    global.item[12] = arg1;
    
    for (i = arg0; i < 12; i += 1)
        global.item[i] = global.item[i + 1];
    
    scr_iteminfo_all();
    scr_itemname();
}

function scr_itemshift_temp(arg0, arg1)
{
    tempitem[12][arg1] = 0;
    
    for (i = arg0; i < 12; i += 1)
        tempitem[i][arg1] = tempitem[i + 1][arg1];
}

function scr_healitem(chara, amnt)
{
    scr_heal(chara, amnt);
    healx = scr_charbox_x(chara);
    healtext = instance_create(healx + 70 + xx, yy + 430, obj_healwriter);
    healtext.healamt = amnt;
}

function scr_healitem_all(amnt)
{
    scr_healall(amnt);
    
    for (i = 0; i < chartotal; i += 1)
    {
        healx = scr_charbox_x(i);
        healtext = instance_create(healx + 70 + xx, yy + 430, obj_healwriter);
        healtext.healamt = amnt;
    }
}

function scr_itemuse(arg0)
{
    w = arg0;
    usable = 0;
    replaceable = 0;
    
    if (global.charselect < 3)
        _gc = global.char[global.charselect];
	
	if (w < 10000)
		scr_item_use_action_overworld(w);
	else
		scr_key_item_use_action_overworld(w - 10000);
}

function scr_armorget(arg0)
{
    noroom = false;
    var legacy = false;
    var __i = 0;
    
    if (legacy == false)
    {
        var __itemcount = 0;
        __armor[0] = arg0;
        
        for (__i = 0; __i < 48; __i++)
        {
            if (global.armor[__i] != 0)
            {
                __armor[__itemcount + 1] = global.armor[__i];
                __itemcount++;
            }
        }
        
        if (__itemcount >= 48)
        {
            noroom = true;
        }
        else
        {
            for (__i = 0; __i < 48; __i++)
            {
                if (__i <= __itemcount)
                {
                    global.armor[__i] = __armor[__i];
                }
                else
                {
                    global.armor[__i] = 0;
                }
            }
        }
    }
    else if (legacy)
    {
        loop = true;
        global.armor[48] = 999;
        
        while (loop == true)
        {
            if (global.armor[__i] == false)
            {
                global.armor[__i] = arg0;
                break;
            }
            
            if (__i == 48)
            {
                noroom = false;
                break;
            }
            
            __i += 1;
        }
    }
    
    //script_execute(scr_armorinfo_all);
	scr_armorinfo_all() // Just Call it toby, no need to spam script_execute anymore.
}


function scr_itemget_anytype(itemid, itemtype)
{
    noroom = false;
    
    if (itemtype == "item")
    {
        scr_itemget(itemid);
    }
    
    if (itemtype == "weapon")
    {
        scr_weaponget(itemid);
    }
    
    if (itemtype == "armor")
    {
        scr_armorget(itemid);
    }
    
    if (itemtype == "key")
    {
        scr_keyitemget(itemid);
    }
    
    if (itemtype == "money")
    {
        global.gold += itemid;
    }
}


function scr_itemget_anytype_text()
{
    noroom = false;
    scr_itemget_anytype(argument[0], argument[1]);
    var itemgetstring = "";
    itemname = "NULL";
    itemtypename = "NULL";
    var _itemtype = argument[1];
    var _itemid = argument[0];
    
    if (_itemtype == "armor")
    {
        scr_armorinfo(_itemid);
        itemname = armornametemp;
        itemtypename = stringsetloc("ARMORs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_22_0");
    }
    else if (_itemtype == "weapon")
    {
        scr_weaponinfo(_itemid);
        itemname = weaponnametemp;
        itemtypename = stringsetloc("WEAPONs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_29_0");
    }
    
    if (_itemtype == "item")
    {
        scr_iteminfo(_itemid);
        itemname = itemnameb;
        itemtypename = stringsetloc("ITEMs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_36_0");
        
        if (_pocketed)
        {
            itemtypename = stringsetloc("STORAGE", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_38_0");
        }
    }
    
    if (_itemtype == "key")
    {
        scr_keyiteminfo(_itemid);
        itemname = tempkeyitemname;
        itemtypename = stringsetloc("KEY ITEMs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_44_0");
    }
    
    if (_itemtype == "money")
    {
        noroom = false; // * Your \\cYMONEY HOLE\\cW can never be full./
        itemtypename = stringsetloc("MONEY HOLE", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_544_0");
        itemname = string(_itemid) + stringsetloc(" Dark Dollars", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_52_0");
    }
    
    if (noroom == false)
    {
        itemgetstring = stringsetsub("* (\\cY~1\\cW was added to your \\cY~2\\cW.)", itemname, itemtypename, "obj_treasure_room_slash_Other_10_gml_76_0");
    }
    else
    {
        itemgetstring = stringsetsub("* (You have too many \\cY~2\\cW to take \\cY~1\\c0.)", itemname, itemtypename, "obj_treasure_room_slash_Other_10_gml_83_0");
    }
    
    if (argument_count >= 3)
    {
        itemgetstring += argument[2];
    }
    else
    {
        itemgetstring += "/%";
    }
    
    return itemgetstring;
}
