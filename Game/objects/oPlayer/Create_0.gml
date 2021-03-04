event_inherited();

//Beginning attr of player
state = PLAYERSTATE.FREE;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("Tile"));
obstructionMap = layer_tilemap_get_id(layer_get_id("Obstruction"));
damage_list = -1;  //For calculating who gets hit

image_speed = 0;

//Char attr 
z = 0; //setting z value
playerFlash = 0; //Getting damaged
playerFlashShader = shWhitePlayer;
hsp_frac = 0;
vsp_frac = 0;
invFramePlayer = false;
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
invFrameCount = 0;
//Hurt properties
hurtSpeed = 1.5;
hurtDistance = 40;
distanceHurtHeight = 24;
//Weapon info
currentWeapon = noone;
currentCharacter = -1;

//Stats
rolldist = 100 //dashing distance
walksp = 3; //movement speed
rollsp = 4; //how fast the space skill is
rollheight = 0; //roll  height
hpMax = 3;

var _c = oCooldown;
//Skill icons
defaultIcon = sAllIcon; //For resetting
basicIcon = sAllIcon;
basicIconAct = sAllIcon;
altIcon = sAllIcon;
altIconAct = sAllIcon;
signAmmo = -1;
if (_c.signAmmoCounter == 0) or ((_c.signAmmoCounter == -1) and (_c.signCDTimer != 0)) canSign = false;
else canSign = true;
signIcon = sAllIcon;
signIconAct = sAllIcon;
skill1Ammo = -1;
if (_c.skill1AmmoCounter == 0) or ((_c.skill1AmmoCounter == -1) and (_c.skill1CDTimer != 0)) canSkill1 = false;
else canSkill1 = true;
skill1Icon = sAllIcon;
skill1IconAct = sAllIcon;
skill2Ammo = -1;
if (_c.skill2AmmoCounter == 0) or ((_c.skill2AmmoCounter == -1) and (_c.skill2CDTimer != 0)) canSkill2 = false;
else canSkill2 = true;
skill2Icon = sAllIcon;
skill2IconAct = sAllIcon;
skill3Ammo = -1;
if (_c.skill3AmmoCounter == 0) or ((_c.skill3AmmoCounter == -1) and (_c.skill3CDTimer != 0)) canSkill3 = false;
else canSkill3 = true;
skill3Icon = sAllIcon;
skill3IconAct = sAllIcon;

//Scripts
playerCharScript[PLAYERSTATE.FREE] = -1;
playerCharScript[PLAYERSTATE.ROLL] = -1;
playerCharScript[PLAYERSTATE.HURT] = PlayerStateHurt;
playerCharScript[PLAYERSTATE.DEAD] = PlayerStateDead;
playerCharScript[PLAYERSTATE.LOCKED] = PlayerStateLocked;
playerCharScript[PLAYERSTATE.TRANSITION] = PlayerStateTransition;



//Sprites
spriteRoll = sCharacter;
spriteD = sCharacter;
spriteRun = sCharacter;
spriteIdle = sCharacter;


