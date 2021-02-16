//Claw weapon switch
if (currentWeapon == noone)
{
	SwitchWeapons(oClaw);
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
		SwitchWeapons(oClaw);
	}
}
