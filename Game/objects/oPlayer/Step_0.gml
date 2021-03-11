//Get player input
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));
key_sign = keyboard_check(ord("1"));
key_roll = keyboard_check_pressed(vk_space);
key_interact = keyboard_check(ord("E"));
key_heal_press = keyboard_check_pressed(ord("Q"));
key_heal_release = keyboard_check_released(ord("Q"));

input_direction = point_direction(0,0,key_right-key_left, key_down - key_up);
input_magnitude = (key_right - key_left != 0) or (key_down - key_up != 0);

var _CD = oCooldown;
if (!global.gamePaused) 
{
	//Endurance
	if (_CD.enduranceCounter < endurance) and (_CD.enduranceCounter != -1){
		if (state != PLAYERSTATE.HEAL){
			if (_CD.enduranceCDTimer > 0) _CD.enduranceCDTimer--;
			else if (_CD.enduranceCDTimer <= 0){
				if (_CD.enduranceCounter + enduranceRegen > endurance) _CD.enduranceCounter = endurance;
				else _CD.enduranceCounter += enduranceRegen;
				if (_CD.enduranceCounter < endurance) _CD.enduranceCDTimer = room_speed * 0.5;
				if (_CD.enduranceCounter >= 100){
					canEndurance = true;
				}
			}
		}
	}
	
	//Signature
	if (canSign == false) or (signAmmo != -1 and _CD.signAmmoCounter < signAmmo)
	{
		if (state != PLAYERSTATE.SIGNATURE) 
		{
			//Normal cd
			if (_CD.signCDTimer > 0) _CD.signCDTimer--;
			else if (_CD.signCDTimer <= 0){
				//If ammo mechanic exists
				if (signAmmo != -1){
					if (_CD.signAmmoCounter <= 0){
						_CD.signAmmoCounter = signAmmo;
					}
					else {
						_CD.signAmmoCounter += 1;
						if (_CD.signAmmoCounter < signAmmo) _CD.signCDTimer = signCD * room_speed;
					}
					canSign = true;
				}
				else canSign = true;
			}
		}
	}
	if (playerCharScript[state] != -1) script_execute(playerCharScript[state]); //If statement only exists to deal with paused stated

	invFrameCount = max(invFrameCount - 1, 0);
	playerFlash = max(playerFlash - 0.05, 0);
}

