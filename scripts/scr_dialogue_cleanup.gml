///scr_dialogue_cleanup(branch)

//Destroys all dialogue and branch objects in order to avoid leaks.
//Is called upon destruction of the tree when dialogue ends.

//  branch          = An instance of the object branch to run cleanup on.

//Creates variables.
var branch = argument0;
var i;

//Runs code from branch.
with branch
{
    //Enters a loop for each branch.
    for (i=0; i<size; i++)
    {
        //Creates variables.
        var obj = list[i];
        
        //Checks if nested branch.
        if obj.object_index = obj_branch
        {
            scr_dialogue_cleanup(obj);
        }
        
        //Deletes object.
        with obj
        {
            instance_destroy();
        }   
    }
}
