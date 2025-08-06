
if (OBMADE == true)
{
    OB_DEPTH += 1;
    obacktimer += OBM;
    
    if (obacktimer >= 20)
    {
        DV = instance_create(0, 0, DEVICE_OBACK_4);
        DV.depth = 5 + OB_DEPTH;
        DV.OBSPEED = 0.01 * OBM;
        
        if (OB_DEPTH >= 60000)
        {
            OB_DEPTH = 0;
        }
        
        obacktimer = 0;
    }
}


if (con == 0){
	if button1_p(){
                con = 99;
                room_goto(nextroom);
	}
    if (!files_exist)
    {
        timer++;
        
        if (timer == 75)
            con = 1;
    }
    else
    {
        timer++;
        if (timer == 200)
        {
            con = 99;
            room_goto(nextroom);
        }
    }
}
