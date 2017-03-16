///scr_choice_create_load(branch, ctr, nbr, text, id, next, direct)

//Creates a choice object and stores it within the arraylist on the given branch.
//Choice object is added at the end of branch, which will automatically grow in size.
//This script is called from within scr_choice create and should not be used in the controller.

//This particullar script is used within scr_dialogue_load_recursion, and takes additional argument nbr and ctr.

//  branch             = Instance of branch object to store choice to.
//  ctr                = Controller containing the tree. Used to reference tree in nested recursive calls.
//  nbr                = Number indicating position. Determines where to display choice.
//  text               = Text to be displayed for choice.
//  id                 = Unique value returned to controller when choice is choosen.
//  next               = Index of next branch choice should lead to.
//  direct             = Boolean to determine if next branch should go to choices instantly.

//Converts arguments to locals.
var branch = argument0;
var ctr = argument1;
var nbr = argument2;
var text = argument3;
var c_id = argument4;
var next = argument5;
var direct = argument6;

//Creates data object.
var data = instance_create(x, y, obj_data);

//Stores information.
with data
{
    //System Variables
    datatype = "Choice";
    tree = ctr.tree;
    self.ctr = ctr.id;
    
    //Variables
    self.text = text;
    self.c_id = c_id;
    self.next = next;
    self.direct = direct;
    self.nbr = nbr;
}

//Stores object to branch.
with branch
{
    list[size] = 0;
    list[size] = data;
    size++;
}
