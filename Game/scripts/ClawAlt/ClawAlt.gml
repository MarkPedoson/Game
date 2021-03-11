// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ClawAlt(){
	//Change weapon sprite
	switch (altAmmoTemp){
		case 3:
			sprite_index = spriteAlt;
			break;
		case 2:
			sprite_index = spriteAlt1;
			break;
		case 1:
			sprite_index = spriteAlt2;
			break;
		default:
			sprite_index = spriteAlt;
			break;
	}
	image_speed = 0.5;
	
	if(!altCastFinish){
		//Hitbox when
		if (image_index >= 3)
		{
			var _canCast = CastablePlayer(oClawAlt, ownerChar);
			if (_canCast){
				with (instance_create_layer(x, y, "Skill_effects", oClawAlt))
				{
					ownerChar = other.ownerChar;
					speed = 10;
					image_yscale = other.image_yscale;
					direction = other.image_angle;
					image_angle = direction;
				}
			}
			altCastFinish = true;
		}
	}
	
	
	if (altCastFinish){
		//CD
		var _c = oCooldown;
		if (_c.altCDTimer == 0) and (_c.altAmmoCounter == altAmmo){
			_c.altCDTimer = room_speed * altCD;
		}
		_c.altAmmoCounter -= 1;
		if (_c.altAmmoCounter != 0) oClaw.alarm[0] = 0.5 * room_speed; //Slight delay ment for not being able to spam
		else if (_c.altAmmoCounter == 0) {
			canBasic = false;
			_c.basicCDTimer = _c.altCDTimer;
			basicCD = altCD; //Setting basicCD the same so UI would have the same ratio
			alarm[1] = _c.altCDTimer; //Alarm to setting back to original, very weird I know
		}
		
		//Finish casting
		altCastFinish = false;
		
		//State
		state = WEAPONSTATE.FREE; 
	}
}