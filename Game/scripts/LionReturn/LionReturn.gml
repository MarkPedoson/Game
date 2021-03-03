// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionReturn(){
	invFrame = true;
	if (teleporting == false)
	{
		sprite_index = sprReturn;
		image_speed = 0.5;
		entityCollision = false;
		image_alpha -= ((image_speed * sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps)) / image_number;
	}
	else
	{
		if (oLion.visible == false) oLion.visible = true;
		sprite_index = sprReturn2;
		image_speed = 0.5;
		entityCollision = true;
		image_alpha += ((image_speed * sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps)) / image_number;
	}
	
	if (teleporting == false) and (image_index + ((image_speed * sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		teleporting = true;
		oLion.visible = false;
		x = xstart;
		y = ystart;
		
		image_index = 0;
		image_speed = 0;
	}
	
	if (teleporting == true) and (image_index + ((image_speed * sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		invFrame = false;
		teleporting = false;
		state = ENEMYSTATE.WANDER;
	}
}