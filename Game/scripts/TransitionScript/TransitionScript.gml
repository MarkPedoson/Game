// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TransitionScript(_weapon1, _weaponType1, _weapon2, _weaponType2){
	if (global.targetX != -1)
	{
		x = global.targetX;
		y = global.targetY;
		direction = global.targetDirection;
	
		//Lets add the weapon back
		if (global.prevWeapon != -1)
		{
			if (global.prevWeapon == _weaponType1)
			{
				SwitchWeapons(_weapon1);
			}
			else if (global.prevWeapon == _weaponType2)
			{
				SwitchWeapons(_weapon2);
			}
		}
		//Reset the var
		global.targetX = -1;
		global.targetY = -1;
		global.targetDirection = 0;
		global.targetRoom = -1;
		global.prevWeapon = -1;
	}
}