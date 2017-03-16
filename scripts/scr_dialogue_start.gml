///scr_dialogue_start(tree, [index])

//Runs the user_defined_0 event on given tree to start the dialogue system.

//  tree            = The tree which dialogue is to be started.
//  index           = Optional argument. Index of the initial branch to be run. Default at 0.

//Converts arguments to locals.
var tree = argument[0];
if argument_count = 2 { var index = argument[1]; } else { var index = 0; }

//Runs code from tree
with tree
{
    //Runs the user_defined event.
    branch = list[index];
    event_user(0);
}
