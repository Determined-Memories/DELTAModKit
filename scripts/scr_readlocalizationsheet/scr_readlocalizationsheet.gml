function scr_initlocalization(){
	variable_global_set("%%LOCALIZEDSTRINGDATA%%", {})
	var sheetname = "lang/langsheet.csv"
	var data = []
	if file_exists(sheetname)
	{
		var file = file_text_open_read(sheetname)
		var curline = 0;
		while !file_text_eof(file)
		{
			var linedat = []
			var txt = file_text_read_string(file)
			var istring = false;
			var i = 0;
			var backslashprevious = false;
			var curtxt = ""
			
			repeat string_length(txt)
			{
				i++;
				var char = string_char_at(txt, i)
				var addchar = true
				if !backslashprevious
				{
					if char == "\\"
					{
						addchar = false;
						backslashprevious = true
					}
					else
						backslashprevious = false;
					if char == "\""
					{
						istring = !istring;
						addchar = false;
					}
				}
				else
					backslashprevious = false;
					
				if (char == "," && !istring)
				{
					array_push(linedat, curtxt)
					curtxt = ""
					addchar = false;
				}				
				if addchar
					curtxt += char
				if i == string_length(txt)
					array_push(linedat, curtxt)	
			}
			variable_struct_set(variable_global_get("%%LOCALIZEDSTRINGDATA%%"), linedat[1], {ja:linedat[2]})
			show_debug_message(linedat)
			file_text_readln(file)
			array_push(data, linedat)
		}
	}
	return data
}

function scr_getstringloc(enstring, lang = global.lang)
{
	if !variable_global_exists("%%LOCALIZEDSTRINGDATA%%")
		scr_initlocalization()
	var locstrdatastruct = variable_global_get("%%LOCALIZEDSTRINGDATA%%")
	if variable_struct_exists(locstrdatastruct, enstring)
	{
		var stringlocalization = variable_struct_get(locstrdatastruct, enstring)
		if variable_struct_exists(stringlocalization, lang)
			return variable_struct_get(stringlocalization, lang)
	}
	
	return enstring
}