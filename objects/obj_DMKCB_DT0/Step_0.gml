
if point_distance(target.x, target.y, target.xprev, target.yprev) > 20
{
	wraptimes = (wraptimes + 1) % 26
}

with obj_bg_palette_swap
{
	var wrapped = other.wraptimes
	palette_index = lerp(palette_index, floor((wrapped / 25) * 10) / 10, 0.25)
}

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