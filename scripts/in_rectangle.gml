/// in_rectangle(x, y, xstart, ystart, width, height);
// Check if the X and Y are inside the rectangle.
// @return bool

return (argument0 > argument2 && //X > XSTART
    argument1 > argument3 && //Y > YSTART
    argument0 < argument4+argument2 && //X < WIDTH
    argument1 < argument5+argument3 //Y < HEIGHT
    )
