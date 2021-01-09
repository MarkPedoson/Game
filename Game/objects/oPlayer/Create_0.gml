//Beginning attr of player
state = PlayerStateFree;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("Tile"));

hsp = 0; //horizontal speed
vsp = 0; //vertical speed
rolldist = 100 //dashing distance
walksp = 3; //movement speed
rollsp = 4;
hp = 3; 
flash = 0;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

