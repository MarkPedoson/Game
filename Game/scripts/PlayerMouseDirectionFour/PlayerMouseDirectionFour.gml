// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerMouseDirectionFour(){
	var _roll_direction;
	_mouse_dir = point_direction(x,y,mouse_x,mouse_y);
	
	//Choose direction based on angle
	if (_mouse_dir > 45 and _mouse_dir < 135)
	{
		_roll_direction = point_direction(0, 0, 0, -1); //Up
	}
	else if (_mouse_dir > 225 and _mouse_dir < 315)
	{
		_roll_direction = point_direction(0, 0, 0, 1); //Down
	}
	else if ((_mouse_dir >= 315 and _mouse_dir <= 360) or (_mouse_dir >= 0 and _mouse_dir <= 45))
	{
		_roll_direction = point_direction(0, 0, 1, 0); //Right
	}
	else if (_mouse_dir >= 135 and _mouse_dir <= 225)
	{
		_roll_direction = point_direction(0, 0, -1, 0);  //Left
	}
	return _roll_direction;
}