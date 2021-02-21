// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SwitchWeapons(_weapon){
	var _p = global.currentPlayer;
	with (instance_create_layer(_p.x, (_p.y - _p.z) - 10, "Instance", _weapon))
	{
		ownerChar = _p;
		ownerChar.currentWeapon = id;
	}
}