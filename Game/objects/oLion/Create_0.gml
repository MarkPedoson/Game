// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy sprite
sprMove = sLionRun;
//sprAttack = sLionAttack;


//Enemy script
enemyScript[ENEMYSTATE.WANDER] = LionWander;
enemyScript[ENEMYSTATE.CHASE] = LionChase;
enemyScript[ENEMYSTATE.ATTACK] = LionAttack;
