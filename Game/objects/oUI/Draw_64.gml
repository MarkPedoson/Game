//HP
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);
_playerHealth -= _playerHealthFrac;

for (var i = 1; i <= _playerHealthMax; i++)
{
	var _const = -1;
	if (i == 1) _const = 0;
	else if (i == _playerHealthMax) _const = 2;
	else _const = 1;
	var _imageIndex = (i > _playerHealth) * 3 + _const; //Magic nr cuz of the hp panel layout
	if (i == _playerHealth + 1)
	{
		_imageIndex += (_playerHealthFrac == 0.5) * 3;
	}
	draw_sprite(sHP, _imageIndex, (RESOLUTION_W/2 - ((ceil(global.playerHealthMax) * 32) / 2)) + ((i-1)*32), RESOLUTION_H - 50);
}

//Skill icons
var p = 1;
var v = 0;
//Left side
//Skill 1
draw_sprite(sSkillIconEdge, 0, 132, RESOLUTION_H - 40);
draw_sprite(oPlayer.skill1Icon, 0, 132, RESOLUTION_H - 40);

//Skill 2
draw_sprite(sSkillIconEdge, 0, 149, RESOLUTION_H - 61);
draw_sprite(oPlayer.skill2Icon, 0, 149, RESOLUTION_H - 61);

//Skill 3
draw_sprite(sSkillIconEdge, 0, 164, RESOLUTION_H - 40);
draw_sprite(oPlayer.skill3Icon, 0, 164, RESOLUTION_H - 40);

//Skill 4
draw_sprite(sSkillIconEdge, 0, 181, RESOLUTION_H - 61);
draw_sprite(oPlayer.signIcon, 0, 181, RESOLUTION_H - 61);

//Right side
//Alt
draw_sprite(sSkillIconEdge, 0, RESOLUTION_W/2 + 149, RESOLUTION_H - 40);
draw_sprite(oPlayer.altIcon, 0, RESOLUTION_W/2 + 149, RESOLUTION_H - 40);

//Basic
draw_sprite(sSkillIconEdge, 0, RESOLUTION_W/2 + 132, RESOLUTION_H - 61);

if (oPlayer.currentWeapon != noone)
{
	if (oPlayer.currentWeapon.canBasic == false){
		draw_sprite(oPlayer.basicIconAct, 0, RESOLUTION_W/2 + 132, RESOLUTION_H - 61);
		if (oPlayer.currentWeapon.basicCDTimer != 0){
			v = ((oPlayer.currentWeapon.basicCDTimer / (oPlayer.currentWeapon.basicCD * room_speed)) * 100) / 100;
			if (v < 0) v += 1;
			draw_set_alpha(0.7);
			draw_set_colour(c_black);
			DrawRectangleCd(RESOLUTION_W/2 + 160, RESOLUTION_H - 61, RESOLUTION_W/2 + 134, RESOLUTION_H - 36, v);
			draw_set_alpha(1);
			//Font
			draw_set_font(fFont);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_colour(c_white);
			draw_text_transformed(RESOLUTION_W/2 + 147, RESOLUTION_H - 48, CdToSeconds(oPlayer.currentWeapon.basicCDTimer), 1, 1, 0);
		}
	}else draw_sprite(oPlayer.basicIcon, 0, RESOLUTION_W/2 + 132, RESOLUTION_H - 61);
}else draw_sprite(oPlayer.basicIcon, 0, RESOLUTION_W/2 + 132, RESOLUTION_H - 61);
