//Draw textbox
NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);
draw_set_font(fFont);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(textMessage, 1, textProgress);

if ((arrayResponses[0] != -1) and (textProgress >= string_length(textMessage)))
{
		for (var i = 0; i < array_length_1d(arrayResponses); i++)
		{
			_print += "\n";
			if (i == responseSelected) _print += "> ";
			_print += arrayResponses[i];
			if (i == responseSelected) _print += " <";
		}
}

draw_text(textX, textY, _print);  //Draws text shadow
draw_set_color(c_white);
draw_text(textX, textY - 1, _print);  //Text itself
