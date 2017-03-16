///scr_dialogue_next(branch)

//Finds next index within the branch, following the parameters of the current branch type.
//If index is a branch, runs descending branches codes instead, until a dialogue is found and played.
//When branch ends, determines if any ancestor have pending dialogue to be played or if dialogue ends.
//Refer to documentation for more information on branch behavior.

//The next branch plays the next sequential index then branch ends. Remembers position for next call.

//  branch             = The branch to run the code from.

//Converts arguments to locals.
var branch = argument0;

//Runs code from branch
with branch
{
    //Checks to see if limit reached.
    if current >= size
    {
        //Enters a loop for each index.
        for (var i=0; i<size; i++)
        {
            //Check if index is random_nested.
            if list[i].object_index = obj_branch and list[i].type = B_RN
            {
                //Resets random_nested branches.
                scr_dialogue_reset(list[i]);
            }
        }
        
        //Resets current to initial index.
        current = 0;
    }
    
    //Finds dialogue data.
    var data = list[current];
    
    //Checks to see if data is a branch.
    if data.object_index = obj_branch
    {        
        //Validates Branch
        if !scr_dialogue_empty(id, data)
        {
            //Check if branch is type B_RN
            if data.type = B_RN
            {
                //Check if every index is played.
                if scr_dialogue_check(data)
                {
                    //Updates current.
                    current += 1;
                    
                    //Runs branch again.
                    script_execute(myScript, id);
                    exit;
                }
                else
                {
                    //Updates variables
                    tree.branch = data;
                    
                    //Runs branch again.
                    script_execute(data.myScript, data);
                    exit;
                }
            }
            
            //Updates variables
            tree.branch = data;
            current += 1;
            
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
        
        //Updates branch.
        current += 1;
    }
}
