// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDead(){
	hsp = 0;
	vsp = 0;
	
	if (sprite_index != spriteD)
	{
		sprite_index = spriteD;
		image_speed = 0.5;
	}
	
	if (image_index + image_speed > image_number)
	{
		image_speed = 0;
		deathScreen = true;
		
	}
	
	if (deathScreen){
		if (mouse_check_button(mb_any)){
			var _p = global.currentPlayer;
			var _res = ds_list_find_value(global.respawnLocations, _p.currentCharacter);
			global.targetX = _res[0];
			global.targetY = _res[1];
			if (_p.currentWeapon != noone) global.prevWeapon = _p.currentWeapon.weaponType;
			if (_p.currentCharacter != -1) global.prevCharacter = _p.currentCharacter;
			CDReset(false);
			deathScreen = false;
			room_goto(_res[2]);
		}
	}
}