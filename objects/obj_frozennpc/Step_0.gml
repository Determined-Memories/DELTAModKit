if (myinteract == 3)
{
    if (i_ex(mydialoguer) == false)
    {
        global.interact = 0;
        myinteract = 0;
        
        with (obj_mainchara)
        {
            onebuffer = 5;
        }
    }
}


if (fresh == 3 && (global.flag[916] != 0 || global.flag[915] == 0))
{
    safe_delete(mysolid);
    instance_destroy();
}
