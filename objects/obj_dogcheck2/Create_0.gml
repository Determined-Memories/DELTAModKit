image_speed = 0.25
mus_loop(snd_init("balnwonknu_sum.ogg"))

darknesssurf = surface_create(room_width, room_height)

_drawspotlight = function(x, y, size, brightness) {
	surface_set_target(darknesssurf)
	draw_set_color(merge_color(merge_color(c_black, c_blue, 0.05), c_white, brightness))
	gpu_set_blendmode(bm_add)
	//draw_set_alpha(brightness)
	draw_circle(x, y, size, false)
	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
}


_spotlights = []

_createspotlight = function() {
	var newspotlight = {}
	with newspotlight {
		_spotlightxtarget = other.x + other.sprite_width / 2
		_spotlightytarget = other.y + other.sprite_height / 2
		_spotlightx = _spotlightxtarget
		_spotlighty = _spotlightytarget
		_moveoffset = random_range(5, 100)
		_spotlightspeed = random_range(0.25, 2)
		_maxsize = random_range(50, 100)
		_minsize = random_range(40, 50)
		_sindiv = random_range(100, 600)
	}
	array_push(_spotlights, newspotlight)
}

repeat 5
	_createspotlight()

_sinminmax = function(x, _min, _max) {
	return _min + (((sin(x) + 1) / 2) * (_max - _min))
}

smokebuffer = 0