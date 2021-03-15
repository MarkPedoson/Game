// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LOSScript(_object, _target){
	// Obstructed
	var info = false;
	
	// Rectangle 
	var xmid = _object.x;
	var x1 = _object.x - _object.collX;
	var x2 = _object.x + _object.collX;
	var y2 = _object.y;
	var y1 = _object.y - _object.collY;
	var ymid = _object.y - floor(_object.collY / 2);
	
	// Angle
	var _angle = point_direction(xmid, y2, _target.x, _target.y);
	
	// Data structure
	ds_points = ds_list_create();
	
	if (_angle >= 0 and _angle < 90){
		ds_list_add(ds_points, [x2, y2], [x2, ymid], [x2, y1], [xmid, y1], [x1, y1]);
	}
	else if (_angle >= 90 and _angle < 180){
		ds_list_add(ds_points, [x2, y1], [xmid, y1], [x1, y1], [x1, ymid], [x1, y2]);
	}
	else if (_angle >= 180 and _angle < 270){
		ds_list_add(ds_points, [x1, y1], [x1, ymid], [x1, y2], [xmid, y2], [x2, y2]);
	}
	else if (_angle >= 270 and _angle <= 359){
		ds_list_add(ds_points, [x1, y2], [xmid, y2], [x2, y2], [x2, ymid], [x2, y1]);
	}
	
	var info = tileMapLOS(ds_points, _object.enemySpeed, TILE_SIZE, _target);
	
	//Cleanup
	ds_list_destroy(ds_points);
	
	return info;
}