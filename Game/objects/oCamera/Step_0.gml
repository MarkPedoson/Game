//Update camera

//Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
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