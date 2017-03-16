///draw_setup(colour, font, halign, valign, self);

//Setups the various draw functions commonly used for drawing text in a single line of code.

//  colour             = Drawing colour to be set. Eg. c_white.
//  font               = Drawing font to be set. Eg. ft_options.
//  halign             = Drawing halign to be set. Eg. fa_left.
//  valign             = Drawing valign to be set. Eg. fa_top.
//  self               = Boolean value if self should be drawn.

//Converts arguments to locals.
var colour = argument0;
var font = argument1;
var halign = argument2;
var valign = argument3;
var self_draw = argument4;

//Checks to see if self should be drawn.
if self_draw draw_self();

//Setups drawing.
draw_set_colour(colour);
draw_set_font(font);
draw_set_halign(halign);
draw_set_valign(valign);
