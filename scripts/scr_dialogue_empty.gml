///scr_dialogue_empty(parent, branch)

//Checks the given branch if it's empty, and if so, updates it's variables and runs parent branch instead.
//Is used to determine if branch index is a viable index to run branch code on, or if parent should look
//for another index instead. Returns a boolean true if branch is emtpy and false if not empty.

// parent           = Branch to run if empty.
// branch           = Branch to check if empty.

// @Return: Boolean true if empty.

//Creates variables.
var parent = argument0;
var branch = argument1;

//Checks if branch is empty.
if branch.size = 0
{
    //Updates variables.
    branch.played = true;
    parent.current += 1;
    
    //Runs Parent.
    script_execute(parent.myScript, parent.id);
    
    //Returns    
    return true;
}
else
{
    //Returns
    return false;
}
