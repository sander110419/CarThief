///scr_dialogue_export_recursion(branch, file)

//This script is used as a recursive method in order to implement a composite pattern in
//the exportation of dialogue. This allows for far easier export of all nested branches.

// branch           = Branch to run code from.
// file             = Textfile dialogue should be exported to.

//Creates variables.
var branch = argument0;
var file = argument1;

//Runs code from branch.
with branch
{
    //Check if branch have parent.
    if object_index != obj_tree and parent = noone
    {
        //New Line for Branch.
        file_text_writeln(file);
    }
    
    //Enters a loop for each index:
    for (i=0; i < size; i++)
    {   
        //Check if index is branch.
        if list[i].object_index = obj_branch
        {
            //Runs recursive script.
            scr_dialogue_export_recursion(list[i], file);
            continue;
        }
        
        //Check if index is dialogue.
        if list[i].datatype = "Dialogue"
        {    
            //Creates tempoary actor.
            var actor = instance_create(x, y, list[i].actor);
            
            //Writes Dialogue to Textfile.
            file_text_write_string(file, actor.name + ": " +list[i].text);
            file_text_writeln(file);
            
            //Deletes Actor
            with actor
            {
                instance_destroy();
            }
        }
        
        //Check if index is choice.
        if list[i].datatype = "Choice"
        {
            //Writes Choice to Textfile.
            file_text_write_string(file, "Choice: " + list[i].text);
            file_text_writeln(file);
        }
    }
}
