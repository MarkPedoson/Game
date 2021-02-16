// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionAttack(){
	if (instance_exists(target)) and (target.state == PlayerStateDead) state = ENEMYSTATE.WANDER;
	sprite_index = sprAttack;
	image_speed = 0.75;
	
	var _attackX = x + image_xscale * attackX;
	var _attackY = y + attackY;
	
	//Attack itself
	if (!instance_exists(oLionBite))
	{
		with (instance_create_layer(_attackX, _attackY, "Instance", oLionBite))
		{
			owner = other.id;
			image_yscale = other.image_xscale;
			direction = point_direction(x, y, other.target.x, other.target.y - 10); //Other target is the player itself
			image_angle = direction;
			x = x - lengthdir_x(-16, direction);
			y = y - lengthdir_y(-16, direction);
			
		}
	}

	//Once attack is over then waits and transitions
	if (oLionBite.image_index + ((oLionBite.image_speed * sprite_get_speed(oLionBite.sprite_index)) / game_get_speed(gamespeed_fps)) >= oLionBite.image_number)
	{	
		//Idle sprite, because when it waits it will replay attack otherwise
		sprite_index = sprIdle;
		image_speed = 0.5;
		stateTarget = ENEMYSTATE.CHASE; 
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
	
	
}