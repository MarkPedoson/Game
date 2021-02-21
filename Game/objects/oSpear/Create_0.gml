// Inherit the parent event
event_inherited();

state = WEAPONSTATE.FREE;
weaponType = WEAPON.SPEAR;
skin = WEAPONSKIN.BASIC;

var _c = oCooldown;
//Basic attr
basicDamageSprite = 3;
basicCD = 0.6;
basicDMG = 2;

//Alt attr
altCD = 2;
altDMG = 1;

//Add ammo to oCooldown if it exists and no ammo has been added
if (basicAmmo != -1) and (_c.basicAmmoCounter == -1) _c.basicAmmoCounter = basicAmmo;
if (altAmmo != -1) and (_c.altAmmoCounter == -1) _c.altAmmoCounter = altAmmo;

//Weapon scripts
weaponCharScript[WEAPONSTATE.FREE] = SpearFree;
weaponCharScript[WEAPONSTATE.BASIC] = SpearBasic;
weaponCharScript[WEAPONSTATE.ALT] = -1;

//Skill icon
basicIcon = sSpearBasicIcon;
basicIconAct = sSpearBasicIconAct;
altIcon = sCerbIcon;
altIconAct = sCerbIcon;


//Weapon skins
spriteWeapon = sSpear;
spriteBasic = sSpearBasic;
