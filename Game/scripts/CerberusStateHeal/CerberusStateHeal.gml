// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CerberusStateHeal(){
	var _c = oCooldown;
	healStep--;
	if (healStep == 0){
		_c.healCounter += enduranceHealUse;
		healStep = room_speed;
		_c.enduranceCounter -= enduranceHealUse;
		if (_c.enduranceCounter < 100) canEndurance = false;
		if (_c.healCounter == enduranceHeal){
			_c.healCounter = 0;
			_c.healTimes += 1;
			global.playerHealth += enduranceHealAmount;
			if (_c.healTimes >= enduranceHealMax){
				healStep = 0;
				_c.healCounter = 0;
				_c.healTimes = 0;
				state = PLAYERSTATE.FREE;
			}
		}
	}
	if (global.playerHealth >= global.playerHealthMax){
		healStep = 0;
		_c.healCounter = 0;
		_c.healTimes = 0;
		state = PLAYERSTATE.FREE;
	}
	if (key_heal_release){
		healStep = 0;
		_c.healCounter = 0;
		_c.healTimes = 0;
		state = PLAYERSTATE.FREE;
	}

}