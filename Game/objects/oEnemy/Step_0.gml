//Simple enemy AI
switch (state)
{
	case e_state.idle:
	{
		hsp = 0;
		vsp = 0;
		if (distance_to_object(oPlayer) <= 100) state = e_state.chase;
	}
	break;
	case e_state.chase:
	{
		dir_x = sign(oPlayer.x - x);
		dir_y = sign(oPlayer.y - y);
		hsp = dir_x * 2;
		vsp = dir_y * 2;
		if (distance_to_object(oPlayer) > 300) state = e_state.idle;
		if (distance_to_object(oPlayer) <= 30) state = e_state.attack;
	}
	break;
	case e_state.attack:
	{
		
		hsp = 0;
		vsp = 0;
		//Animate the attack
		//sprite_index = sEnemySmash
		//Attack logic
		//if (image_index >=10) and (image_index <= 20)
		attackdelay = attackdelay -1; //So that you couldn't spam attack
		if (attackdelay < 0)
		{
			attackdelay = 50;
			with (instance_create_layer(x,y,"Enemy_smash", oEnemySmashD)) 
			{
				
				x = oPlayer.x;
				y = oPlayer.y;
				draw_sprite(sEnemySmash, 0, x, y)
			}
		}
		if (distance_to_object(oPlayer) > 30) state = e_state.chase;
	}
	break;
}
//Horizontal collision
if (place_meeting(x+hsp,y,oWall)) //Checks if they meet
{
	while (!place_meeting(x+sign(hsp),y,oWall)) //sign gives me -1 or 1
	{
		x = x + sign(hsp);
	}
	hsp = 0;	//Sets mov0ement to 0 so you wouldn't move
}


x = x + hsp; //Moves me in x coord depending on my input

//Vertical collision
if (place_meeting(x,y+vsp,oWall)) //Checks if they meet
{
	while (!place_meeting(x,y+sign(vsp),oWall)) //sign gives me -1 or 1
	{
		y = y + sign(vsp);
	}
	vsp = 0;	//Sets movement to 0 so you wouldn't move
}


y = y + vsp; //Moves me in y coord depending on my input
