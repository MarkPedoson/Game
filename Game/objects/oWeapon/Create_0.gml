state = WEAPONSTATE.FREE;
prevstate = -1;

ownerChar = -1;
yChar = -10;
flashWeapon = 0;
flashWeaponShader = shWhitePlayer;

//Skills
var _c = oCooldown;
basicAmmo = -1;
if (_c.basicAmmoCounter) or ((_c.basicAmmoCounter == -1) and (_c.basicCDTimer != 0)) canBasic = false;
else canBasic = true;

altAmmo = -1;
if (_c.altAmmoCounter == 0) or ((_c.altAmmoCounter == -1) and (_c.altCDTimer != 0)) canAlt = false;
else canAlt = true;


//Scripts
weaponCharScript[WEAPONSTATE.FREE] = -1;
weaponCharScript[WEAPONSTATE.BASIC] = -1;
weaponCharScript[WEAPONSTATE.ALT] = -1;
weaponCharScript[WEAPONSTATE.LOCKED] = WeaponLocked;
