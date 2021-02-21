// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CastableAI(_object, _owner){
	if (!instance_exists(_object)) return true;
	else
	{
		var _i;
		var _castable = true;
		for (_i = 0; _i < instance_number(_object); _i +=1)
		{
			var _skillObject = instance_find(_object, _i);
			if (_skillObject.owner == _owner) return false;	
		}
		return _castable;
	}
}