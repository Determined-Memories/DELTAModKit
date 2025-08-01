var dooropen = false

if !global.fountainopen
{
	with obj_dw_transition_interactable
	{
		safe_delete(mysolid)
		safe_delete(id)
	}
	dooropen = true;
}

with obj_darkdoor
{
	image_index = dooropen
}