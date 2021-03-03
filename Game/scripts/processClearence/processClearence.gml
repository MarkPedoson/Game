// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function processClearence(_x, _y, _clear, _index, _Q, _L){
	var _coord = -1;
	while (!ds_priority_empty(_Q)){
		var _current = ds_priority_find_min(_Q);
		ds_priority_delete_min(_Q);
		if (oAStar.clearence[_current] >= _clear) return _current;
		else{
			var _currentX = getKeyX(_current);
			var _currentY = getKeyY(_current);
			var _currentYUp = _currentY -1;
			var _currentYDown = _currentY +1;
			var _currentXLeft = _currentX -1;
			var _currentXRight = _currentX +1;
			
			if (_currentYUp >= 0) and (ds_list_find_index(_L, getKey(_currentX, _currentYUp)) == -1) {
				if (oAStar.walkable[_currentX, _currentYUp]){
					if (oAStar.clearence[getKey(_currentX, _currentYUp)] >= _clear) return getKey(_currentX, _currentYUp);
					else{
						_index ++;
						ds_priority_add(_Q, getKey(_currentX, _currentYUp), _index);
						ds_list_add(_L, getKey(_currentX, _currentYUp));
					}
				}
			}
			if (_currentYDown < oAStar.fieldHeight) and (ds_list_find_index(_L, getKey(_currentX, _currentYDown)) == -1) {
				if (oAStar.walkable[_currentX, _currentYDown]){
					if (oAStar.clearence[getKey(_currentX, _currentYDown)] >= _clear) return getKey(_currentX, _currentYDown);
					else{
						_index ++;
						ds_priority_add(_Q, getKey(_currentX, _currentYDown), _index);
						ds_list_add(_L, getKey(_currentX, _currentYDown));
					}
				}
			}
			if (_currentXLeft >= 0) and (ds_list_find_index(_L, getKey(_currentXLeft, _currentY)) == -1) {
				if (oAStar.walkable[_currentXLeft, _currentY]){
					if (oAStar.clearence[getKey(_currentXLeft, _currentY)] >= _clear) return getKey(_currentXLeft, _currentY);
					else{
						_index ++;
						ds_priority_add(_Q, getKey(_currentXLeft, _currentY), _index);
						ds_list_add(_L, getKey(_currentXLeft, _currentY));
					}
				}
			}
			if (_currentXRight < oAStar.fieldWidth) and (ds_list_find_index(_L, getKey(_currentXRight, _currentY)) == -1) {
				if (oAStar.walkable[_currentXRight, _currentY]){
					if (oAStar.clearence[getKey(_currentXRight, _currentY)] >= _clear) return getKey(_currentXRight, _currentY);
					else{
						_index ++;
						ds_priority_add(_Q, getKey(_currentXRight, _currentY), _index);
						ds_list_add(_L, getKey(_currentXRight, _currentY));
					}
				}
			}
		}
	}
	return _coord;
}