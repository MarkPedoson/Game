//Spear weapon switch
if (currentWeapon == noone)
{
	SwitchWeapons(oSpear);
}
else 
{
	if (currentWeapon.weaponType == WEAPON.SPEAR)
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
		SwitchWeapons(oSpear);
	}
}
