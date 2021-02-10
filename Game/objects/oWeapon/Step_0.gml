//Could use 'Begin step' to make the weapon floaty
key_basic = mouse_check_button_pressed(mb_left);


//Weapon lock
x = oPlayer.x;
y = oPlayer.y - 10;

if (!global.gamePaused) script_execute(attackState);

//Draw over player
if (instance_exists(oPlayer)) depth = oPlayer.depth - 1;
