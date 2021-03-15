// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SetShaderMagma(_sprite, _spriteIndex, _entity, _entityIndex){
	var _magmaSpr = _sprite;
	var _magmaImg = _spriteIndex;
	
	//Set shader
	shader_set(shHardenedMagma);
	
	//Get acces to uniforms
	var u_Magma = shader_get_sampler_index(shHardenedMagma, "u_Magma");
	var u_MagmaUV  = shader_get_uniform(shHardenedMagma, "u_MagmaUV");
	var u_SpriteUV = shader_get_uniform(shHardenedMagma, "u_SpriteUV");
	
	//Set the uniform values
	var magmaTex = sprite_get_texture(_magmaSpr, _magmaImg);
	var magmaUVs = sprite_get_uvs(_magmaSpr, _magmaImg);
	texture_set_stage(u_Magma, magmaTex);
	shader_set_uniform_f(u_MagmaUV, magmaUVs[0], magmaUVs[1], magmaUVs[2], magmaUVs[3]);

	var spriteUVs = sprite_get_uvs(_entity, _entityIndex); // <- should be the enemy sprite
	shader_set_uniform_f(u_SpriteUV, spriteUVs[0], spriteUVs[1], spriteUVs[2], spriteUVs[3]);
}