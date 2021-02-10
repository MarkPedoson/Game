// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionHurt(){
	sprite_index = sprHurt;
	image_speed = 0.5;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed) 
	{
		dir = point_direction(x, y, xTo, yTo);
		hsp = lengthdir_x(enemySpeed, dir);
		vsp = lengthdir_y(enemySpeed, dir);
		if (hsp != 0) image_xscale = -sign(hsp);
		
		//Collision stops knockback
		if (EnemyTileCollision())
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		state = ENEMYSTATE.CHASE;
	}
}