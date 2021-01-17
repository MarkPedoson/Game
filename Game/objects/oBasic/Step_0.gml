//Draw coordination based on weapon

sprite_index = basicSprite;


x = oPlayer.x;
y = oPlayer.y - 12;



//Mouse angle
x = x - lengthdir_x(-16, oBasic.direction);
y = y - lengthdir_y(-16, oBasic.direction);


//Create logic for sprite drawing speed

if (image_index < damageSprite) image_speed = 0.3;
else image_speed = 0.5;


//Hitbox when
if (image_index >= damageSprite) 
{
	if (!instance_exists(oBasicHB)){
		with (instance_create_layer(x, y, "Basic", oBasicHB))
		{
			image_yscale = other.image_yscale;
			direction = other.image_angle;
			image_angle = direction;
		
		}
	}
}

depth = pEntity.depth - 1;



