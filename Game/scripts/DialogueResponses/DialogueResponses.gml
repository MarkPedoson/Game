// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DialogueResponses(responses){
	_responses = responses;
	switch(_responses)
	{
		case 0: break;
		case 1: NewTextBox("You gave response A", 1, [-1]); break;
		case 2: NewTextBox("You gave response B. More?", 1, ["3:Yes!", "0:No"]); break;
		case 3: NewTextBox("Ok boomer", 1, [-1]); break;
		default: show_debug_message("This shouldnt happen!"); break;
	}
	
}