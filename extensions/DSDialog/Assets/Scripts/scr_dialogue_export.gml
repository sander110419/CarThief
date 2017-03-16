///scr_dialogue_export("Filename")

//Exports all dialogue in the tree, to a readable textfile for easier sharing of dialogue.
//This is useful for example, to easily export voice actor scripts. Should be used after all 
//dialogue have been created. Note: script must be executed ingame in order to export.

// "Filename"       = Name of the textfile scripts will be exported to.

//Creates Variables
var filename = argument0;
global.file = file_text_open_write(filename + ".txt");
var branch = tree;

//Recursive export script.
scr_dialogue_export_recursion(branch, global.file);

//Closes File
file_text_close(global.file);
