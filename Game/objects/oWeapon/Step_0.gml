//Could use 'Begin step' to make the weapon floaty
//Attaching weapon to the player sprite
x = oPlayer.x;
y = oPlayer.y;  //Move it with +/- to make it stick to sPlayer

//Weapon moving according to mouse
image_angle = point_direction(x,y,mouse_x,mouse_y);

//Attack logic
attackdelay = attackdelay -1; //So that you couldn't spam attack
if (mouse_check_button(mb_left)) and (attackdelay < 0)
{
	attackdelay = 50;
	with (instance_create_layer(x,y,"Slash_attack", oSlash)) //Making the attack position a bit higher than the weapon
	{
		direction = other.image_angle;
		image_angle = direction;
		x = x - lengthdir_x(-50, direction);
		y = y - lengthdir_y(-50, direction);
	}
}

if (image_angle > 90) and (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}