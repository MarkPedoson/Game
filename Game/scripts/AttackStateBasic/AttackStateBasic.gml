// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackStateBasic(){
	canBasic = false;
	alarm[0] = basicCD;
	//Change weapon sprite
	
	//Weapon lock
	x = oPlayer.x;
	y = oPlayer.y - 10;
	
	image_angle = temp_weaponangle;
	image_yscale = temp_weaponimagey;
	
	
	oPlayer.image_xscale = oPlayer.temp_playerimagex;
	
	if (!instance_exists(oBasic)){
		with (instance_create_layer(x,y,"Basic", oBasic)) 
			{
				image_yscale = other.image_yscale;
				direction = other.image_angle;
				image_angle = direction;
				x = x - lengthdir_x(-16, direction);
				y = y - lengthdir_y(-16, direction);
			
			}
	}
	
	//Change state
	if (floor(oBasic.image_index) >= sprite_get_number(spriteBasic)-1) //I have added 1 more frame to attack, as that will be deletion frame
	{	
		attackState = AttackStateFree; 
	}
	
}