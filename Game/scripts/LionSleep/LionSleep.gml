// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionSleep(){
	sprite_index = sprSleep;
	image_xscale = enemyspawnXScale;
	xTo = x;
	yTo = y;
	
	//Checking if have to wake up
	if (++idleCheck >= idleCheckDuration)
	{
		
		idleCheck = 0;
		if (instance_exists(oPlayer)) and (point_distance(x, y, oPlayer.x, oPlayer.y) < enemyActivationRad)
		{
			state = ENEMYSTATE.WANDER;
			//sprite_index = wakey wakey; 
		}
	}
}