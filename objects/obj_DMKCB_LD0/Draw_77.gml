with obj_mainchara
	palette_index = 4;
	
if holidaysmode
{
	with all
	{
		if variable_instance_exists(id, "extflag")
		{
			if extflag == "holidaysremove"
				instance_destroy();
		}
	}
}