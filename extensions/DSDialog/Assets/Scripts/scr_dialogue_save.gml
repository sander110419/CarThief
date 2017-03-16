///scr_dialogue_save("Filename", tree)

//Save the dialogue tree with all its nested branches and dialogue, to a savefile with 
//given filename. This can then be loaded later using scr_dialogue_load to recreate the tree.

// "Filename"       = Name of the textfile dialogue tree will be saved to.
// tree             = Dialogue tree which is to be stored in a savefile.

//Creates Variables
var filename = argument0;
var tree = argument1;
var key = "0";

//Opens file
ini_open(filename + ".sav");

//Recursive save script.
scr_dialogue_save_recursion(tree, key);

//Closes File
ini_close();
