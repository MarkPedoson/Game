event_inherited();

//Cerberus stats
rolldist = 100 //dashing distance
walksp = 3; //movement speed
rollsp = 4; //how fast the space skill is
rollheight = 24; //roll  height
hpMax = 3;

global.playerHealthMax = hpMax;
//Cerberus skill icons
defaultIcon = sCerbIcon; //For resetting
basicIcon = sCerbIcon;
basicIconAct = sCerbIcon;
altIcon = sCerbIcon;
altIconAct = sCerbIcon;
signIcon = sCerbIcon;
skill1Icon = sCerbIcon;
skill2Icon = sCerbIcon;
skill3Icon = sCerbIcon;

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

//Cerberus sprites
spriteRoll = sCerberusRoll;
spriteD = sCerberusD;
spriteRun = sCerberusRun;
spriteIdle = sCerberusIdle;

//State scripts
playerCharScript[PLAYERSTATE.FREE] = CerberusStateFree;
playerCharScript[PLAYERSTATE.ROLL] = CerberusStateRoll;