global.interact = 3;

if (!i_ex(obj_fadeout))
    instance_create(0, 0, obj_fadeout);

if (touched == false)
{
    alarm[2] = 8;
    event_user(8);
    touched = true;
}