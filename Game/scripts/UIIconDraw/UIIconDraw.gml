// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UIIconDraw(_skillB, _icon, _iconAct, _CDTimer, _CD, _x, _y){
	var v = 0;
	if (_skillB == false){
		draw_sprite(_iconAct, 0, _x, _y);
		if (_CDTimer != 0){
			v = ((_CDTimer / (_CD* room_speed)) * 100) / 100;
			if (v < 0) v += 1;
			draw_set_alpha(0.7);
			draw_set_colour(c_black);
			DrawRectangleCd(_x + 28, _y, _x + 2, _y + 25, v);
			draw_set_alpha(1);
			//Font
			draw_set_font(fFont);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_colour(c_white);
			draw_text_transformed(_x + 15, _y + 13, CdToSeconds(_CDTimer), 1, 1, 0);
		}
	}else draw_sprite(_icon, 0, _x, _y);
}