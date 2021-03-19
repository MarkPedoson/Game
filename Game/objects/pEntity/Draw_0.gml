//1 = normal bipedal
//2 = normal quadpedal
// todo
if (entityShadow)
{
	switch (entitySize)
	{
		case 0:
			draw_sprite(sShadow, 0, floor(x), floor(y));
			break;
		case 1:
			draw_sprite(sShadow2, 0, floor(x), floor(y));
			break;		
		default:
			draw_sprite(sShadow2, 0, floor(x), floor(y));
			break;
	}
}
//Usual damage
if (flash != 0)
{
	shader_set(shWhite);
	shader_set_uniform_f(uFlash, flash);
}
//Stun effect
else if (stunned != -1)
{
	if (stunCounter > 0) stunCounter--;
	else{
		if (stunImageIndex < 4) {
			stunCounter = 3;
			stunImageIndex++;
		}
	}
	switch (stunned)
	{
		case "magma":
			if (entitySize == 0 or entitySize == 1) var _magmaShader = sMagmaShader;
			else if (entitySize == 2) var _magmaShader = sMagmaShader2;
			else if (entitySize == 3) var _magmaShader = sMagmaShader3;
			SetShaderMagma(_magmaShader, stunImageIndex, sprite_index, image_index);
			break;
	}
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