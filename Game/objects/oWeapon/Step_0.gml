//Could use 'Begin step' to make the weapon floaty
key_basic = mouse_check_button_pressed(mb_left);
key_alt = mouse_check_button_pressed(mb_right);
var _CD = oCooldown;
//Weapon lock
if (ownerChar != -1)
{
	//Location
	x = ownerChar.x;
	y = ownerChar.y + yChar;
	z = ownerChar.z;
	
	//Visibility
	if (ownerChar.state != PLAYERSTATE.DEAD) 
		and (ownerChar.state != PLAYERSTATE.ROLL) 
		and (ownerChar.state != PLAYERSTATE.SIGNATURE)
		and (ownerChar.state != PLAYERSTATE.HEAL){
		visible = true;
	}
	else {
		visible = false;
	}
	
	//State management
	if (!global.gamePaused)
	{
		//CD
		//Basic
		if (canBasic == false) or (basicAmmo != -1 and _CD.basicAmmoCounter < basicAmmo)
		{
			if (state != WEAPONSTATE.BASIC) 
			{
				//Normal cd
				if (_CD.basicCDTimer > 0) _CD.basicCDTimer--;
				else if (_CD.basicCDTimer == 0){
					if (basicAmmo != -1){
						if (_CD.basicAmmoCounter <= 0){
							_CD.basicAmmoCounter = basicAmmo;
						}
						else {
							_CD.basicAmmoCounter += 1;
							if (_CD.basicAmmoCounter < basicAmmo) _CD.basicCDTimer = basicCD * room_speed;
						}
						canBasic = true;
					}
					else canBasic = true;
				}
			}
		}
		
		//Alt
		if (canAlt == false) or (altAmmo != -1 and _CD.altAmmoCounter < altAmmo)
		{
			if (state != WEAPONSTATE.ALT) 
			{
				//Normal cd
				if (_CD.altCDTimer > 0) _CD.altCDTimer--;
				else if (_CD.altCDTimer == 0){
					//If ammo mechanic exists
					if (altAmmo != -1){
						if (_CD.altAmmoCounter <= 0){
							_CD.altAmmoCounter = altAmmo;
						}
						else {
							_CD.altAmmoCounter += 1;
							if (_CD.altAmmoCounter < altAmmo) _CD.altCDTimer = altCD * room_speed;
						}
						canAlt = true;
					}
					else canAlt = true;
				}
			}
		}
		
		//State
		if (ownerChar.state == PLAYERSTATE.LOCKED) and (state != WEAPONSTATE.LOCKED)
		{
			prevstate = state;
			state = WEAPONSTATE.LOCKED;
		}
		else if (ownerChar.state != PLAYERSTATE.LOCKED) and (state == WEAPONSTATE.LOCKED)
		{
			state = prevstate;
			prevstate = -1;
		}

		if (weaponCharScript[state] != -1) script_execute(weaponCharScript[state]);
		flashWeapon = max(flashWeapon - 0.05, 0);
	}
}
