///scr_dialogue_parent_recursion(branch)

//Recursive method used within branch scripts to determine if ancestors code should be run.
//Returns a boolean true if suitable ancestor is found and run, returns false if root is reached.

// branch           = Branch to run code from.

// @Return: Boolean if ancestor have been run.

//Creates variables.
var branch = argument0;

//Runs code from branch.
with branch
{
    //Checks for parent.
    if parent != noone and parent.object_index != obj_tree
    {
        //Check for ends.
        if parent.ends
        {
            //Recursive call on parent.
            var boolean = scr_dialogue_parent_recursion(parent);
            return boolean;
        }
        else
        {
            //Starts Dialogue
            tree.branch = parent;
            user_event(tree, 6);
            //tree.alarm[0] = 1;
            return true;
        }
    }
    else
    {
        //Root is reached.
        return false;
    }
}
