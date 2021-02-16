if (!instance_exists(ownerChar)) or (ownerChar.state == PlayerStateHurt) or (ownerChar.state == PlayerStateDead)
{
	instance_destroy();
}