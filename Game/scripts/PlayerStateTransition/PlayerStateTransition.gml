// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateTransition(){
	//Show weapon
	if (instance_exists(oWeapon)) oWeapon.visible = true;

	//Mouse facing angle
	var _mouse_dir = point_direction(x,y,mouse_x,mouse_y);

	PlayerCollision();
	
	//Logic for character facing according to mouse
	if (_mouse_dir > 90) and (_mouse_dir < 270)
	{
		image_xscale = -1;	//Left
	}
	else
	{
		image_xscale = 1;	//Right
	}


	//Switches player sprite animation
	var _oldSprite = sprite_index;
	if (hsp == 0) and (vsp == 0)
	{
		sprite_index = spriteIdle;	
	}
	else
	{	
		if (input_direction != _mouse_dir)  //If the mouse direction and movement conflict plays
		{
			sprite_index = spriteRun; 
			image_speed = -1;
		}
		else
		{
			sprite_index = spriteRun;
			image_speed = 1;
		}
	}
	if (_oldSprite != sprite_index) localFrame = 0;  //Resets the sprite every time
}