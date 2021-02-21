// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateLocked(){
	sprite_index = spriteIdle;
	image_speed = 0;
	image_index = 0;
	hsp = 0;
	vsp = 0;
	PlayerCollision();
}