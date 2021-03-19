if (image_index >= 2 and image_index < 6){
	if (other.entityHitScript != -1) and (other.invFrame == false)
	{
		if (ds_list_find_index(my_damage_list, other.id) == -1)
		{
			ds_list_add(my_damage_list, other.id);
			EntityHitScript(other, ownerChar.signExplDMG, id, ownerChar, stun, 0);
		}
	}
}