lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress); //Takes 2 values and percent to give the percentile distance between the values
x2 = lerp(x2, x2Target, lerpProgress);

if (oPlayer.key_roll)
{
	var _messageLength = string_length(textMessage);
	if (textProgress >= _messageLength)
	{
		instance_destroy();
		if (instance_exists(oTextQueued))
		{
			with (oTextQueued) ticket--;
		}
		else
		{
			with (oPlayer) state = lastState;
		}
	}
	else
	{
		if (textProgress > 2) //Lets you skip the message
		{
			textProgress = _messageLength;
		}
	}
}