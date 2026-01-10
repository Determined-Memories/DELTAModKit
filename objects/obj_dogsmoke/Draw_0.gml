image_angle += 90

image_alpha -= 0.025

if image_alpha <= 0
	instance_destroy()
	
draw_self()

