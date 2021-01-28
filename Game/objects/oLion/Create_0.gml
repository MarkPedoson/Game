// Inherit the parent event
event_inherited();

state = ENEMYSTATE.IDLE;

//Enemy sprite
sprMove = sLionRun;
sprIdle = sLionIdle;
sprChase = sLionChase;
sprHurt = sLionHurt;
sprD  = sLionD;
sprSleep = sLionSleep;
sprReturn = sLionReturn;
sprReturn2 = sLionReturn2;

attackSpr = sLionBite;
//sprAttack = sLionAttack;


//Enemy script
enemyScript[ENEMYSTATE.WANDER] = LionWander;
enemyScript[ENEMYSTATE.CHASE] = LionChase;
enemyScript[ENEMYSTATE.ATTACK] = LionAttack;
enemyScript[ENEMYSTATE.IDLE] = LionSleep;
enemyScript[ENEMYSTATE.RETURNING] = LionReturn;
