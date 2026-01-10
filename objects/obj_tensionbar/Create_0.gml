#macro tpbcol_orange 0
#macro tpbcol_blue 1

tsiner = 0;
global.tensionselect = 0;
apparent = global.tension;
current = global.tension;
change = false;
changetimer = 15;
red = false;
redtimer = 0;
xx = camerax();
yy = cameray();
y = yy + 40;
x = xx - 40;
hspeed = 13;
friction = 1;
flashsiner = 0;
maxed = false;
healthbar_surf = surface_create(96, 250);
yoffset = 0;
bluebar = false;

// Normal Colors
barcolorsorange = [c_red, c_orange, c_yellow, false, #800000] // Normal Colors

// Ch4 Darkness Colors
c_lightblue = merge_color(c_blue, c_teal, 0.5)
barcolorsblue = [c_blue, c_lightblue, c_teal, false, #000080] // Ch4 Darkness Colors

barcolortypes[tpbcol_orange] = barcolorsorange
barcolortypes[tpbcol_blue] = barcolorsblue
barcolortype = tpbcol_orange // [This should be Zero unless if testing an bar color color]

barcolors = barcolortypes[0]