// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChangeWeapon(_value){
	var wp_map = weaponSkin[_value];
	spriteWeapon = ds_map_find_value(wp_map, "spriteWeapon");
	spriteBasic = wp_map[? "spriteBasic"];
}