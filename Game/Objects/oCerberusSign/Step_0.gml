image_speed = 0.3; //Magic nr that works
if (point_distance(x, y, xstart, ystart) > travel_distance)
{
	with (instance_create_layer(x, y, "Skill_effects", oCerberusSignColl)){
		ownerChar = other.ownerChar;
		speed = 2;
		image_yscale = other.image_yscale;
		direction = other.image_angle;
		image_angle = direction;
	}
	instance_destroy();
}