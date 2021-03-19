// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionD(){
	invFrame = true;
	sprite_index = sprD;
	image_speed = 0.5;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed) 
	{
		dir = point_direction(x, y, xTo, yTo);
		hsp = lengthdir_x(enemySpeed, dir);
		vsp = lengthdir_y(enemySpeed, dir);
		if (hsp != 0) image_xscale = -sign(hsp);
		
		//Collision stops knockback
		if (flash != 0) EnemyTileCollision();
		
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	
	if (image_index + ((image_speed * sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}