function getcustomheartcolorsystems() {
	if !variable_global_exists("%%SOULCOLORS%%")
	{
		var colorinit = {}
		colorinit.names = {
		red:0
		}
		colorinit.data = [
		]
		variable_global_set("%%SOULCOLORS%%", colorinit)
		
		createsoulmode() // Add RED
	}
	return variable_global_get("%%SOULCOLORS%%")
}

function createsoulmode(name = "red", mainsprite = spr_dodgeheart, grazesprite = spr_grazeappear, draw = function() {draw_self()}, step = function() {}, init = function() {}) {
	var colors = getcustomheartcolorsystems()
	
	var soulmodedata = {}
	soulmodedata.id = array_length(colors.data)
	soulmodedata.name = name
	soulmodedata.init = init
	soulmodedata.draw = draw
	soulmodedata.step = step
	soulmodedata.sprite_index = mainsprite
	soulmodedata.graze_sprite_index = grazesprite
	variable_struct_set(colors.names, name, soulmodedata.id)
	array_push(colors.data, soulmodedata)
	
}

function getsoulmodedata(coloridorname) {
	var colors = getcustomheartcolorsystems();
	var colorid = coloridorname;
	if is_string(colorid)
		return	colors.data[variable_struct_get(colors.names, coloridorname) % array_length(colors.data)]
	else if is_real(colorid) && (colorid < array_length(coloridorname) && colorid >= 0)
		return	colors.data[coloridorname]
	else 
		return colors.data[0];
}

function scr_heartcolor(colorid)
{
    __heartcolor = colorid;
	var data = getsoulmodedata(__heartcolor)
    
    if (__heartcolor == "red" || __heartcolor == 0)
    {
        with (obj_heart)
        {
            color = data.id;
            sprite_index = data.sprite_index;
        }
		with obj_grazebox
			sprite_index = data.graze_sprite_index;
    }
}
