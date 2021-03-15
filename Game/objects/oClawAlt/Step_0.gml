
image_speed = 0.5;
if (point_distance(x, y, xstart, ystart) > travel_distance)
{
	with (instance_create_layer(x, y, "Skill_effects", oClawAltParticle))
	{
		x = x + lengthdir_x(14, other.direction);
		y = y + lengthdir_y(7, other.direction);
		image_yscale = other.image_yscale;
		direction = other.image_angle;
		image_angle = direction;
	}
	instance_destroy();
}
