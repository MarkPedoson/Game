 var _p = global.currentPlayer;
 var _CD = oCooldown;
//Endurance

if (_p != noone){
	var _playerEnduranceMax = _p.endurance;
	if (_playerEnduranceMax != -1){
		var _playerEndAmmo = _playerEnduranceMax div 100;
		for (var j = 1; j <= _playerEndAmmo; j++){
			var _percent;
			if (_CD.enduranceCounter div 100 >= j) _percent = 1;
			else if (_CD.enduranceCounter div 100 == j - 1){
				var _find_percent = _CD.enduranceCounter % 100;
				_percent = _find_percent / 100;
			}
			else {
				_percent = 0;
			}
			var _width = (RESOLUTION_W/2 - (_playerEndAmmo * 32) / 2) + ((j - 1) * 32);
			draw_sprite(sEnergyBar, 0, _width, RESOLUTION_H - 45);
			draw_sprite_part(_p.defaultEnergy, 0, 0, 0, sprite_get_width(_p.defaultEnergy) * _percent, sprite_get_height(_p.defaultEnergy), _width, RESOLUTION_H - 45,);
		}
	}
}

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
	draw_sprite(sHP, _imageIndex, (RESOLUTION_W/2 - ((ceil(global.playerHealthMax) * 32) / 2)) + ((i-1)*32), RESOLUTION_H - 35);
}

//Skill icons
//Left side
//Skill 1
if (_p != noone) 
{
	UIIconDraw(_p.canSkill1, _p.skill1Icon, _p.skill1IconAct, _CD.skill1CDTimer, _p.skill1CD, 132, RESOLUTION_H - 30, _CD.skill1AmmoCounter);
}
else draw_sprite(sSkillIconEdge, 0, 132, RESOLUTION_H - 30);

//Skill 2
if (_p != noone) {
	UIIconDraw(_p.canSkill2, _p.skill2Icon, _p.skill2IconAct, _CD.skill2CDTimer, _p.skill2CD, 149, RESOLUTION_H - 51, _CD.skill2AmmoCounter);
}
else draw_sprite(sSkillIconEdge, 0, 149, RESOLUTION_H - 51);

//Skill 3
if (_p != noone) {
	UIIconDraw(_p.canSkill3, _p.skill3Icon, _p.skill3IconAct, _CD.skill3CDTimer, _p.skill3CD, 164, RESOLUTION_H - 30, _CD.skill3AmmoCounter);
}
else draw_sprite(sSkillIconEdge, 0, 164, RESOLUTION_H - 30);

//Skill 4
if (_p != noone) {
	UIIconDraw(_p.canSign, _p.signIcon, _p.signIconAct, _CD.signCDTimer, _p.signCD, 181, RESOLUTION_H - 51, _CD.signAmmoCounter);
}
else draw_sprite(sSkillIconEdge, 0, 181, RESOLUTION_H - 51);

//Right side
//Alt
if (_p != noone)
{
	if (_p.currentWeapon != noone)
	{
		UIIconDraw(_p.currentWeapon.canAlt, _p.currentWeapon.altIcon, _p.currentWeapon.altIconAct, _CD.altCDTimer, _p.currentWeapon.altCD, RESOLUTION_W/2 + 149, RESOLUTION_H - 30, _CD.altAmmoCounter);
	}
	else {
		draw_sprite(sSkillIconEdge, 0, RESOLUTION_W/2 + 149, RESOLUTION_H - 30);
		draw_sprite(_p.altIcon, 0, RESOLUTION_W/2 + 149, RESOLUTION_H - 30);
	}
}else draw_sprite(sSkillIconEdge, 0, RESOLUTION_W/2 + 149, RESOLUTION_H - 30);

//Basic
if (_p != noone)
{
	if (_p.currentWeapon != noone)
	{
		UIIconDraw(_p.currentWeapon.canBasic, _p.currentWeapon.basicIcon, _p.currentWeapon.basicIconAct, _CD.basicCDTimer, _p.currentWeapon.basicCD, RESOLUTION_W/2 + 132, RESOLUTION_H - 51, _CD.basicAmmoCounter);
	}
	else {
		draw_sprite(sSkillIconEdge, 0, RESOLUTION_W/2 + 132, RESOLUTION_H - 51);
		draw_sprite(_p.basicIcon, 0, RESOLUTION_W/2 + 132, RESOLUTION_H - 51);
	}
}else draw_sprite(sSkillIconEdge, 0, RESOLUTION_W/2 + 132, RESOLUTION_H - 51);
