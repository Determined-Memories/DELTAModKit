function instance_create(arg0, arg1, arg2){
	var myDepth = object_get_depth(arg2);
    return instance_create_depth(arg0, arg1, myDepth, arg2);
}

function scr_writetext(msc, msg1, fc, typer)
{
    global.fc = 0;
    global.msc = msc;
    
    if (msg1 != "x")
        global.msg[0] = msg1;
    
    if (fc != 0)
        global.fc = fc;
    
    global.typer = 5;
    
    if (typer != 0)
        global.typer = typer;
    
    instance_create(0, 0, obj_dialoguer);
}