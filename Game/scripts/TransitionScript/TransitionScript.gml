
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TransitionScript(){
	if (global.targetX != -1)
	{
		//x = global.targetX;
		//y = global.targetY;
		
		if (global.prevCharacter != -1)
		{
			switch (global.prevCharacter)
			{
				case 0: 
					SwitchCharacters(global.targetX, global.targetY, oCerberus, PLAYERCHAR.CERBERUS);
					direction = global.targetDirection;
					break;
				case 1:
					SwitchCharacters(global.targetX, global.targetY, oKitsune, PLAYERCHAR.KITSUNE);
					direction = global.targetDirection;
					break;
			}
		}
	
		//Lets add the weapon back
		if (global.prevWeapon != -1)
		{
			switch (global.prevWeapon)
			{
				case 0:
					SwitchWeapons(oClaw);
					break;
				case 1:
					SwitchWeapons(oSpear);
					break;
				case 2:
					SwitchWeapons(oFan);
					break;
				case 3:
					SwitchWeapons(oWhip);
					break;
			}
		}
		//Reset the var
		global.targetX = -1;
		global.targetY = -1;
		global.targetDirection = 0;
		global.targetRoom = -1;
		global.prevWeapon = -1;
		global.prevCharacter = -1;
	}
}