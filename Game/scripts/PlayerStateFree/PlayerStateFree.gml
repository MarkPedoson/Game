// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	
	//Movement
	hsp = lengthdir_x(input_magnitude * walksp, input_direction);
	vsp = lengthdir_y(input_magnitude * walksp, input_direction);
	
	//Show weapon
	if (instance_exists(oWeapon)) oWeapon.visible = true;

	//Mouse facing angle
	var _mouse_dir = point_direction(x,y,mouse_x,mouse_y);

	PlayerCollision();
	
	//Logic for character facing according to mouse
	if (_mouse_dir > 90) and (_mouse_dir < 270)
	{
		image_xscale = -1;	//Left
	}
	else
	{
		image_xscale = 1;	//Right
	}


	//Switches player sprite animation
	if (hsp == 0) and (vsp == 0)
	{
		sprite_index = spriteIdle;	
	}
	else
	{	
		if (input_direction != _mouse_dir)  //If the mouse direction and movement conflict plays
		{
			sprite_index = spriteRun; 
			image_speed = -1;
		}
		else
		{
			sprite_index = spriteRun;
			image_speed = 1;
		}
	}
	
	//Change state for dodge rolling
	if (key_roll)
	{	
		if (input_magnitude)
		{
			roll_direction = input_direction;
		}
		else 
		{
			roll_direction = PlayerMouseDirectionFour();
		}
		state = PlayerStateRoll;
		moveDistanceRemaining = rolldist;
	}
	
	//Interaction logic
	if (key_interact)
	{
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
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
}