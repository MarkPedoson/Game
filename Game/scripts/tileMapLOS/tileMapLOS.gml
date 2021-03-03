// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tileMapLOS(_points, _speed, _tilesize, _target){
	/*
    This script takes the TARGET and checks to see if the executing instance can see it.
    If there are no obstructions on our grid, then the script will return false.
    If obstructions are found, then the script will return true.
	*/

	// Is there an obstacle?
	var o = false;

	// Store grid ref
	var cs = _tilesize;

	// Begin loop
	for (var i = 0; i < ds_list_size(_points); i++){
		var _xy = _points[| i];
		var xx = _xy[0];
		var yy = _xy[1];
		var a = point_direction(xx, yy, _target.x, _target.y);
		while(point_in_rectangle(xx, yy, 0, 0, room_width, room_height) and !place_meeting(xx, yy, _target))
		{
		    // Check for obstruction
			if(!oAStar.walkable[xx div cs, yy div cs])
		    {
		        return true;
		    }

		    // Move on
		    xx += lengthdir_x(_speed, a);
		    yy += lengthdir_y(_speed, a);
		}
	}

	// Return
	return o;
}