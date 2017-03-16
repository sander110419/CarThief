///scr_choice_object(data)

//Create choice object and sends over information so that it may be displayed on screen.

//  data          = Data object containing all choice data.

//Creates variables.
var data = argument0;
var diabox = tree.diabox;
var xx = diabox.x + 25;
var yy = diabox.y + 20 + (40 * data.nbr);

//Creates choice object.
var choice = instance_create(xx, yy, obj_choice);

//Sends over information.
with choice
{
    self.diabox = diabox;
    tree = data.tree;
    ctr = data.ctr;
    text = data.text;
    c_id = data.c_id;
    next = data.next;
    direct = data.direct;
    nbr = data.nbr;
}

//Stores choice to tree.
with tree
{
    choices[data.nbr] = choice;    
}
