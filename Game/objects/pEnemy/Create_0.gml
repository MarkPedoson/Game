event_inherited();


//Intrinsic variables
state = ENEMYSTATE.IDLE;
hsp_frac = 0;
vsp_frac = 0;
vsp = 0;
hsp = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = 60;
wait = 0;


resetRad = 250;
teleporting = false;

wake_up = false;
fall_asleep = false;


stateTarget = state;
stateWait = 0;
stateWaitDuration = 0;

//Aggro
aggroCheck = 0;
aggroCheckDuration = 5;

//Idle
idleCheck = 0;
idleCheckDuration = 5;
deactivateTime = 0;


//Enemy scripts
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.RETURNING] = -1;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait;
enemyScript[ENEMYSTATE.STUNNED] = EnemyStun;