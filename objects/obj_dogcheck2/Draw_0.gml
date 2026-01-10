
	gpu_set_blendmode(bm_normal)
	var pcx = xstart + random_range(-10, 10)
	var pcy = ystart + random_range(-10, 10)
draw_sprite_ext(spr_dog_computer, round(random_range(0, 1)), pcx, pcy, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
if smokebuffer <= 0 {
	var sx = ((sprite_get_bbox_right(spr_dog_computer) - sprite_get_bbox_left(spr_dog_computer)) / 2) * image_xscale
	var sy = ((sprite_get_bbox_bottom(spr_dog_computer) - sprite_get_bbox_top(spr_dog_computer)) / 2) * image_yscale
	
	var smoke = instance_create(pcx + sx, pcy + sy, obj_dogsmoke)
	smoke.depth = depth + 4
	smoke.vspeed = -1
	smoke.hspeed = -0.025
	smoke.image_blend = merge_color(c_black, c_white, random_range(10, 90) / 100)
	scr_darksize(smoke)
	smokebuffer = 5
} else smokebuffer--

x = xstart
y = ystart
sprite_index = spr_dog_keyboard
draw_self()

if !surface_exists(darknesssurf) darknesssurf = surface_create(room_width, room_height)


surface_set_target(darknesssurf)
draw_clear_alpha(c_black, 1)
for (i = 0; i < array_length(_spotlights); i += 1) {
	var light = _spotlights[i]
	with light {
	
		if _spotlightxtarget + random_range(-_moveoffset, _moveoffset) > _spotlightx _spotlightx += _spotlightspeed
		if _spotlightxtarget + random_range(-_moveoffset, _moveoffset) < _spotlightx _spotlightx -= _spotlightspeed
		if _spotlightytarget + random_range(-_moveoffset, _moveoffset) > _spotlighty _spotlighty += _spotlightspeed
		if _spotlightytarget + random_range(-_moveoffset, _moveoffset) < _spotlighty _spotlighty -= _spotlightspeed

		other._drawspotlight(_spotlightx, _spotlighty, other._sinminmax(current_time / _sindiv, _minsize, _maxsize), 0.25)
	}
}
surface_reset_target()

gpu_set_blendmode_ext(bm_dest_colour, bm_zero);

draw_surface(darknesssurf, 0, 0)

gpu_set_blendmode(bm_normal)
