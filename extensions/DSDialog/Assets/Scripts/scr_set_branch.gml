///scr_set_branch(arg0, [arg1], [arg2], ... , [arg14])

//Finds the associated branch on the given index on the dialogue tree and sets the instance variable branch to it.
//If branch cannot be found it is then created with default type 0 (Sequence Branch) and the variable then set.

//  arg0            = Index of the initial branch on the dialogue tree.
//  [arg1..14]      = Optional argument. Index of nested branches within the previous branch.

//Converts arguments to locals.
var array, i;
for (i=0; i<argument_count; i++)
{
    array[i] = argument[i];
}

//Creates variables.
var branch = tree;
var parent = noone;
var index = string(array[0]);

//Enters a loop to find the branch using a Composite Pattern.
for (i=0; i<argument_count; i++)
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
        branch.ctr = other.id;
        branch.parent = parent;
        branch.tree = other.tree;
        branch.b_id = index;
                
        //Stores branch to parent.
        list[array[i]] = 0;
        list[array[i]] = branch;
        size++;
    }
}

//Updates branch variable on controller.
self.branch = branch;
