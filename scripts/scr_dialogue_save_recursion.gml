///scr_dialogue_save_recursion(branch, key)

//Recursive script initially called from scr_dialogue_save. Goes through and stores the
//dialgue system in the currently open savefile.

// branch           = Branch to run code from.
// key              = Key section where to write data. Same as branch index.

//Creates variables.
var branch = argument0;
var key = argument1;

//Runs code from branch.
with branch
{
    //Check if tree.
    if object_index = obj_tree
    {
        //Saves tree variables.
        ini_write_real("Tree", key + "_size", size);
        
        //Check if noone.
        if self.branch != noone
        {
            ini_write_string("Tree", key + "_branch", self.branch.b_id);
        }
        else
        {
            ini_write_string("Tree", key + "_branch", "");
        }
    }
    else
    {
        //Saves branch variables.
        ini_write_string("Branch", key + "_b_id", b_id);
        ini_write_real("Branch", key + "_played", played);
        ini_write_real("Branch", key + "_current", current);
        ini_write_real("Branch", key + "_myScript", myScript);
        ini_write_real("Branch", key + "_type", type);
        ini_write_real("Branch", key + "_ends", ends);
        ini_write_real("Branch", key + "_size", size);
    }
    
    //Enters a loop for each index:
    var i;
    for (i=0; i < size; i++)
    {   
        //Updates Key.
        var n_key = key + string(i);
        
        //Check if index is branch.
        if list[i].object_index = obj_branch
        {
            //Saves type for index.
            ini_write_string("Branch", n_key + "_loadtype", "Branch");
            
            //Runs recursive script.
            scr_dialogue_save_recursion(list[i], n_key);
            continue;
        }
        
        //Check if index is dialogue.
        if list[i].datatype = "Dialogue"
        {    
            //Saves type for index.
            ini_write_string("Branch", n_key + "_loadtype", "Dialogue");
            
            //Write Dialogue to Savefile.
            ini_write_real("Dialogue", n_key + "_played", list[i].played);
            ini_write_real("Dialogue", n_key + "_d_id", list[i].d_id);
            ini_write_real("Dialogue", n_key + "_location", list[i].location);
            ini_write_real("Dialogue", n_key + "_actor", list[i].actor);
            ini_write_real("Dialogue", n_key + "_sound", list[i].sound);
            ini_write_string("Dialogue", n_key + "_text", list[i].text);
            continue;
        }
        
        //Check if index is choice.
        if list[i].datatype = "Choice"
        {
            //Saves type for index.
            ini_write_string("Branch", n_key + "_loadtype", "Choice");
            
            //Writes Choice to Savefile.           
            ini_write_real("Choice", n_key + "_c_id", list[i].c_id);
            ini_write_real("Choice", n_key + "_direct", list[i].direct);
            ini_write_real("Choice", n_key + "_nbr", list[i].nbr);
            ini_write_string("Choice", n_key + "_text", list[i].text);
            
            //Check if noone:
            if list[i].next != noone
            {
                ini_write_string("Choice", n_key + "_next", list[i].next.b_id);
            }
            else
            {
                ini_write_string("Choice", n_key + "_next", "");
            }
        }
    }
}
