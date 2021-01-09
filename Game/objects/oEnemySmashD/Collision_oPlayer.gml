if (ds_list_find_index(damage_list, other.id) == -1) 
{
	if ((other.hp - 1) == 0)
	{
		oEnemy.state = e_state.idle
		other.hp --;	
	}
	else
	{
		other.hp --;
		other.flash = 3;
		ds_list_add(damage_list, other.id);
	}
}


