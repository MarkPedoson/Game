//Beginning attr of player
state = PlayerStateFree;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("Tile"));

hsp = 0; //horizontal speed
vsp = 0; //vertical speed
rolldist = 100 //dashing distance
walksp = 2.5; //movement speed
rollsp = 4; //how fast the space skill is
hp = 3; //health
flash = 0; //Getting damager
rollheight = 24; //roll  height
z = 0; //setting z value


spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

