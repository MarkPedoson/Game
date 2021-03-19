// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EntityHitScript(_enemy, _damage, _source, _dealer, _stun, _stunDura){
	//1 = destructible
	//2 = for enemy damage
	with (_enemy)
	{
		switch (entityHitScript){
			case 1:
				instance_destroy(id);
				break;
			case 2:
				if (state != ENEMYSTATE.DIE)
				{
					//Checking if we apply usual flash or stun anim
					if (_stun == -1){
						flash = 1;
						if (stunned != -1){
							StunParticle();
							stunned = -1;
							stun = 0;
							stunCounter = 0;
							stunImageIndex = -1;
						}
					}
					//Stun anim
					else{
						stunned = _stun;
						stun = _stunDura * room_speed;
					}
					enemyHP -= _damage;
					
					//Hurt or dead
					if (enemyHP <= 0)
					{
						flash = 1;
						//Woops enemy died so we default back to flash always
						stunned = -1;
						stun = 0;
						stunCounter = 0;
						stunImageIndex = -1;
						state = ENEMYSTATE.DIE;
					}
					else if (_stun != -1)
					{
						//Stun the enemy
						hitBy = _dealer;
						if (state != ENEMYSTATE.STUNNED){
							state = ENEMYSTATE.STUNNED;
						}
					}
					else
					{
						//Just damage
						hitBy = _dealer;
						if (state != ENEMYSTATE.HURT) state = ENEMYSTATE.HURT;
					}
				}
				image_index = 0;
				if (enemyKnockDist != 0)
				{
					var _knockDirection = point_direction(x, y,(_source).x, (_source).y);
					xTo = x - lengthdir_x(enemyKnockDist, _knockDirection);
					yTo = y - lengthdir_y(enemyKnockDist, _knockDirection);
				}
				break;
		}
	}
}