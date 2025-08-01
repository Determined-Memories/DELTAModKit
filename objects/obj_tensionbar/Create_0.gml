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
c_lightblue =  merge_color(c_blue, c_teal, 0.5)


barcolorsorange = [c_red, c_orange, c_yellow, 0]
barcolorsblue = [c_blue, c_lightblue, c_teal, 1]

barcolors = barcolorsorange