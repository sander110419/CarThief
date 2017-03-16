///scr_dialogue_stop(tree)

//Runs the user_defined_1 event on given tree to stop the dialogue system.
//Note: This only stops it, the tree still remains open and remembers progress.

//  tree            = The tree which dialogue is to be stopped.

//Converts arguments to locals.
var tree = argument0;

//Runs the user_defined event.
user_event(tree, 1);
