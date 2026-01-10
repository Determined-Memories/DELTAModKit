var faceallowed = true;

if (!face0allowed && obj_mainchara.facing == direction_DOWN)
{
    faceallowed = false;
}

if (!face1allowed && obj_mainchara.facing == direction_RIGHT)
{
    faceallowed = false;
}

if (!face2allowed && obj_mainchara.facing == direction_UP)
{
    faceallowed = false;
}

if (!face3allowed && obj_mainchara.facing == direction_LEFT)
{
    faceallowed = false;
}

if (faceallowed)
{
    if (strict)
    {
        if (global.interact == false)
        {
            myinteract = 3;
        }
    }
    else
    {
        myinteract = 3;
    }
}
