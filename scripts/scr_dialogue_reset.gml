///scr_dialogue_reset(branch)

//Sweeps through the random branch to reset every index as unplayed.
//Works as recursive method if descendants is of branch type B_RN.

//  branch             = Instance of branch to be manipulated.

//Creates variables.
var branch = argument0;

//Runs code from branch.
with branch
{
    //Sweeps through every index.
    for (i=0; i<size; i++)
    {
        //Checks if index is played.
        if list[i].played
        {
            //Checks if index is B_RN branch.
            if list[i].object_index = obj_branch and list[i].type = B_RN
            {
                //Resets nested random branches.
                scr_dialogue_reset(list[i]);
            }
            
            //Resets played state.
            list[i].played = false;        
        }
    }
}
