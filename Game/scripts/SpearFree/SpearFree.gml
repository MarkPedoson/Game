// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SpearFree(){
	//Changing back to default sprite
	sprite_index = spriteWeapon;
	image_speed = 0.25;
	
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
	if (key_basic) and (ownerChar.state == PLAYERSTATE.FREE) and (canBasic == true)
	{
		if (!ds_exists(ownerChar.damage_list, ds_type_list)) ownerChar.damage_list = ds_list_create();
		ds_list_clear(ownerChar.damage_list);
		
		//Cd code
		canBasic = false;
		
		//Set image info 
		image_index = 0;
		
		//State switch
		state = WEAPONSTATE.BASIC;
	}
}