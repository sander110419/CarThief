///scr_dialogue_restore_default(branch)

//Recursive method used to restore the progress and played status of all indexes in the
//dialogue system to default, essentially resseting the tree. 

// branch           = Branch to run code from.

//Creates variables.
var branch = argument0;
var i;

//Runs code from branch.
with branch
{
    //Enters loop for each index.
    for (i=0; i<size; i++)
    {
        //Checks if index is branch.
        if list[i].object_index = obj_branch
        {
            //Resets nested branches.
            scr_dialogue_restore_default(list[i]);
            current = 0;
        }
    }
    
    //Check if not choice.
    if list[i].datatype != "Choice"
    {
        //Resets played.
        list[i].played = false;
    }
}
