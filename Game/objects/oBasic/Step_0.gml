//Draw coordination based on weapon

x = oPlayer.x;
y = oPlayer.y - 12;


counter ++;
//Mouse angle
x = x - lengthdir_x(-16, oBasic.direction);
y = y - lengthdir_y(-16, oBasic.direction);
show_debug_message(string(counter));

//duration = max(0, duration - d_speed);
//var _totalFrames = sprite_get_number(slashSprite);  //How many frames is the roll
//image_index = min(((1 - (duration / duration)) * _totalFrames), _totalFrames - 1);
image_speed = 0.05;

