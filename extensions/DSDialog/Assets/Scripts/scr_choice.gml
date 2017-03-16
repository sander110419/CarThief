///scr_choice(text, id, [next], [direct])

//Create a choice object at the current index. Automatically creates a branch of type B_C to store up to 4
//choices at that index. Once that index is run, the choice branch code is then run, which creates all choices.
//Note: You should NOT create more then 4 choices in a row, as this may cause errors. 4 is number choosen for GUI reasons.
//If you want more choices, have choices that lead to seperate choice branches and connect them in order to 
//navigate around. Example of how this can be implemented can be seen in the ctr_dialogue_example object.

//  text               = Text to be displayed for choice.
//  id                 = Unique value returned to controller when choice is choosen.
//  [next]             = Optional argument. Index of next branch choice should lead to.
//  [direct]           = Optional argument. Boolean to determine if next branch should go to choices instantly. Default false.

//Converts arguments to locals.
var text = argument[0];
var c_id = argument[1];
if argument_count >= 3 and argument_count <= 4 { var next = argument[2]; } else { var next = noone; }
if argument_count = 4 { var direct = argument[3]; } else { var direct = false; }

//Checks if current branch is choice branch.
if branch.type != B_C
{
    //Runs code from branch.
    with branch
    {    
        //Check if last index was choice branch.
        //Note: Avoid having two nested choice branches with same parent in a row. May cause errors.
        if size != 0 and list[size-1].object_index = obj_branch and list[size-1].type = B_C
        {
            //Sets choice branch to existing.
            var c_branch = list[size-1];
        }
        else
        {
            //Create the choice branch.
            var c_branch = instance_create(x, y, obj_branch);
            c_branch.type = B_C;
            c_branch.myScript = scr_dialogue_choice;
            c_branch.ends = true;
            c_branch.tree = other.tree;
            c_branch.b_id = b_id + string(size);
            
            //Stores choice branch in branch.
            list[size] = 0;
            list[size] = c_branch;
            size++;
        }
    }
}
else
{
    //Sets c_branch to branch.
    var c_branch = branch;
}

//Calls script to create choice data.
scr_choice_create(c_branch, text, c_id, next, direct);
