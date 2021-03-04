//Resize grid
var dgrid = ds_depthgrid;
var inst_num = instance_number(pDepthObject);
ds_grid_resize(dgrid, 2, inst_num);

var yy = 0; with (pDepthObject){
	dgrid[# 0, yy] = id;
	if (object_is_ancestor(object_index, oWeapon)) dgrid[# 1, yy] = y + 11;
	else dgrid[# 1, yy] = y;
	yy++
}

ds_grid_sort(dgrid, 1, true);

var inst;
yy = 0; repeat(inst_num){
	inst = dgrid[# 0, yy];
	with(inst){
		if (object_is_ancestor(object_index, oWeapon)) and (inst.visible) event_perform(ev_draw, 0);
		else if (!object_is_ancestor(object_index, oWeapon)) event_perform(ev_draw, 0);
	}
	yy++;
}