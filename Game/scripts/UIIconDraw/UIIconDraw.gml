// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UIIconDraw(_skillB, _icon, _iconAct, _CDTimer, _CD, _x, _y, _ammo){
	var _tf;
	if (_ammo != -1){
		draw_sprite(sSkillIconAmmoEdge, 0, _x, _y);
		_tf = true;
	}
	else {
		draw_sprite(sSkillIconEdge, 0, _x, _y);	
		_tf = false;
	}
	
	if (_skillB == false) draw_sprite(_iconAct, 0, _x, _y);
	else draw_sprite(_icon, 0, _x, _y);
	
	UICDDraw(_x, _y, _CDTimer, _CD, _tf)
		if (_tf){
			//Font
			draw_set_font(fFont);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_colour(c_white);
			draw_text_transformed(_x + 23, _y + 5, _ammo, 1, 1, 0);
		}
}