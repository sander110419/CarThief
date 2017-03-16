///scr_dialogue_check(branch)

//Sweeps through the random branch to check if every index is marked as played.
//Returns a boolean true if so, returns false if just one or more is avaliable.

//  branch             = Instance of branch to be checked.

//@Return: Boolean

//Creates variables.
var branch = argument0;
var boolean = true;

//Runs code from branch
with branch
{
    //Sweeps through every index.
    for (i=0; i<size; i++)
    {
        //Checks index.
        if list[i].played = false
        {
            boolean = false;
            break;
        }
    }
}

//Returns boolean.
return boolean;
