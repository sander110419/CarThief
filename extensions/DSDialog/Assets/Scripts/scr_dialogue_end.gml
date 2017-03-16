///scr_dialogue_end(tree)

//Runs the user_defined_3 event on given tree to end the dialogue system.
//Note: This destroys the tree entirely, and cleans up all objects.

//  tree            = The tree which is to be ended.

//Converts arguments to locals.
var tree = argument0;

//Runs the user_defined event.
user_event(tree, 3);
