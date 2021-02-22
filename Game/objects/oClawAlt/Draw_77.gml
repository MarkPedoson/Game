/// @description Destroy when hitting a wall
if (tilemap_get_at_pixel(ownerChar.obstructionMap, x, y))
{
	with (instance_create_layer(x, y, "Instance", oClawAltParticle))
	{
		x = x + lengthdir_x(15, other.direction);
		y = y + lengthdir_y(7, other.direction);
		image_yscale = other.image_yscale;
		direction = other.image_angle;
		image_angle = direction;
	}
	instance_destroy();
}
