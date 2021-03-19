// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StunParticle(){
	switch(stunned){
				case "magma":	
					if (entitySize == 0 or entitySize == 1) var _magmaParticle = oMagmaParticle;
					else if (entitySize == 2) var _magmaParticle = oMagmaParticle2;
					else if (entitySize == 3) var _magmaParticle = oMagmaParticle3;
					with (instance_create_layer(x, y, "Skill_effects", _magmaParticle)){
						ownerChar = other.id;
					}
					break;
			}
}