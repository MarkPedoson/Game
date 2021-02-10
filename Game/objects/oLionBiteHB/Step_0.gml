sprite_index = sprHB;

if (!instance_exists(owner)) or owner.state == ENEMYSTATE.HURT or owner.state == ENEMYSTATE.DIE
{
	instance_destroy();
}
