event_inherited()

//Kitsune stats
rolldist = 50 //dashing distance
walksp = 3.5; //movement speed
rollsp = 5; //how fast the space skill is
rollheight = 12; //roll  height
hpMax = 3;

global.playerHealthMax = hpMax;
//Kitsune skill icons
defaultIcon = sKitIcon; //For resetting
basicIcon = sKitIcon;
basicIconAct = sKitIcon;
altIcon = sKitIcon;
altIconAct = sKitIcon;
signIcon = sKitIcon;
skill1Icon = sKitIcon;
skill2Icon = sKitIcon;
skill3Icon = sKitIcon;

//CD
signCD = 0;
skill1CD = 0;
skill2CD = 0;
skill3CD = 0;

var _c = oCooldown;
//Add ammo to oCooldown if it exists and no ammo has been added
if (signAmmo != -1) and (_c.signAmmoCounter == -1) _c.signAmmoCounter = signAmmo;
if (skill1Ammo != -1) and (_c.skill1AmmoCounter == -1) _c.skill1AmmoCounter = skill1Ammo;
if (skill2Ammo != -1) and (_c.skill2AmmoCounter == -1) _c.skill2AmmoCounter = skill2Ammo;
if (skill3Ammo != -1) and (_c.skill3AmmoCounter == -1) _c.skill3AmmoCounter = skill3Ammo;

//Kitsune sprites
spriteRoll = sIdle;
spriteD = sIdle;
spriteRun = sIdle;
spriteIdle = sIdle;

playerCharScript[PLAYERSTATE.FREE] = CerberusStateFree;
playerCharScript[PLAYERSTATE.ROLL] = CerberusStateRoll;