if active
{
	with obj_mainchara
	{
		cam_moveoutofboundsh = other.h
		cam_moveoutofboundsv = other.v
	}
	var mainposprev = {x:obj_mainchara.x,y:obj_mainchara.y}
	var moved = _wrapobject(obj_mainchara)
	if moved != false
	{
		var ydif = moved[1]
		var xdif = moved[0]
		x += xdif
		y += ydif
		with obj_caterpillarchara
		{
			for (i = 0; i < 75; i += 1)
			{
				if xdif != 0
					remx[i] += (xdif)
				if ydif != 0
					remy[i] += ydif
			}
		}
	}
}