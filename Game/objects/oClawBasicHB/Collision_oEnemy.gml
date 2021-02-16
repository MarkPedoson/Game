if (ds_list_find_index(damage_list, other.id) == -1) 
{
    other.hp --;
	other.flash = 3;
    ds_list_add(damage_list, other.id);
}




