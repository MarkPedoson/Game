// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionAttack(){
	hsp = 0;
	vsp = 0;
	
	if (!instance_exists(oLionBite))
	{
		with (instance_create_layer(attackX, attackY, "Enemy_attack", oLionBite))
		{
			
			
			
		}
	}

	
	if (floor(oLionBite.image_index) >= sprite_get_number(attackSpr) -1) 
	{	
		image_index = 0;
		stateTarget = ENEMYSTATE.CHASE; 
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
	
	
}