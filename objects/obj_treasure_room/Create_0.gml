myinteract = false;
talked = false;
image_speed = 0;
itemflag = 104;
itemtype = "armor";
itemidchest = 4;
close = false;
extratext = false; // Had to reimplement this one lol
extraevent = false;
tempchest = false;
needsitem = false;

if (scr_debug())
{
    itemidchest = 0;
    itemflag = 1999;
    itemtype = "item";
}

noflag = false;

if CUSTOM
{
	itemidchest = CUSTOM_ITEM;
	itemflag = CUSTOM_OPENFLAG;
	itemtype = CUSTOM_TYPE;
	if CUSTOM_OPENFLAG == 0
		noflag = true;
	if CUSTOM_EXTRATEXT != ""
		extratext = true;
}


if (global.darkzone == 1)
{
    image_xscale = 2;
    image_yscale = 2;
}

if (global.flag[itemflag] == 1)
{
    image_index = 1;
}

scr_depth();
init = false;
