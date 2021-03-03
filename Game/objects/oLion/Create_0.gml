// Inherit the parent event
event_inherited();
collX = 13;
collY = 12;

state = ENEMYSTATE.IDLE;

//Enemy sprite
sprMove = sLionRun;
sprIdle = sLionIdle;
sprChase = sLionChase;
sprHurt = sLionHurt;
sprD  = sLionD;
sprSleep = sLionSleep;
sprWake = sLionSleepDrop2;
sprFall = sLionSleepDrop;
sprReturn = sLionReturn;
sprReturn2 = sLionReturn2;
sprAttack = sLionAttack;


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
