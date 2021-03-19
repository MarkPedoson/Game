/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collX = 8;
collY = 8;

state = ENEMYSTATE.IDLE;

//Enemy sprite
sprMove = sCerberusIdle;
sprIdle = sCerberusIdle;
sprChase = sCerberusIdle;
sprHurt = sCerberusIdle;
sprD  = sCerberusIdle;
sprSleep = sCerberusIdle;
sprWake = sCerberusIdle;
sprFall = sCerberusIdle;
sprReturn = sCerberusIdle;
sprReturn2 = sCerberusIdle;
sprAttack = sCerberusIdle;


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