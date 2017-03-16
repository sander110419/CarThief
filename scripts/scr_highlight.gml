///scr_highlight(colouron, colouroff);

//Changes the draw colour depending on mouseover. Used in this example to highlight choices during mouseover.

//  colouron             = Colour of mouseover.
//  colouroff            = Colour of non-mouseover.

//Converts arguments to locals.
var colouron = argument0;
var colouroff = argument1;

//Highlight on mouseover.
if position_meeting(mouse_x,mouse_y,self)
{
    draw_set_colour(colouron);
}
else
{
    draw_set_colour(colouroff);
}

