// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RoundTo(_value, _decimals){
	var _mult = power(10, _decimals);
	var _sep = floor(_value * _mult);
	return _sep / _mult;
}