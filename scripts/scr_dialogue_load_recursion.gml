///scr_dialogue_load_recursion(branch, key, ctr)

//Recursive script initially called from scr_dialogue_load. Goes through currently open
//savefile, and recreates a dialogue tree from stored data.

//  branch          = Branch to run code from.
//  key             = Key section where to load data. Same as branch index.
//  ctr             = Controller containing the tree. Used to reference tree in nested recursive calls.

//Creates variables.
var branch = argument0;
var key = argument1;
var ctr = argument2;

//Runs code from branch.
with branch
{
    //Check if tree.
    if object_index = obj_tree
    {
        //Loads tree variables.
        var fake_size = ini_read_real("Tree", key + "_size", noone);
        
        //Check if noone.
        if ini_read_string("Tree", key, "") != ""
        {      
            self.branch = scr_find_branch_load( ini_read_string("Tree", key, "") , ctr );
        }
        else
        {
            self.branch = noone;
        }
    }
    else
    {        
        //Loads branch variables.
        b_id = ini_read_string("Branch", key + "_b_id", "");
        played = ini_read_real("Branch", key + "_played", noone);
        current = ini_read_real("Branch", key + "_current", noone);
        myScript = ini_read_real("Branch", key + "_myScript", noone);
        type = ini_read_real("Branch", key + "_type", noone);
        ends = ini_read_real("Branch", key + "_ends", noone);
        var fake_size = ini_read_real("Branch", key + "_size", noone);
    }
    
    //Enters a loop for each index:
    var i;
    for (i=0; i < fake_size; i++)
    {   
        //Creates variables.
        var n_key = key + string(i);
        var loadtype = ini_read_string("Branch", n_key + "_loadtype", "");
        
        //Check if index is branch.
        if loadtype = "Branch"
        {
            //Creates Branch.
            var send_branch = scr_find_branch_load( ini_read_string("Branch", n_key + "_b_id", "") , ctr );
            
            //Runs recursive script.
            scr_dialogue_load_recursion(send_branch, n_key, ctr);
            continue;
        }
        
        //Check if index is dialogue.
        if loadtype = "Dialogue"
        {                
            //Loads Variables from Savefile.
            var played = ini_read_real("Dialogue", n_key + "_played", noone);
            var d_id = ini_read_real("Dialogue", n_key + "_d_id", noone);
            var location = ini_read_real("Dialogue", n_key + "_location", noone);
            var actor = ini_read_real("Dialogue", n_key + "_actor", noone);
            var sound = ini_read_real("Dialogue", n_key + "_sound", noone);
            var text = ini_read_string("Dialogue", n_key + "_text", "");
            
            //Creates Dialogue Data.
            scr_dialogue_create_load(branch, ctr, played, d_id, location, actor, sound, text);
            continue;
        }
        
        //Check if index is choice.
        if loadtype = "Choice"
        {
            //Loads Variables from Savefile.            
            var c_id = ini_read_real("Choice", n_key + "_c_id", noone);
            var direct = ini_read_real("Choice", n_key + "_direct", noone);
            var nbr = ini_read_real("Choice", n_key + "_nbr", noone);
            var text = ini_read_string("Choice", n_key + "_text", noone);
            
            //Check if noone:
            if ini_read_string("Choice", n_key + "_next", "") != ""
            {
                var next = scr_find_branch_load( ini_read_string("Choice", n_key + "_next", "") , ctr );
            }
            else
            {
                var next = noone;
            }
            
            //Creates Choice Data.
            scr_choice_create_load(branch, ctr, nbr, text, c_id, next, direct);
        }
    }
    
    //Updates real size. Is called after to avoid oonflicts with scr_find_branch_load scripts.
    //These use the size of the array in order to determine if branch should be created.
    size = fake_size;
}
