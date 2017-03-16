///scr_find_branch_load(b_id, ctr)

//Finds the associated branch on the given index on the dialogue tree and returns it.
//If branch cannot be found it is then created with default type 0 (Sequence Branch) and then returned.
//This script is useful for finding the next branch a choice should goto, without changing current branch.
//Refer to ctr_dialogue_example for an example of how this could be done.

//This particullar script is used within scr_dialogue_load_recursion, and takes an b_id to create an array
//instead of the normal scr_find_branch, which takes a variable number of arguments.

//  b_id            = String b_id of branch, indiciating array indexes of ancestor branches.
//  ctr             = Controller containing the tree. Used to reference tree in nested recursive calls.

// @Return: Instance of obj_branch.

//Creates array from argument.
var b_id = argument0;
var count = string_length(b_id);
var array, i;
for (i=0; i<count; i++)
{
    array[i] = real(string_char_at(b_id, i+1));
}

//Creates variables.
var ctr = argument1;
var branch = ctr.tree;
var parent = noone;
var index = string(array[0]);

//Enters a loop to find the branch using a Composite Pattern.
for (i=0; i<count; i++)
{
    //Runs code from tree/branch.
    with branch
    {
        //Checks if index is within bounds.
        if size > array[i]
        {
            //Checks if branch exists.
            if list[array[i]].object_index = obj_branch
            {
                //Updates Branch.
                branch = list[array[i]];
                index += string(i);
                parent = branch;
                continue;
            }
        }
        
        //Creates branch.
        branch = instance_create(x, y, obj_branch);
        branch.ctr = ctr;
        branch.parent = parent;
        branch.tree = ctr.tree;
        branch.b_id = index;
        
        //Stores branch to parent.
        list[array[i]] = 0;
        list[array[i]] = branch;
        size++;
    }
}

//Returns branch.
return branch;
