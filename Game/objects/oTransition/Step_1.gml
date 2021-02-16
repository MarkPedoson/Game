with (oPlayer) 
{
	if (state != PlayerStateDead) state = PlayerStateTransition;
}

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1)  //If screen fulli obscured
	{
		room_goto(target);
		leading = IN;
	}
}
else //leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0)	//If screen fully shown
	{
		with (oPlayer) state = PlayerStateFree;
		instance_destroy();
	}
}