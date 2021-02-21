//Claw weapon switch
CDReset();
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
	}
	else
	{
		instance_destroy(currentWeapon);
		SwitchWeapons(oClaw);
	}
}
