if (!global.gamePaused)
{
	//Bounce
	if (bounceCount != 0)
	{
		bounce += (pi * bounceSpeed);
		if (bounce * pi)
		{
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount--;
		}
		z = abs(sin(bounce)) * bounceHeight;
	}
	else z = 0;
	
	//Deteriorate
	deteriorate++;
	if (deteriorate > deteriorateAfter)
	{
		image_alpha -= 1/deteriorateTime;
		if (image_alpha <= 0) instance_destroy();
	}
	
	//Friction
	fric = 0.05;
	if (z == 0) fric = 0.10;
	
	//Move
	x += lengthdir_x(sp, direction);
	y += lengthdir_y(sp, direction);
	if (tilemap_get_at_pixel(collisionMap, x, y) > 0) sp = 0;
	sp = max(sp - fric, 0);
}