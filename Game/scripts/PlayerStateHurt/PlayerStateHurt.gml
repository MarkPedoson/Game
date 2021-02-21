// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateHurt(){
	//Movement
	hsp = lengthdir_x(hurtSpeed, direction - 180);
	vsp = lengthdir_y(hurtSpeed, direction - 180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - hurtSpeed);
	var _collided = PlayerCollision();
	
	//Update sprite
	sprite_index = spriteIdle;
	
	//Change height
	z = sin(((moveDistanceRemaining / hurtDistance) * pi)) * distanceHurtHeight;
	
	//Change state
	if (moveDistanceRemaining <= 0)
	{
		if (global.playerHealth > 0)
		{
			state = PLAYERSTATE.FREE;
			invFramePlayer = false;
		}
		else state = PLAYERSTATE.DEAD;
	}
}