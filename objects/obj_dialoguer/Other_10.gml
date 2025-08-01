active = true;
xx = (19 * f) + camerax() + xoff;
yy = (20 * f) + cameray() + yoff;
xx = round(xx);
yy = round(yy);
var sidemod = 155 * side;
writer = instance_create(xx + (10 * f), yy + ((-5 + sidemod) * f), obj_writer);
writer.skippable = skippable;
writer.dialoguer = true;
writer.jpspecial = jpspecial;
scr_facechoice();

if (i_ex(writer) && global.fc != false)
{
    with (writer)
    {
        dialoguer = true;
        
        if (originalcharline == 33)
            charline = 26;
        facer = true;
        jpspecial = other.jpspecial;
    }
}

zurasucon = 1;
