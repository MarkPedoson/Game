// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionWander(){
	sprite_index = sprMove;
	image_speed = 0.5;
	
	//At destination or given up
	if ((x == xTo) and (y = yTo)) or (timePassed > enemyWanderDist / enemySpeed)
	{
		hsp = 0;
		vsp = 0;
		
	
		
		//Set new target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = (point_direction(x, y, xstart, ystart) + irandom_range(-45,45));
			xTo = x + lengthdir_x(enemyWanderDist, dir);
			yTo = y + lengthdir_y(enemyWanderDist, dir);
		}
	}
	else //Move towards new destination
	{
		timePassed++;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		dir = point_direction(x, y, xTo, yTo);
		hsp = lengthdir_x(_speedThisFrame, dir);
		vsp = lengthdir_y(_speedThisFrame, dir);
		if (hsp != 0) image_xscale = sign(hsp);
		
		//Enemy tile collision
		var _collided = EnemyTileCollision();
		
	}
	
	//Check for aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(oPlayer)) and (point_distance(x, y, oPlayer.x, oPlayer.y) <= enemyAggroRad)
		{
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
		}
	}
	
	if (hsp == 0 and vsp == 0)
	{
		sprite_index = sprIdle;
		image_speed = 0.5;
	}
}