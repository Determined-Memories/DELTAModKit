siner = 0;
bgsiner = 0;
siner = 100;
colcol = 0;
hscroll = 0;
eyebody = 1;
adjust = 0;
slowdown = 0;
nowcolor = c_lime;

function change_fountain_color(col)
{
    if (room == asset_get_index("room_dw_mansion_fountain")) && (global.chapter == 2)
    {
        fountainbg.image_blend = col;
        nowcolor = col;
    }
    else if (room == asset_get_index("room_cc_fountain"))
    {
        __background_set_colour(col);
        nowcolor = col;
    }
	else
	{
        __background_set_colour(col);
        nowcolor = col;
	}
}
