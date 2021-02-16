//Causes room transition 
if (instance_exists(oPlayer) and (position_meeting(oPlayer.x, oPlayer.y, id)))
{
	if (!instance_exists(oTransition)) and (oPlayer.state != PlayerStateDead)
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = oPlayer.direction;
		if (oPlayer.currentWeapon != noone) global.prevWeapon = oPlayer.currentWeapon.weaponType;
		room_goto(targetRoom);	//Instant switch to room
	
		/*
		//Transition style
		with (oPlayer) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
		*/
	
		instance_destroy();
	}
}