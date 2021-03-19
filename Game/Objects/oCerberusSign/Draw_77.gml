if (tilemap_get_at_pixel(ownerChar.obstructionMap, x, y))
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