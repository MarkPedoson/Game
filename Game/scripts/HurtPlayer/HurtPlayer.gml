// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtPlayer(_player, _direction, _force, _damage){
	if (_player.invFramePlayer == false)
	{
		global.playerHealth = max(0, global.playerHealth - _damage);
		with (_player)
		{
			state = PLAYERSTATE.HURT;
			direction = _direction - 180;
			moveDistanceRemaining = _force;
			playerFlash = 0.7;
			if (currentWeapon != noone) currentWeapon.flashWeapon = 0.7;
			invFramePlayer = true;
			invFrameCount = 30;
		}
	}
}