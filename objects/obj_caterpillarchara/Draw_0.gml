if init {
	pal_swap_set(current_palette, palette_index, false);
	draw_self()
	pal_swap_reset()
}