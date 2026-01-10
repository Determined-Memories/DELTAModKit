// Warning, this won't work with screen transitions, as those Also Change the colors.
pal_swap_set(palette_sprite, palette_index, false)
draw_surface_stretched(application_surface, application_get_position()[0], application_get_position()[1], window_get_width(), window_get_height())
pal_swap_reset()
