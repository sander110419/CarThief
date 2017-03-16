///scr_dialogue_random_once(branch)

//Finds next index within the branch, following the parameters of the current branch type.
//If index is a branch, runs descending branches codes instead, until a dialogue is found and played.
//When branch ends, determines if any ancestor have pending dialogue to be played or if dialogue ends.
//Refer to documentation for more information on branch behavior.

//The random once branch chooses an index within it's list randomily and the ends.
//Once an index is choosen, it is then excluded from future random selections.
//If all indexes have been marked as played, the branch then resets all indexes.

//  branch             = The branch to run the code from.

//Converts arguments to locals.
var branch = argument0;

//Runs code from branch
with branch
{
    //Checks if index is avaliable.
    if scr_dialogue_check(id)
    {
        //Resets all indexes on branch.
        scr_dialogue_reset(id);
    }
    
    //Finds dialogue data.
    found = false;
    while !found
    {
        //Finds object.
        var data = list[irandom(size-1)];
    
        //Checks eligibility.
        if data.played = false
        {
            data.played = true;
            found = true;
            break;
        }   
    }
    
    //Checks to see if data is a branch.
    if data.object_index = obj_branch
    {
        //Validates Branch
        if !scr_dialogue_empty(id, data)
        {
            //Updates variables
            tree.branch = data;
            
            //Run that branch instead.
            script_execute(data.myScript, data);
            exit;
        }
    }
    
    //Checks to see if data is a dialogue.
    else if data.datatype = "Dialogue"
    {
        //Create dialogue.
        scr_dialogue_object(data);
        
        //Checks if auto-continue on.
        if tree.autocontinue
        {
            //Starts alarm on branch.
            alarm[0] = data.time;
        }
    }
}
