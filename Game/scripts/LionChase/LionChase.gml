// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionChase(){
	//Checking if player is alive
	if (instance_exists(target)) 
		and (target.state == PLAYERSTATE.DEAD)
		state = ENEMYSTATE.WANDER;

	//Player hid away
	var _obstacle = LOSScript(self, target);
	if (_obstacle){
		hsp = 0;
		vsp = 0;
		image_index = 0;
		image_speed = 0;
		state = ENEMYSTATE.RETURNING;
	}
	
	sprite_index = sprChase;
	image_speed = 0.75;
	
	//Check if close enough to attack
	if (instance_exists(target)) and (point_distance(x, y, target.x, target.y) <= enemyAttackRad)
	{
		hsp = 0;
		vsp = 0;
		image_index = 0;
		image_speed = 0;
		state = ENEMYSTATE.ATTACK;
		
	}
	
	if (instance_exists(target)) and (point_distance(x, y, target.x, target.y) > enemyAttackRad)
	{
		var _enemySpeed = enemySpeed + 0.5;
		xTo = target.x;
		yTo = target.y;
		
		dir = point_direction(x, y, xTo, yTo);
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		
		if (_distanceToGo > _enemySpeed)
		{
			hsp = lengthdir_x(_enemySpeed, dir);
			vsp = lengthdir_y(_enemySpeed, dir);
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
	
	
	//Check for aggro distance
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (point_distance(x, y, xstart, ystart) >= resetRad) 
		{
			hsp = 0;
			vsp = 0;
			image_index = 0;
			image_speed = 0;
			state = ENEMYSTATE.RETURNING;
		}
	}
}