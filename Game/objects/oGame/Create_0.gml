//Initialise and globals
randomize();

global.gamePaused = false;
//global.iCamera = instance_create_layer(0,0,layer, oCamera);  //Create the camera
global.textSpeed = .75;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

room_goto(ROOM_START);