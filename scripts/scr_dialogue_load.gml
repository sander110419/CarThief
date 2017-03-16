///scr_dialogue_load("Filename", tree)

//Loads a saved dialogue tree from file with given name. That tree is then created.
//You can use scr_dialogue_save in order to save a dialogue tree.

// "Filename"       = Name of the textfile dialogue tree will be loaded from.
// tree             = Dialogue tree which data is to loaded to.

//Creates Variables
var filename = argument0;
var tree = argument1;
var key = "0";
var ctr = self.id;

//Opens file
ini_open(filename + ".sav");

//Recursive load script.
scr_dialogue_load_recursion(tree, key, ctr);

//Closes File
ini_close();
