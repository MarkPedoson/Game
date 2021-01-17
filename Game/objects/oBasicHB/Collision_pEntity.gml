if (other.entityMob)
{
	if (ds_list_find_index(damage_list, other.id) == -1)
	{
		//other.image_blend = c_red;
		ds_list_add(damage_list, other.id);
		if (other.entityHitScript != -1) instance_destroy(other.id);
		else other.flash = 0.5;
	}
}