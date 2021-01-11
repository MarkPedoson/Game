// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll(){
	
	//Movement
	hsp = lengthdir_x(rollsp, roll_direction);
	vsp = lengthdir_y(rollsp, roll_direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - rollsp);
	var _collided = PlayerCollision();
	
	//Update sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index);  //How many frames is the roll
	image_index = min(((1 - (moveDistanceRemaining / rolldist)) * _totalFrames), _totalFrames - 1);
	
	//Change height
	z = sin(((moveDistanceRemaining / rolldist) * pi)) * rollheight;
	
	//Logic for roll animation direction facing according to keyboard input
	if ((roll_direction <= 45) and (roll_direction >= 0)) or ((roll_direction >= 315) and (roll_direction <= 360))
	{
		image_xscale = 1;  //Right
	}
	else if (roll_direction >= 135) and (roll_direction <= 225)
	{
		image_xscale = -1;	//Left
	}
	
	//Change state
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree;
	}
}