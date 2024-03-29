// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionSleep(){
	var _p = global.currentPlayer;
	if (!wake_up)
	{
		sprite_index = sprSleep;
		image_xscale = enemyspawnXScale;
		image_speed = 0.25;	
		
		//Checking if have to wake up
		if (++idleCheck >= idleCheckDuration)
		{
		
			idleCheck = 0;
			if (_p != noone) and (point_distance(x, y, _p.x, _p.y) < enemyActivationRad) and (_p.state != PLAYERSTATE.DEAD)
			{
				wake_up = true;
				image_index = 0;
				image_speed = 0;
			}
		}
	}
	else
	{
		sprite_index = sprWake;
		image_speed = 0.5;
	}
	xTo = x;
	yTo = y;

	
	
	//Wake up animation
	if (sprite_index == sprWake) and (image_index + ((image_speed * sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps)) >= image_number) 
	{
		wake_up = false;
		state = ENEMYSTATE.WANDER;
	}
}