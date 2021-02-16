//Beginning attr of player
state = PlayerStateFree;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("Tile"));
damage_list = -1;  //For calculating who gets hit

image_speed = 0;

//Movement
z = 0; //setting z value
playerFlash = 0; //Getting damaged
playerFlashShader = shWhitePlayer;
hsp_frac = 0;
vsp_frac = 0;
invFramePlayer = false;
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
invFrameCount = 0;
hurtSpeed = 1.5;
hurtDistance = 40;
distanceHurtHeight = 24;

currentWeapon = noone;

//Cerberus stats
rolldist = 100 //dashing distance
walksp = 3; //movement speed
rollsp = 4; //how fast the space skill is
rollheight = 24; //roll  height

//Cerberus skill icons
defaultIcon = sCerbIcon; //For resetting
basicIcon = sCerbIcon;
basicIconAct = sCerbIcon;
altIcon = sCerbIcon;
signIcon = sCerbIcon;
skill1Icon = sCerbIcon;
skill2Icon = sCerbIcon;
skill3Icon = sCerbIcon;


//Cerberus sprites
spriteRoll = sCerberusRollAlt;
spriteD = sCerberusD;
spriteRun = sCerberusRun;
spriteIdle = sCerberusIdle;


//Transitioning to new room
if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
	
	//Lets add the weapon back
	if (global.prevWeapon != -1)
	{
		if (global.prevWeapon == WEAPON.CLAW)
		{
			with (instance_create_layer(oPlayer.x, (oPlayer.y - oPlayer.z) - 10, "Instance", oClaw))
			{
				ownerChar = other.id;
				other.currentWeapon = id;
			}
			basicIcon = currentWeapon.basicIcon;
			basicIconAct = currentWeapon.basicIconAct;
			altIcon = currentWeapon.altIcon;
		}
		else if (global.prevWeapon == WEAPON.SPEAR)
		{
			with (instance_create_layer(oPlayer.x, (oPlayer.y - oPlayer.z) - 10, "Instance", oSpear))
			{
				ownerChar = other.id;
				other.currentWeapon = id;
			}
			basicIcon = currentWeapon.basicIcon;
			basicIconAct = currentWeapon.basicIconAct;
			altIcon = currentWeapon.altIcon;
		}
	}
	
	//Reset the var
	global.targetX = -1;
	global.targetY = -1;
	global.targetDirection = 0;
	global.targetRoom = -1;
	global.prevWeapon = -1;
}