
if (flashWeapon != 0)
{
	shader_set(flashWeaponShader);
	uFlashWeapon = shader_get_uniform(flashWeaponShader, "flash");
	shader_set_uniform_f(uFlashWeapon, flashWeapon);
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