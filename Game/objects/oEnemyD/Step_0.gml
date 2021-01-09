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


y = y + vsp; //Mov