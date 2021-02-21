// Inherit the parent event
event_inherited();

state = WEAPONSTATE.FREE;
weaponType = WEAPON.CLAW;
skin = WEAPONSKIN.BASIC;

var _c = oCooldown;
//Basic attr
basicDamageSprite = 4;
basicCD = 0.3;
basicDMG = 2;

//Alt attr
altAmmo = 3;
altCD = 5;
altDMG = 1;


//Add ammo to oCooldown if it exists and no ammo has been added
if (basicAmmo != -1) and (_c.basicAmmoCounter == -1) _c.basicAmmoCounter = basicAmmo;
if (altAmmo != -1) and (_c.altAmmoCounter == -1) _c.altAmmoCounter = altAmmo;

//Weapon scripts
weaponCharScript[WEAPONSTATE.FREE] = ClawFree;
weaponCharScript[WEAPONSTATE.BASIC] = ClawBasic;
weaponCharScript[WEAPONSTATE.ALT] = ClawAlt;

//Skill icon
basicIcon = sClawBasicIcon;
basicIconAct = sClawBasicIconAct;
altIcon = sClawAltIcon;
altIconAct = sClawAltIconAct;


//Weapon skins
weaponSkin[0] = ds_map_create();
ds_map_add(weaponSkin[0], "spriteWeapon", sClaw);
ds_map_add(weaponSkin[0], "spriteBasic", sClawBasic);

ChangeWeaponSkin(skin);