if (skin == WEAPONSKIN.BASIC)
{
	skin = WEAPONSKIN.ALT;
	ChangeWeaponSkin(skin);
}
else if (skin == WEAPONSKIN.ALT)
{
	skin = WEAPONSKIN.BASIC;
	ChangeWeaponSkin(skin);
}
else ChangeWeaponSkin(WEAPONSKIN.BASIC);