function scr_asobject(obj, _method, argsarray = []){
	
	instancecount = instance_count;
	
    for (i = 0; i < instancecount; i++)
    {
        findo = instance_id_get(i);
        
        if i_ex(findo) && ((findo.id == obj) || (findo.object_index == obj) || (object_get_parent(findo.object_index) == obj) || obj == all)
        {
			method(findo, _method)(argsarray, id)
        }
    }

}