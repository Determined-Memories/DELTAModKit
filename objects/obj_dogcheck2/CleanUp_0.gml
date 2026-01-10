if surface_exists(darknesssurf) {
	if surface_get_target() == darknesssurf
		surface_reset_target()	
	draw_flush()
	surface_free(darknesssurf)
}