function getcustomheartcolorsystems() {
	if !variable_global_exists("%%SOULCOLORS%%") {
		var colorinit = {}
		colorinit.names = {
		red:0
		}
		colorinit.data = [
		]
		variable_global_set("%%SOULCOLORS%%", colorinit)
		
		createsoulmode() // Add RED
		createsoulmode("yellow") // Add YELLOW
	}
	return variable_global_get("%%SOULCOLORS%%")
}

function createsoulmode(name = "red", mainsprite = spr_dodgeheart, grazesprite = spr_grazeappear, draw = function() {draw_self()}, step = function() {}, init = function() {}, primarycolor = c_red){
	var colors = getcustomheartcolorsystems()
	
	var soulmodedata = {}
	soulmodedata.id = array_length(colors.data)
	soulmodedata.name = name
	soulmodedata.init = init
	soulmodedata.draw = draw
	soulmodedata.step = step
	soulmodedata.sprite_index = mainsprite
	soulmodedata.graze_sprite_index = grazesprite
	soulmodedata.color = primarycolor
	variable_struct_set(colors.names, string_lower(name), soulmodedata.id)
	array_push(colors.data, soulmodedata)
}

function getsoulmodedata(coloridorname = "red"){
	var colors = getcustomheartcolorsystems()
	var colorid = string_lower(string_replace_all(coloridorname, " ", ""))
	if string_digits(colorid) == colorid {
		colorid = real(colorid)
	}
	var dat = colors.data[0]
	show_debug_message("*** Calling Color Info for (" + string(coloridorname) + ") |" + string(colors.data[0]))
	if !is_undefined(colorid) && colorid != "undefined" && (is_real(colorid) ? (colorid < array_length(colors.data) && colorid >= 0) : (is_string(colorid) ? variable_struct_exists(colors.names, colorid) : false)) {
		if is_string(colorid) {
			show_debug_message("*** " + string(colors.names))
			dat = colors.data[variable_struct_get(colors.names, colorid) % array_length(colors.data)]
		} else 
		if is_real(colorid)
			dat = colors.data[coloridorname]
	}
	else
		show_debug_message("*** ERR, color id of (" + string(colorid) + ") Is of wrong type, or invalid soulmode {Valid Types: Real, String}, Type:" + string(typeof(colorid)))
	return dat;
}

function scr_heartcolor(colorid, flash = false) {
    __heartcolor = colorid;
	var data = getsoulmodedata(string_lower(__heartcolor))
    
    if (string_lower(__heartcolor) == "red" || __heartcolor == 0){
        with (obj_heart) {
            color = data.id;
            sprite_index = data.sprite_index;
			_updatedata(flash)
        }
		with obj_grazebox
			sprite_index = data.graze_sprite_index;
    }
}
