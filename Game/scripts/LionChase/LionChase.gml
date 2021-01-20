// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionChase(){
	sprite_index = sprMove;
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed)
		{
			hsp = lengthdir_x(enemySpeed, dir);
			vsp = lengthdir_y(enemySpeed, dir);
		}
		else
		{
			hsp = lengthdir_x(_distanceToGo, dir);
			vsp = lengthdir_y(_distanceToGo, dir);
		}
		if (hsp != 0) image_xscale = sign(hsp);
		
		//Collision
		var _collision = EnemyTileCollision();
	}
	
	//Check if close enough to attack
	if (instance_exists(target)) and (point_distance(x, y, target.x, target.y) <= enemyAttackRad)
	{
		state = ENEMYSTATE.ATTACK;
		//sprite_index = sprAttack;
		image_speed = 1.0;
		image_index = 0;
		//Character is 32px wide so 16 px to be on the edge
		xTo += lengthdir_x(16, dir);
		yTo += lengthdir_y(-16, dir);
		
	}
}