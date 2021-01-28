// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackStateFree(){
	//Changing back to default sprite
	sprite_index = spriteWeapon;
	
	//Attaching weapon to the player sprite
	x = oPlayer.x;
	y = oPlayer.y - 10;  //Move it with +/- to make it stick to sPlayer
	
	image_angle = point_direction(x,y,mouse_x,mouse_y);
	
	if (image_angle > 90) and (image_angle < 270)
	{
		image_yscale = -1;
	}
	else
	{
		image_yscale = 1;
	}
	//Attack logic
	if (key_basic and (oPlayer.state == PlayerStateFree) and canBasic == true)
	{
		oPlayer.temp_playerimagex = oPlayer.image_xscale;
		temp_weaponangle = image_angle;
		temp_weaponimagey = image_yscale;
		attackState = AttackStateBasic;
	}
}