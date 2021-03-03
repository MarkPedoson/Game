// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clearenceCheck(_i, _j, _width, _height){
	var _add = 0;
	/* This is if I need to work down and right first
	for (var k = _j + 1; k < _height; k++){ //Moving down the y
		for (var l = 0; l <= (k - _j); l++){ //Moving right the x
			if (l + _i >= _width) or (oAStar.walkable[l + _i, k] == false){
				return _add;
			}
			if (l == (k - _j)){
				for (var temp = k; temp >= _j; temp--){
					if (oAStar.walkable[l + _i, temp] == false){
						return _add;
					}
				}
			}
		}
		_add += 1;
	}
	*/
	for (var l = _i + 1; l < _width; l++){
		for (var k = 0; abs(k) <= (l - _i); k--){
			if (k + _j < 0) or (!oAStar.walkable[l, k + _j]) return _add;
			if (abs(k) == (l - _i)){
				for (var temp = l; temp >= _i; temp--){
					if (!oAStar.walkable[temp, k + _j]) return _add;
				}
			}
		}
		_add += 1;
	}
	return _add;
}