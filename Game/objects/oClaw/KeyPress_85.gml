if (skin == WEAPONSKIN.BASIC)
{
	skin = WEAPONSKIN.ALT;
	ChangeWeapon(skin);
}
else if (skin == WEAPONSKIN.ALT)
{
	skin = WEAPONSKIN.BASIC;
	ChangeWeapon(skin);
}
else ChangeWeapon(WEAPONSKIN.BASIC);