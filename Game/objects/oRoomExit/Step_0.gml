//Causes room transition 
if (instance_exists(oPlayer) and (position_meeting(oPlayer.x, oPlayer.y, id)))
{
	global.targetRoom = targetRoom;
	global.targetX = targetX;
	global.targetY = targetY;
	global.targetDirection = oPlayer.direction;
	room_goto(targetRoom);	//Instant switch to room
	
	/*
	//Transition style
	with (oPlayer) state = PlayerStateTransition;
	RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
	*/
	
	instance_destroy();
}