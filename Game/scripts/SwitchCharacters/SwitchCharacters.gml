// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SwitchCharacters(_x, _y, _character, _characterENUM){
	with (instance_create_layer(_x, _y, "Instance", _character))
	{
		global.currentPlayer = id;
		currentCharacter = _characterENUM;
		global.playerHealth = global.playerHealthMax;
	}
}