if (entityShadow != -1)
{
	switch (entityShadow)
	{
		case 1:
			draw_sprite(sShadow, 0, floor(x), floor(y));
			break;
		case 2:
			draw_sprite(sShadow2, 0, floor(x), floor(y));
			break;			
	}
}

if (flash != 0)
{
	shader_set(shWhite);
	shader_set_uniform_f(uFlash, flash);
}

draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if (shader_current() != -1) shader_reset();