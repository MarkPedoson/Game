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
		if (sprite_index != spriteIdle) image_index = 0;
		sprite_index = spriteIdle;	
		image_speed = 0.25;
	}
	else
	{	
		if (sprite_index != spriteRun) image_index = 0;
		sprite_index = spriteRun;
		image_speed = 1;
	}
	
	//Change state for dodge rolling
	if (key_roll and canEndurance) and ((currentWeapon == noone) or (currentWeapon.state == WEAPONSTATE.FREE)) and (state != PLAYERSTATE.LOCKED) 
	{	
		if (input_magnitude)
		{
			roll_direction = input_direction;
		}
		else 
		{
			roll_direction = PlayerMouseDirectionFour();
		}
		oCooldown.enduranceCounter -= enduranceRoll;
		
		state = PLAYERSTATE.ROLL;
		moveDistanceRemaining = rolldist;
	}
	
	//Change state to heal
	if (key_heal_press and canEndurance) 
		and ((currentWeapon == noone) or (currentWeapon.state == WEAPONSTATE.FREE)) 
		and (state != PLAYERSTATE.LOCKED)
		and (global.playerHealth != global.playerHealthMax)
	{
		healStep = room_speed * 0.5;
		state = PLAYERSTATE.HEAL;	
	}
	
	//Interaction logic
	if (key_interact) and ((currentWeapon == noone) or (currentWeapon.state == WEAPONSTATE.FREE))
	{
		ActivateEntity();	
	}
	
	//Signature skill
	if (key_sign and canSign) and ((currentWeapon == noone) or (currentWeapon.state == WEAPONSTATE.FREE)) and (state != PLAYERSTATE.LOCKED) {
		state = PLAYERSTATE.SIGNATURE;	
	}
}