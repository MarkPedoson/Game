// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CdToSeconds(_value){
	var _realCD = _value / room_speed;
	if ((_realCD mod 60) < 1) 
	{
		var _string = string_format(RoundTo(_realCD, 1), 1, 1) + "s";
		if (RoundTo(_realCD, 1) == 0) _string = "";
	}
	else 
	{
		var _string = string(RoundTo(_realCD, 0)) + "s";
	}
	
	return _string;
}