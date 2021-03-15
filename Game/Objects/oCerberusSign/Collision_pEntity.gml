if (other.entityHitScript != -1) and (other.invFrame == false)
{
	EntityHitScript(other, ownerChar.signDMG, id, ownerChar, stun, stunDura);
	
	instance_destroy();
}