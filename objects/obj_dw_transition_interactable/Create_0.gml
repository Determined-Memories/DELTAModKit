myinteract = 0;
con = 0;
mysolid = instance_create(x, y, obj_solidblock);
mysolid.image_xscale = sprite_get_width(mysolid.sprite_index) * (image_xscale / sprite_get_width(sprite_index));
mysolid.image_yscale = image_yscale;
talking = 0;
su_actor = noone;