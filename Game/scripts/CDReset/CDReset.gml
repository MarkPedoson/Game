// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CDReset(_weaponOnly){
	var _c = oCooldown;
	if (_weaponOnly){
		_c.basicCDTimer = 0;
		_c.basicAmmoCounter = -1;
		_c.altCDTimer = 0;
		_c.altAmmoCounter = -1;
	}
	else {
		_c.basicCDTimer = 0;
		_c.basicAmmoCounter = -1;
		_c.altCDTimer = 0;
		_c.altAmmoCounter = -1;
		_c.signCDTimer = 0;
		_c.signAmmoCounter = -1;
		_c.skill1CDTimer = 0;
		_c.skill1AmmoCounter = -1;
		_c.skill2CDTimer = 0;
		_c.skill2AmmoCounter = -1;
		_c.skill3CDTimer = 0;
		_c.skill3AmmoCounter = -1
		_c.enduranceCounter = -1;	
		_c.enduranceCDTimer = 0;	
	}
}