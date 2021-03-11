// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ClawFree(){
	//Changing back to default sprite
	switch (oCooldown.altAmmoCounter){
		case 3:
			sprite_index = spriteWeapon;
			break;
		case 2:
			sprite_index = spriteWeapon1;
			break;
		case 1:
			sprite_index = spriteWeapon2;
			break;
		case 0:
			sprite_index = spriteWeapon3;
			break;
		default:
			sprite_index = spriteWeapon;
			break;
	}
	
	image_speed = 0.10;
	
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
		
		//Helper
		altAmmoTemp = oCooldown.altAmmoCounter;
		
		//Set image info
		image_index = 0;
		
		//State switch
		state = WEAPONSTATE.BASIC;
	}
	
	//Alternate logic
	if (key_alt) and (ownerChar.state == PLAYERSTATE.FREE) and (canAlt == true)
	{
		//Cd code 
		canAlt = false;
		
		//Helper
		altAmmoTemp = oCooldown.altAmmoCounter;
		
		//Set image info
		image_index = 0;
		
		//State switch
		state = WEAPONSTATE.ALT;
	}
}