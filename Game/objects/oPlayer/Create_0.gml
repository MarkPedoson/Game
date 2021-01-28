//Beginning attr of player
state = PlayerStateFree;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("Tile"));

image_speed = 0;

//Movement
z = 0; //setting z value
flash = 0; //Getting damaged

hsp = 0; //horizontal speed
vsp = 0; //vertical speed
rolldist = 100 //dashing distance
walksp = 2.5; //movement speed
rollsp = 4; //how fast the space skill is
rollheight = 24; //roll  height

hp = 3; //health




spriteRoll = sCerberusRoll;
spriteRun = sCerberusRun;
spriteIdle = sCerberusIdle;


temp_playerimagex = 1;

//Transitioning to new room
if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}