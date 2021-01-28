// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LionReturn(){
	if (teleporting == false)
	{
		sprite_index = sprReturn;
		image_speed = 0.5;
	}
	else
	{
		if (oLion.visible == false) oLion.visible = true;
		sprite_index = sprReturn2;
		image_speed = 0.5;
	}
	
	if (teleporting == false) and (floor(image_index) >= sprite_get_number(sprReturn) -1)
	{
		teleporting = true;
		oLion.visible = false;
		x = xstart;
		y = ystart;
		
		image_index = 0;
		image_speed = 0;
	}
	
	if (teleporting == true) and (floor(image_index) >= sprite_get_number(sprReturn2) -1) 
	{
		teleporting = false;
		state = ENEMYSTATE.WANDER;
	}
}