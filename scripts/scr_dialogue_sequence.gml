///scr_dialogue_sequence(branch)

//Finds next index within the branch, following the parameters of the current branch type.
//If index is a branch, runs descending branches codes instead, until a dialogue is found and played.
//When branch ends, determines if any ancestor have pending dialogue to be played or if dialogue ends.
//Refer to documentation for more information on branch behavior.

//The sequence branch keeps playing stored indexes until branch ends.

//  branch             = The branch to run the code from.

//Converts arguments to locals.
var branch = argument0;

//Runs code from branch
with branch
{           
    //Checks to see if within bounds
    if current < size
    {    
        //Finds dialogue data.
        var data = list[current];
        
        //Checks to see if data is a branch.
        if data.object_index = obj_branch
        {
            //Validates Branch
            if !scr_dialogue_empty(id, data)
            {
                //Updates variables
                tree.branch = data;
                if current = size - 1
                {
                    current = 0;
                }
                else
                {
                    current += 1;
                }
                
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
            
            //Check if autocontinue is on.
            if tree.autocontinue 
            {
                //Starts alarm on tree.
                tree.alarm[0] = data.time;
            }
            
            //Updates branch.
            current += 1;
        }
    }
    
    //Out of Bounds - Branch Have Ended
    else
    {
        //Recursive script to determine if ancestors is run.
        if !scr_dialogue_parent_recursion(self.id)
        {
            //Runs user event on controller.
            user_event(ctr, 0);
            
            //Runs stop event on tree.
            user_event(tree, 1);
        }
        
        //Resets current.
        current = 0;
    }    
}
