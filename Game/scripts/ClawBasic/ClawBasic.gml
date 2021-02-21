// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ClawBasic(){
	//Change weapon sprite
	sprite_index = spriteBasic;
	//Make sure the player is not hurt or dead
	if (instance_exists(ownerChar)) and (ownerChar.state != PLAYERSTATE.HURT) and (ownerChar.state != PLAYERSTATE.DEAD)
	{
		//Sprite anim speed
		if (image_index < basicDamageSprite) image_speed = 0.3;
		else image_speed = 0.5;
	
		//Hitbox when
		if (image_index >= basicDamageSprite) and (image_index < sprite_get_number(sprite_index)-1)
		{
			var _canCast = CastablePlayer(oClawBasicHB, ownerChar);
			if (_canCast){
				with (instance_create_layer(x, y, "Instance", oClawBasicHB))
				{
					ownerChar = other.ownerChar;
					image_yscale = other.image_yscale;
					direction = other.image_angle;
					image_angle = direction;
				}
			}
		}
	}
	else
	{
		ds_list_destroy(ownerChar.damage_list);
		state = WEAPONSTATE.FREE; 
	}
	
	//Change state
	if (image_index + ((image_speed * sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps)) >= image_number) //I have added 1 more frame to attack, as that will be deletion frame
	{	
		ds_list_destroy(ownerChar.damage_list);
		//CD
		oCooldown.basicCDTimer = room_speed * basicCD;
		//State
		state = WEAPONSTATE.FREE; 
	}
}