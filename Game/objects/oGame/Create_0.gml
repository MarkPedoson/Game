//Initialise and globals
randomize();
global.currentPlayer = noone;

global.respawnLocations = ds_list_create();
var _rL = global.respawnLocations;
ds_list_add(_rL, [96, 160, rCerberusJail]);
ds_list_add(_rL, [64, 128, rKitsuneJail]);

global.gamePaused = false;
global.iCamera = instance_create_layer(0,0,layer, oCamera);  //Create the camera
global.iUI = instance_create_layer(0,0,layer, oUI);
global.textSpeed = .75;

//Transitioning
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.prevWeapon = -1;
global.prevCharacter = -1;


global.playerHealthMax = 3;
global.playerHealth = global.playerHealthMax;

ideal_width = RESOLUTION_W;
ideal_height = RESOLUTION_H;
zoom = 1;
max_zoom = 1;


max_zoom = floor(display_get_width()/ideal_width);


for(var i = 1; i <= room_last; i++)
{
	if(room_exists(i))
	{
		room_set_camera(i,0,global.iCamera)
		room_set_viewport(i,0,true,ideal_width,ideal_height,ideal_width,ideal_height);
	}
}


surface_resize(application_surface, ideal_width, ideal_height);

room_goto(ROOM_START);