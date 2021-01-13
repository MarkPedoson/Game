//Could use 'Begin step' to make the weapon floaty
//Attaching weapon to the player sprite
player_x = oPlayer.x;
player_y = oPlayer.y - 12;  //Move it with +/- to make it stick to sPlayer
x = player_x
y = player_y

//Weapon moving according to mouse
image_angle = point_direction(x,y,mouse_x,mouse_y);


//Attack logic
attackdelay = attackdelay -1; //So that you couldn't spam attack
if (mouse_check_button(mb_left)) and (attackdelay < 0)
{
	attackdelay = 50;
	with (instance_create_layer(player_x,player_y,"Basic", oBasic)) //Making the attack position a bit higher than the weapon
	{
		if (image_index > (image_number - 1)) image_index = 0;
		direction = other.image_angle;
		image_angle = direction;
		x = other.player_x - lengthdir_x(-16, direction);
		y = other.player_y - lengthdir_y(-16, direction);
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

//Draw over player
depth = oPlayer.depth - 1;
