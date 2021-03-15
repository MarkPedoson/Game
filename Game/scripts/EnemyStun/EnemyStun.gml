// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyStun(){
	stun --;
	hsp = 0;
	vsp = 0;
	image_speed = 0;
	if (stun <= 0) {
		stunned = -1;
		stun = 0;
		target = hitBy;
		stunCounter = 0;
		stunImageIndex = -1;
		state = ENEMYSTATE.CHASE;
	}
}