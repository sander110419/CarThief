///scr_dialogue_choice(branch)

//Finds next index within the branch, following the parameters of the current branch type.
//If index is a branch, runs descending branches codes instead, until a dialogue is found and played.
//When branch ends, determines if any ancestor have pending dialogue to be played or if dialogue ends.
//Refer to documentation for more information on branch behavior.

//The choice branch is a branch that contains only choices. This branch is automatically
//created when choices are stored in an index. This code runs and creates all choices on screen.
//Note: You should NOT store anything in these branches but choices, as it may cause errors.

//  branch             = The branch to run the code from.

//Converts arguments to locals.
var branch = argument0;
var i;

//Runs code from branch
with branch
{        
    //Resets globals.
    global.nbr = 0;
    global.nbr_max = 0;
    
    //Enters a loop for every choice.
    for (i=0; i<size; i++)
    {
        //Finds choice data.
        var data = list[i];
        
        //Creates all choices.
        scr_choice_object(data);
        
        //Increment global.
        global.nbr_max += 1;
    }   
    
    //Updates canskip.
    tree.canskip = false;         
}
