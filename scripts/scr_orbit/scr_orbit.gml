function scr_orbitx(x1, y1, x2, y2, speed)
{
    if (speed == 0)
    {
        return x2;
    }
    
    var __theta = point_direction(x1, y1, x2, y2);
    var __radius = point_distance(x1, y1, x2, y2);
    __theta += speed;
    return x1 + lengthdir_x(__radius, __theta);
}

function scr_orbity(x1, y1, x2, y2, speed)
{
    if (speed == 0)
    {
        return y2;
    }
    
    var __theta = point_direction(x1, y1, x2, y2);
    var __radius = point_distance(x1, y1, x2, y2);
    __theta += speed;
    return x1 + lengthdir_y(__radius, __theta);
}

function scr_orbitaroundobject(object, speed)
{
    var __theta = point_direction(object.x, object.y, x, y);
    var __radius = point_distance(object.x, object.y, x, y);
    __theta += speed;
    x = object.x + lengthdir_x(__radius, __theta);
    y = object.y + lengthdir_y(__radius, __theta);
}

function scr_orbitaroundpoint(x1, y1, speed)
{
    var __theta = point_direction(x1, y1, x, y);
    var __radius = point_distance(x1, y1, x, y);
    __theta += speed;
    x = x1 + lengthdir_x(__radius, __theta);
    y = y1 + lengthdir_y(__radius, __theta);
}

