sprite_index = biteSprite;

if (instance_exists(owner)) and owner.state != ENEMYSTATE.HURT and owner.state != ENEMYSTATE.DIE
{
	//Animation speed
	if (image_index < damageSprite) image_speed = 0.75;
	else image_speed = 1;
	//Hitbox when
	if (image_index >= damageSprite) and (image_index < sprite_get_number(biteSprite)-1)
	{
		var _canCast = CastableAI(oLionBiteHB, id);
		if (_canCast){
			with (instance_create_layer(x, y, "Instance", oLionBiteHB))
			{
				owner = other.owner;
				image_yscale = other.image_yscale;
				direction = other.image_angle;
				image_angle = direction;
		
			}
		}
	}
}
else 
{
	instance_destroy();
}



if (instance_exists(oPlayer)) depth = oPlayer.depth - 1;