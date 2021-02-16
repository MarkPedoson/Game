if (other.entityHitScript != -1) and (other.invFrame == false)
{
	if (ds_list_find_index(ownerChar.damage_list, other.id) == -1)
	{
		ds_list_add(ownerChar.damage_list, other.id);
		EntityHitScript(other, ownerCharWeapon.basicDMG, ownerChar);
	}
}