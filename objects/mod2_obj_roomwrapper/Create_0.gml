_wrap = function(value, minval, maxval)
{
	var mx = maxval - minval
	var val0 = value - minval
	var val1 = val0 % mx
			
	return (mx - ((mx - val1) % (mx + 1))) + minval
}

_wrapobject = function(obj) {

	with obj
	{
		var h = other.h
		var v = other.v
		var _wrap = other._wrap
		if variable_instance_exists(id, "remx")
			for (i = 0; i < 75; i += 1)
			{
				if h
					remx[i] = _wrap(remx[i], 0, room_width)
				if v
					remy[i] = _wrap(remy[i], 0, room_height)
			}
			var prevx = x
			var prevy = y
		if h
			x = _wrap(x, 0, room_width)
		if v
			y = _wrap(y, 0, room_height)
		if prevx != x && prevy != y
			return [x - prevx, y - prevy]
		else
		if prevx != x
			return [x - prevx, 0];
		else
		if prevy != y
			return [0, y - prevy];
		return false
			
		
	}


}