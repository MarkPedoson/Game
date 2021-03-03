if (other.entityCollision){
	var push = 1;
	hsp = lengthdir_x(push,point_direction(x,y,other.x,other.y));
	vsp = lengthdir_y(push,point_direction(x,y,other.x,other.y));
	EnemyTileCollision();
}