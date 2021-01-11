draw_sprite(sShadow, 0, floor(x), floor(y));

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



//For character flashing when getting hit
//draw_self();
//if (flash > 0)
//{
//	flash--;
//	shader_set(shWhite);
//	draw_self();
//	shader_reset();
//}