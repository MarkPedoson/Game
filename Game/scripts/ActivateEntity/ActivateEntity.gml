// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ActivateEntity(){
	var _activateList = ds_list_create();
	activate = noone;
	var _entitiesFound = collision_circle_list(
		x,
		y - 10,
		20,
		pEntity,
		false,
		true,
		_activateList,
		true
	); 
		
	while (_entitiesFound > 0)
	{
		var _check = _activateList [| --_entitiesFound];
		if /*(_check != global.iLifted) and */ (_check.entityActivateScript != -1)
		{
			activate = _check;
			break;
		}
	}
		
	ds_list_destroy(_activateList);
	//activate = instance_position(x + _activateX, y + _activateY, pEntity);
	if (activate == noone or activate.entityActivateScript == -1)
	{
		//do_nothing
	}
	else
	{
		//Activate the entity
		ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
		
		//Make an npc face the player
		if (activate.entityNPC)
		{
			with (activate)
			{
				direction = point_direction(x, y, other.x, other.y);
				if (direction > 90) and (direction < 270)
				{
					image_xscale = -1;	//Left
				}
				else
				{
					image_xscale = 1;	//Right
				} 
			}
		}
	}
}