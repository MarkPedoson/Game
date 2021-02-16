// Inherit the parent event
event_inherited();

state = WEAPONSTATE.FREE;
weaponType = WEAPON.SPEAR;
skin = WEAPONSKIN.BASIC;

//Basic attr
basicDamageSprite = 3;
basicCD = 0.6;
basicDMG = 2;


//Weapon scripts
weaponCharScript[WEAPONSTATE.FREE] = SpearFree;
weaponCharScript[WEAPONSTATE.BASIC] = SpearBasic;
weaponCharScript[WEAPONSTATE.ALT] = -1;

//Skill icon
basicIcon = sCerbIcon;
basicIconAct = sCerbIcon;
altIcon = sCerbIcon;


//Weapon skins
weaponSkin[0] = ds_map_create();
ds_map_add(weaponSkin[0], "spriteWeapon", sSpear);
ds_map_add(weaponSkin[0], "spriteBasic", sSpearBasic);

ChangeWeaponSkin(skin);