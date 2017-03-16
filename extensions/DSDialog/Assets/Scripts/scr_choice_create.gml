///scr_choice_create(branch, text, id, next, direct)

//Creates a choice object and stores it within the arraylist on the given branch.
//Choice object is added at the end of branch, which will automatically grow in size.
//This script is called from within scr_choice create and should not be used in the controller.

//  branch             = Instance of branch object to store choice to.
//  text               = Text to be displayed for choice.
//  id                 = Unique value returned to controller when choice is choosen.
//  next               = Index of next branch choice should lead to.
//  direct             = Boolean to determine if next branch should go to choices instantly.

//Converts arguments to locals.
var branch = argument0;
var text = argument1;
var c_id = argument2;
var next = argument3;
var direct = argument4;

//Creates data object.
var data = instance_create(x, y, obj_data);

//Stores information.
with data
{
    //System Variables
    datatype = "Choice";
    tree = other.tree;
    ctr = other.id;
    
    //Variables
    self.text = text;
    self.c_id = c_id;
    self.next = next;
    self.direct = direct;
    nbr = branch.size;
}

//Stores object to branch.
with branch
{
    list[size] = 0;
    list[size] = data;
    size++;
}
