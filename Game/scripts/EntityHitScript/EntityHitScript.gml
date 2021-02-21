// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EntityHitScript(_enemy, _damage, _source, _dealer){
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
					flash = 1;
					enemyHP -= _damage;
					
					//Hurt or dead
					if (enemyHP <= 0)
					{
						state = ENEMYSTATE.DIE;
					}
					else
					{
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