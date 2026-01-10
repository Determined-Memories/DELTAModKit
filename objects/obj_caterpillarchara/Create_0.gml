scr_depth();
image_speed = 0;

if (global.darkzone)
    scr_darksize(id);

walk = false;
fun = false;
follow = true;
runmove = false;
dir = direction_DOWN;
walkbuffer = 0;
walktimer = 0;
slided = false;
specialed = false;
init_clothes = false;
blushtimer = 0;
shadow_force_off = false;

// Char Init
name = "susie";
sprite_init = false;
target = 12; 
usprite = spr_susieu_dark;
dsprite = spr_susied_dark;
rsprite = spr_susier_dark;
lsprite = spr_susiel_dark;
slidesprite = spr_susied_dark;
climbsprite = spr_susieu_dark;
usprite_blush = spr_ralsei_walk_up;
dsprite_blush = spr_ralsei_walk_down_blush;
rsprite_blush = spr_ralsei_walk_right_blush;
lsprite_blush = spr_ralsei_walk_left_blush;

// Kris Follow Init
parent = obj_mainchara;
pd = parent.dsprite;
pr = parent.rsprite;
pl = parent.lsprite;
pu = parent.usprite;

for (i = 0; i < 75; i += 1){
    remx[i] = parent.x;
    remy[i] = parent.y;
    facing[i] = global.facing;
    sliding[i] = 0;
    special[i] = 0;
}

depth = parent.depth + 5;
mywidth = sprite_width;
myheight = sprite_height;
xoffset = 0;
yoffset = 0;
init = false;
forget = false; // Dont Forget!
ignoredepth = false;
halign = 6;
valign = 16;

// Custom INIT
current_palette = spr_palette_krs_statue // sprite palette krisralseisusie statue
palette_index = 0