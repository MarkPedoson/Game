// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDead(){
	hsp = 0;
	vsp = 0;
	var _collided = PlayerCollision();
	
	if (sprite_index != spriteD)
	{
		sprite_index = spriteD;
		image_speed = 0.5;
	}
	
	if (image_index + image_speed > image_number)
	{
		image_speed = 0;
		global.targetX = RES_X;
		global.targetY = RES_Y;
		if (oPlayer.currentWeapon != noone) global.prevWeapon = oPlayer.currentWeapon.weaponType;
		room_goto(ROOM_START);
	}
}