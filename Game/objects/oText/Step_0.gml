lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress); //Takes 2 values and percent to give the percentile distance between the values
x2 = lerp(x2, x2Target, lerpProgress);

//Cycle through responses
key_down = keyboard_check_pressed (vk_down) or keyboard_check_pressed(ord("S"));
key_up = keyboard_check_pressed (vk_up) or keyboard_check_pressed(ord("W"));
responseSelected += (key_down - key_up);
var _max = array_length_1d(arrayResponses) - 1;
var _min = 0;
if (responseSelected > _max) responseSelected = _min;  //Wraps around the choices
if (responseSelected < _min) responseSelected = _max;

if (oPlayer.key_roll)
{
	var _messageLength = string_length(textMessage);
	if (textProgress >= _messageLength)
	{
		if (arrayResponses[0] != -1)
		{
			with(originInstance) DialogueResponses(other.responseScripts[other.responseSelected]);
		}
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