function scr_get_room_list()
{
	// MAKE SURE TO ADD ANY ROOMS THAT YOU CAN SAVE IN TO THIS LIST!
	// OTHERWISE YOU WONT BE ABLE TO LOAD A SAVE SAVED IN THAT ROOM!
    return [
		new scr_room(room_dw_test, 1 + global.chapter * 10000),
		new scr_room(room_lw_test, 2 + global.chapter * 10000)
	];
}

function scr_roomname(roomid)
{
	
	if is_string(roomid)
		roomid = asset_get_index(roomid);
	else if !room_exists(roomid)
		roomid = scr_get_room_by_id(roomid);
	
    roomname = scr_debug() ? "! UNKNOWN ! scr_roomname" : "Dark World...?";
	
	var failname = roomname;
	
    switch (roomid) {
		case 0: roomname = "---"; break;
		
		case room_dw_test: roomname = "Dark World - Testbed"; break;
		case room_lw_test: roomname = "Light World - Testbed"; break;
	}
	
	
	
	
	
	
	
	if roomname == failname
	{
		var roomnames = {}
		var names = scr_get_ini_value_string_all_slots(global.chapter, "Room_Name")
		var rooms = scr_get_ini_value_string_all_slots(global.chapter, "Room")
		var i = 0
		while i < array_length(rooms)
		{
			var _roomid = rooms[i][1]
			if is_string(_roomid)
				_roomid = asset_get_index(_roomid)
			var _roomname = names[i][1]
			
			
			if _roomname != "0"
			{
				if _roomid == roomid
				{
					if !variable_struct_exists(roomnames, _roomname)
						variable_struct_set(roomnames, _roomname, 1)
					else
						variable_struct_set(roomnames, _roomname, variable_struct_get(roomnames, _roomname) + 1)
				}
					
			}
			i++
		}
		i = 0
		names = variable_struct_get_names(roomnames)
		var highestscoring = {name:failname, score:0}
		while i < array_length(names)
		{
			var name = variable_struct_get(roomnames, names[i])
			if highestscoring.score < name
			{
				highestscoring.score = name
				highestscoring.name = names[i]
			}
			i++
		}
		roomname = highestscoring.name
		
		
		var replacementname = failname;
		with (obj_savepoint)
		{
			if CUSTOM
			{
				if CUSTOM_PLACENAME != "SAVEPOINTNAMEPOINTERNULL"
				{
					replacementname = CUSTOM_PLACENAME;
					global.savepointname = replacementname
				}
			}
		}		
	}
	
	
    return roomname;
}

function scr_get_completed_file_name(ch = 0)
{
    var _file_name = "";
    
    switch (ch)
    {
        case 1:
            _file_name = "Your Room";
            break;
        
        case 2:
            _file_name = "Kris's House";
            break;
			
		case 3:
			_file_name = "Outside Shelter";
			break;
			
        case 4:
            _file_name = "Kris's Room";
            break;
        
        default:
            break;
    }
    
    var full_file_name = stringsetsub("~1 [Chapter ~2 END]", _file_name, string(ch));
    return full_file_name;
}
