draw_sprite(sShadow, 0, floor(x), floor(y));

if (invFramePlayer == true) and (playerFlash == 0) and ((invFrameCount mod 8 < 2) == 0) and (state != PLAYERSTATE.DEAD)
{
	//For flashing;
	invFrameCount+= 1;	
}
else
{
	
	if (playerFlash != 0)
	{
		shader_set(playerFlashShader);
		uFlashPlayer = shader_get_uniform(playerFlashShader, "flash");
		shader_set_uniform_f(uFlashPlayer, playerFlash);
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
}



