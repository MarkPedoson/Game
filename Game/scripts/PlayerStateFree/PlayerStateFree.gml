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
	var _oldSprite = sprite_index;
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
	if (_oldSprite != sprite_index) localFrame = 0;  //Resets the sprite every time
	
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
		var _activateX = lengthdir_x(10, direction);
		var _activateY = lengthdir_y(10, direction);
		activate = instance_position(x + _activateX, y + _activateY, pEntity);
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