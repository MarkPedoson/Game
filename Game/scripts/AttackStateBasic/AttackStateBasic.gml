// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackStateBasic(){
	//Change weapon sprite
	sprite_index = spriteBasic;
	if (image_index < basicDamageSprite - 1) image_speed = 0.3;
	else image_speed = 0.5;
	
	//Hitbox when
	if (image_index >= basicDamageSprite) and (image_index < sprite_get_number(sprite_index)-1)
	{
		if (!instance_exists(oBasicHB)){
			with (instance_create_layer(x, y, "Instance", oBasicHB))
			{
				image_yscale = other.image_yscale;
				direction = other.image_angle;
				image_angle = direction;
			}
		}
	}
	
	//Change state
	if (image_index + ((image_speed * sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps)) >= image_number) //I have added 1 more frame to attack, as that will be deletion frame
	{	
		ds_list_destroy(playerChar.damage_list);
		attackState = AttackStateFree; 
	}
	
}