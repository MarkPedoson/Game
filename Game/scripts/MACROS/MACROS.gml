#macro FRAME_RATE 60
#macro TILE_SIZE 32
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START rStartArena
#macro RESOLUTION_W 640
#macro RESOLUTION_H 360

#macro	TRANSITION_SPEED 0.02
#macro	IN 1
#macro	OUT 0

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT,
	RETURNING
}