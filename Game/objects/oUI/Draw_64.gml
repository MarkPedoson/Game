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
	UIIconDraw(oPlayer.currentWeapon.canBasic, oPlayer.basicIcon, oPlayer.basicIconAct, oPlayer.currentWeapon.basicCDTimer, oPlayer.currentWeapon.basicCD, RESOLUTION_W/2 + 132, RESOLUTION_H - 61);
}else draw_sprite(oPlayer.basicIcon, 0, RESOLUTION_W/2 + 132, RESOLUTION_H - 61);
