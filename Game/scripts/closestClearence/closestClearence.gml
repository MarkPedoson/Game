// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function closestClearence(_x, _y, _clearence){
	//Change to tile coordinates
	var tileX = _x div oAStar.blockSize;
	var tileY = _y div oAStar.blockSize;
	
	//Create data structures
	frontier = ds_priority_create();
	reached = ds_list_create();
	
	ds_priority_add(frontier, getKey(tileX, tileY), 0);
	ds_list_add(reached, getKey(tileX, tileY));
	var prio_index = 1;
	
	//Call the search
	var index = processClearence(tileX, tileY, _clearence, prio_index, frontier, reached);
	
	//Clean up
	ds_priority_destroy(frontier);
	ds_list_destroy(reached);
	
	
	return index;
}