// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CerberusStateFree(){
	
	//Movement
	hsp = (lengthdir_x(input_magnitude * walksp, input_direction));
	vsp = (lengthdir_y(input_magnitude * walksp, input_direction));

	//Mouse facing angle
	var _mouse_dir = point_direction(x,y,mouse_x,mouse_y);

	PlayerCollision();
	
	//Logic for character facing according to mouse
	if (_mouse_dir > 90) and (_mouse_dir < 270)
	{
		image_xscale = -1;	//Left
	}
	else
	{
		image_xscale = 1;	//Right
	}


	//Switches player sprite animation
	if (hsp == 0) and (vsp == 0)
	{
		sprite_index = spriteIdle;	
	}
	else
	{	
		sprite_index = spriteRun;
		image_speed = 1;
	}
	
	//Change state for dodge rolling
	if (key_roll) and ((currentWeapon == noone) or (currentWeapon.state == WEAPONSTATE.FREE)) and (state != PLAYERSTATE.LOCKED) 
	{	
		if (input_magnitude)
		{
			roll_direction = input_direction;
		}
		else 
		{
			roll_direction = PlayerMouseDirectionFour();
		}
		state = PLAYERSTATE.ROLL;
		moveDistanceRemaining = rolldist;
	}
	
	//Interaction logic
	if (key_interact) and ((currentWeapon == noone) or (currentWeapon.state == WEAPONSTATE.FREE))
	{
		ActivateEntity();	
	}
}