// Inherit the parent event
event_inherited();

state = WEAPONSTATE.FREE;
weaponType = WEAPON.CLAW;
skin = WEAPONSKIN.BASIC;

//Basic attr
basicDamageSprite = 3;
basicCD = 0.3; //Alarm[1] has the same value in it
basicDMG = 2;

//Alt attr
altAmmo = 3;
altCD = 2;
altDMG = 1;


//Helpers
altAmmoTemp = altAmmo;
altCastFinish = false;

var _c = oCooldown;
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
spriteWeapon = sClaw;
spriteWeapon1 = sClaw_1;
spriteWeapon2 = sClaw_2;
spriteWeapon3 = sClaw_3;
spriteBasic = sClawBasic;
spriteBasic1 = sClawBasic_1;
spriteBasic2 = sClawBasic_2;
spriteAlt = sClawAlt_1;
spriteAlt1 = sClawAlt_2;
spriteAlt2 = sClawAlt_3;

