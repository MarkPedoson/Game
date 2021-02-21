//Causes room transition 
var _p = global.currentPlayer;
if (_p != noone and (position_meeting(_p.x, _p.y, id)))
{
	if (!instance_exists(oTransition)) and (_p.state != PLAYERSTATE.DEAD)
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = _p.direction;
		if (oPlayer.currentWeapon != noone) global.prevWeapon = _p.currentWeapon.weaponType;
		if (oPlayer.currentCharacter != -1) global.prevCharacter = _p.currentCharacter;
		global.currentPlayer = noone;
		room_goto(targetRoom);	//Instant switch to room
	
		/*
		//Transition style
		with (oPlayer) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
		*/
	
		instance_destroy();
	}
}