// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CerberusStateSignature(){
	image_speed = 0.5;
	var _image_angle = point_direction(x, y - 18, mouse_x, mouse_y);
	var _canCast = CastablePlayer(oCerberusSign, global.currentPlayer);
	if (_canCast){
		with (instance_create_layer(x, y - 18, "Skill_effects", oCerberusSign))
		{
			ownerChar = global.currentPlayer;
			speed = 3;
			image_xscale = other.image_xscale;
			direction = _image_angle;
			image_angle = direction;
		}
	}

	//CD
	oCooldown.signCDTimer = room_speed * signCD;
	canSign = false;
	
	//State
	state = PLAYERSTATE.FREE; 
}