if (!instance_exists(ownerChar)) or (ownerChar.state == PLAYERSTATE.HURT) or (ownerChar.state == PLAYERSTATE.DEAD)
{
	instance_destroy();
}