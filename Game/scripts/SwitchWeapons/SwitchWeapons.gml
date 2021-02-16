// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SwitchWeapons(_weapon){
	with (instance_create_layer(oPlayer.x, (oPlayer.y - oPlayer.z) - 10, "Instance", _weapon))
	{
	ownerChar = other.id;
	other.currentWeapon = id;
	}
	basicIcon = currentWeapon.basicIcon;
	basicIconAct = currentWeapon.basicIconAct;
	altIcon = currentWeapon.altIcon;
}