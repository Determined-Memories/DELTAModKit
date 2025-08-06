global.currentsong[0] = snd_init("legend.ogg");
snd_pitch(global.currentsong[0], 0.95);
global.currentsong[1] = mus_play(global.currentsong[0]);

contimer = 0;
ytimer = 0;
xtimer = 0;
yoff = 0;
xoff = 0;
con = 1;
fadecolor = c_black;
chunkfade = false;
chunkamt = true;
border = true;
pic = spr_introimage0;
fadespeed = 0.02;
global.flag[6] = true;
textimer = 0;
ingame = false;

if (global.plot == 20)
    ingame = true;

skipped = false;
skiptimer = 0;
