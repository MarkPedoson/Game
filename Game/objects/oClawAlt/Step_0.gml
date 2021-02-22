/// @description Insert description here
// You can write your code in this editor
if (point_distance(x, y, xstart, ystart) > travel_distance)
{
	with (instance_create_layer(x, y, "Instance", oClawAltParticle))
	{
		x = x + lengthdir_x(14, other.direction);
		y = y + lengthdir_y(7, other.direction);
		image_yscale = other.image_yscale;
		direction = other.image_angle;
		image_angle = direction;
	}
	instance_destroy();
}
if (ownerChar != -1) 
{
	if (ownerChar.currentWeapon != noone) depth = ownerChar.currentWeapon.depth - 1;
}