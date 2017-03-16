/// Initialize our itemlist
/// itemlist_Init(array items, int x, int y, int width, int height, int item_height);

//Put items in a local variable (The __'s are there for accidental overwriting-protection)
__items = argument0
//Count all the items
__itemcount = array_length_1d(argument0);

__x = argument1;
__y = argument2;
__width = argument3;
__height = argument4;

//Other variables
__surface = -1;
__dragy = 0;
__mouse_yprevious = 0;
__sidebar_alpha = 0;
__offset = 0;
__maxmin = 0;
___selected = 1;

//Settable variables
__title = '';
__itemheight = 32;
__autoselect = true; //Select based on scroll position

//No setters yet, but useable:
__itemfont = fnt_list_item;
__itemcolor = c_black;
__itemalign = 'center'; 

__titlealign = 'left'; //left or center (STRING!)
__titlefont = fnt_list_item;
__titlecolor = c_red;

__paddingtop = 16;
__paddingleft = 16;

__dragslowdown = 0.85;

//Calculated values:
itemlist_CalculateListHeight();
