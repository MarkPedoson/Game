if (other.entityHitScript != -1) and (other.invFrame == false)
{
	if (ds_list_find_index(playerInfo.damage_list, other.id) == -1)
	{
		ds_list_add(playerInfo.damage_list, other.id);
		EntityHitScript(other, weaponInfo.basicDMG, playerInfo);
	}
}