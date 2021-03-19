x = ownerChar.currentWeapon.x;
y = ownerChar.currentWeapon.y;
image_yscale = ownerChar.currentWeapon.image_yscale;
direction = ownerChar.currentWeapon.image_angle;
image_angle = direction;
if (!instance_exists(ownerChar)) or (ownerChar.state == PLAYERSTATE.HURT) or (ownerChar.state == PLAYERSTATE.DEAD)
{
	instance_destroy();
}