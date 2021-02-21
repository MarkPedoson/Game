// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawRectangleCd(_x1, _y1, _x2, _y2, _value, _ammo){
	var v, x1, y1, x2, y2, xm, ym, vd, vx, vy, v1;
	v = _value;
	if (_ammo == true) var tex = sprite_get_texture(sAmmoIcon, 0); //
	else var tex = sprite_get_texture(sIcon, 0);
	x1 = _x1; y1 = _y1; //first p
	x2 = _x2; y2 = _y2; //sec p
	xm = (x1 + x2) / 2; ym = (y1 + y2) / 2; //middle
	draw_primitive_begin_texture(pr_trianglefan, tex); //
	draw_vertex_texture(xm, ym, 0.5, 0.5); draw_vertex_texture(xm, y1, 0.5, 0); //
	//draw corners
	if (v >= 0.125) {	draw_vertex_texture(x2, y1, 1, 0)	} //
	if (v >= 0.375) {	draw_vertex_texture(x2, y2, 1, 1)	} //
	if (v >= 0.625) {	draw_vertex_texture(x1, y2, 0, 1)	} //
	if (v >= 0.875) {	draw_vertex_texture(x1, y1, 0, 0)	} //
	//calculate angle and vector from value
	vd = pi * (v * 2 - 0.5);
	vx = cos(vd);
	vy = sin(vd);
	v1 = max(abs(vx), abs(vy));
	if (v1 < 1)
	{
		vx /= v1;
		vy /= v1;
	}
	draw_vertex_texture(xm + vx * (x2 - x1) / 2, ym + vy * (y2 - y1) / 2, 0.5 + vx / 2, 0.5 + vy / 2); //
	draw_primitive_end(); //
}