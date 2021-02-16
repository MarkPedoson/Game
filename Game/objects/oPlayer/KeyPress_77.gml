if (currentWeapon == noone)
{
	with (instance_create_layer(oPlayer.x, (oPlayer.y - oPlayer.z) - 10, "Instance", oClaw))
	{
		ownerChar = other.id;
		other.currentWeapon = id;
	}
	basicIcon = currentWeapon.basicIcon;
	basicIconAct = currentWeapon.basicIconAct;
	altIcon = currentWeapon.altIcon;
}
else 
{
	if (currentWeapon.weaponType == WEAPON.CLAW)
	{
		instance_destroy(currentWeapon);
		currentWeapon = noone;
		basicIcon = defaultIcon;
		basicIconAct = defaultIcon;
		altIcon = defaultIcon;
	}
	else
	{
		instance_destroy(currentWeapon);
		with (instance_create_layer(oPlayer.x, (oPlayer.y - oPlayer.z) - 10, "Instance", oClaw))
		{
			ownerChar = other.id;
			other.currentWeapon = id;
		}
		basicIcon = currentWeapon.basicIcon;
		basicIconAct = currentWeapon.basicIconAct;
		altIcon = currentWeapon.altIcon;
	}
}
