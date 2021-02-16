state = WEAPONSTATE.FREE;
prevstate = -1;

ownerChar = -1;
yChar = -10;

//Skills
canBasic = true;
basicCDTimer = 0;

//Scripts
weaponCharScript[WEAPONSTATE.FREE] = -1;
weaponCharScript[WEAPONSTATE.BASIC] = -1;
weaponCharScript[WEAPONSTATE.ALT] = -1;
weaponCharScript[WEAPONSTATE.LOCKED] = WeaponLocked;
