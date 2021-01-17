//Beginning attr of player
state = PlayerStateFree;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("Tile"));

//Movement
z = 0; //setting z value
flash = 0; //Getting damaged

hsp = 0; //horizontal speed
vsp = 0; //vertical speed
rolldist = 100 //dashing distance
walksp = 2.5; //movement speed
rollsp = 4; //how fast the space skill is
rollheight = 24; //roll  height

hp = 3; //health




spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

temp_playerimagex = 1;