//Could use 'Begin step' to make the weapon floaty
key_basic = mouse_check_button_pressed(mb_left);

//Weapon lock
if (ownerChar != -1)
{
	//Location
	x = ownerChar.x;
	y = (ownerChar.y - ownerChar.z) + yChar;
	
	//Visibility
	if (ownerChar.state != PlayerStateDead) visible = true;
	else visible = false;
	
	//State management
	if (!global.gamePaused)
	{
		//CD
		//Basic
		if (canBasic == false) 
		{
			if (state != WEAPONSTATE.BASIC) 
			{
				if (basicCDTimer > 0) basicCDTimer--;
				else if (basicCDTimer == 0) canBasic = true;
			}
		}
		
		//State
		if (ownerChar.state == PlayerStateLocked) and (state != WEAPONSTATE.LOCKED)
		{
			prevstate = state;
			state = WEAPONSTATE.LOCKED;
		}
		else if (ownerChar.state != PlayerStateLocked) and (state == WEAPONSTATE.LOCKED)
		{
			state = prevstate;
			prevstate = -1;
		}

		if (weaponCharScript[state] != -1) script_execute(weaponCharScript[state]);
	}
}

//Draw over player
if (instance_exists(oPlayer)) depth = oPlayer.depth - 1;
