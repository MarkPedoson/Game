// Inherit the parent event
event_inherited();

state = WEAPONSTATE.FREE;
weaponType = WEAPON.CLAW;
skin = WEAPONSKIN.BASIC;


//Basic attr
basicDamageSprite = 4;
basicCD = 0.3;
basicDMG = 2;


//Weapon scripts
weaponCharScript[WEAPONSTATE.FREE] = ClawFree;
weaponCharScript[WEAPONSTATE.BASIC] = ClawBasic;
weaponCharScript[WEAPONSTATE.ALT] = -1;

//Skill icon
basicIcon = sClawBasicIcon;
basicIconAct = sClawBasicIconAct;
altIcon = sCerbIcon;


//Weapon skins
weaponSkin[0] = ds_map_create();
ds_map_add(weaponSkin[0], "spriteWeapon", sClaw);
ds_map_add(weaponSkin[0], "spriteBasic", sClawBasic);

weaponSkin[1] = ds_map_create();
ds_map_add(weaponSkin[1], "spriteWeapon", sClawAlt);
ds_map_add(weaponSkin[1], "spriteBasic", sClawBasicAlt);

ChangeWeaponSkin(skin);