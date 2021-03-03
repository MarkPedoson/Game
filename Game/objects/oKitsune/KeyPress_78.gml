//Spear weapon switch
CDReset();
if (currentWeapon == noone)
{
	SwitchWeapons(oFan);
}
else 
{
	if (currentWeapon.weaponType == WEAPON.FAN)
	{
		instance_destroy(currentWeapon);
		currentWeapon = noone;
	}
	else
	{
		instance_destroy(currentWeapon);
		SwitchWeapons(oFan);
	}
}