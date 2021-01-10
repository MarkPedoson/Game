// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(_message, _background, _array)
{
	var _obj;

	if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with (instance_create_layer(0, 0, "Instance", _obj))
	{
		textMessage = _message;
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		background = _background;
		arrayResponses = _array;
		//Trim markers from responses
		if (arrayResponses[0] != -1) 
		{
			for (var i = 0; i < array_length_1d(arrayResponses); i++)
			{
				var _markerPosition = string_pos(":", arrayResponses[i]);
				responseScripts[i] = string_copy(arrayResponses[i], 1, _markerPosition - 1);
				responseScripts[i] = real(responseScripts[i]);
				arrayResponses[i] = string_delete(arrayResponses[i], 1,_markerPosition);
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1];
		}
	}


	with (oPlayer)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}