function substringargs(str, offset, args)
{
    var sub_id = 1;
    var num_args = array_length(args);
    var len = (num_args - offset) + 1;
    
    while (sub_id < len)
    {
        var sub = "~" + string(sub_id);
        var ndx = (sub_id + offset) - 1;
        str = string_replace_all(str, sub, args[ndx]);
        sub_id = sub_id + 1;
    }
    
    return str;
}

function stringsetsub(){
    var len = argument_count;
    var args;
    
    for (var i = 0; i < len; i++)
        args[i] = argument[i];
    
    var str = substringargs(argument[0], 1, args);
    return str;
}

function stringsetsubloc(){
    var len = argument_count;
    var args;
    
    for (var i = 0; i < len; i++)
        args[i] = argument[i];
	
    var str = substringargs(scr_getstringloc(argument[0]), 1, args);
    return str;
}
function strlen(str) {return string_length(str)}

function substr(){
    var str = argument[0];
    var pos = argument[1];
    
    if (pos < 0)
        pos = strlen(str) + 1 + pos;
    
    var len;
    
    if (argument_count == 2)
        len = (strlen(str) - pos) + 1;
    else
        len = argument[2];
    
    if (len > 0)
        return string_copy(str, pos, len);
    else
        return "";
}
