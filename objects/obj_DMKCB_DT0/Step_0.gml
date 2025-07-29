
if point_distance(target.x, target.y, target.xprev, target.yprev) > 20
{
	wraptimes = (wraptimes + 1) % 26
	show_debug_message("*** Wrapped Updated (" + string(wraptimes) + ")")
}

show_debug_message(point_distance(target.x, target.y, target.xprev, target.yprev))

	wrapnpc.x = mainnpc.x
	wrapnpc.y = mainnpc.y	
	
if wraptimes == 25
{
	mainnpc.active = false
	wrapnpc.active = true
	mainnpc.visible = false
	wrapnpc.visible = true
}
else
{
	mainnpc.active = true
	wrapnpc.active = false
	mainnpc.visible = true
	wrapnpc.visible = false
}

target.xprev = target.x
target.yprev = target.y