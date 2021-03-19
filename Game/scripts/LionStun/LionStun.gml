// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionStun(){
	stun --;
	sprite_index = sprHurt;
	if (image_index < 2) image_speed = 0.5;
	else image_speed = 0;

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
		if (stun <= 0) {
			StunParticle();
			stunned = -1;
			stun = 0;
			target = hitBy;
			stunCounter = 0;
			stunImageIndex = -1;
			state = ENEMYSTATE.CHASE;
			//Reset
			hitBy = -1;
		}
	}
	
}