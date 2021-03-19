// Inherit the parent event
event_inherited();
collX = 31;
collY = 31;

state = ENEMYSTATE.IDLE;

//Enemy sprite
sprMove = sManticoreIdle;
sprIdle = sManticoreIdle;
sprChase = sManticoreIdle;
sprHurt = sManticoreIdle;
sprD  = sManticoreIdle;
sprSleep = sManticoreIdle;
sprWake = sManticoreIdle;
sprFall = sManticoreIdle;
sprReturn = sManticoreIdle;
sprReturn2 = sManticoreIdle;
sprAttack = sManticoreIdle;


attackX = 8 //x24
attackY = -10 //y12



//Enemy script
enemyScript[ENEMYSTATE.WANDER] = LionWander;
enemyScript[ENEMYSTATE.CHASE] = LionChase;
enemyScript[ENEMYSTATE.ATTACK] = LionAttack;
enemyScript[ENEMYSTATE.IDLE] = LionSleep;
enemyScript[ENEMYSTATE.RETURNING] = LionReturn;
enemyScript[ENEMYSTATE.HURT] = LionHurt;
enemyScript[ENEMYSTATE.DIE] = LionD;
enemyScript[ENEMYSTATE.STUNNED] = LionStun;
