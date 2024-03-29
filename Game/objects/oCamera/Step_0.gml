//Update camera
var _p = global.currentPlayer;
//Update destination
if (_p != noone)
{
	xTo = _p.x;
	yTo = _p.y;
}

//Update object position
x = xTo;
y = yTo;

//Slow camera movement
/*
x += (xTo - x) / 15;
y += (yTo -y) / 15;
*/

//Keep camera center inside room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);