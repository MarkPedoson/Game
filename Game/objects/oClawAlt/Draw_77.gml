/// @description Destroy when hitting a wall
if (tilemap_get_at_pixel(ownerChar.obstructionMap, x, y)) instance_destroy();
