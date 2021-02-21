if (other.entityHitScript != -1) and (other.invFrame == false)
{
	EntityHitScript(other, ownerChar.currentWeapon.altDMG, id, ownerChar);
	instance_destroy();
}