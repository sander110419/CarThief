///scr_set_branch_type(type)

//Updates the type of the current branch by changing the associated variables.
//Note, branch should be found using scr_set_branch before setting its type.
//Refer to documentation for branch types. Using MACROS for better readibility.

//  type               = Desired new value of the branch type variable.

//Converts arguments to locals.
var type = argument0;

//Updates variables.
switch type
{
    //Sequence Branch - Default
    case B_S:
        branch.type = type;
        branch.myScript = scr_dialogue_sequence;
        branch.ends = false;
        break;
    
    //Next Branch
    case B_N:
        branch.type = type;
        branch.myScript = scr_dialogue_next;
        branch.ends = true;
        break;
    
    //Random Branch
    case B_R:
        branch.type = type;
        branch.myScript = scr_dialogue_random;
        branch.ends = true;
        break;
        
    //Random_Once Branch
    case B_RO:
        branch.type = type;
        branch.myScript = scr_dialogue_random_once;
        branch.ends = true;
        break;
        
    //Random_Nested Branch
    case B_RN:
        branch.type = type;
        branch.myScript = scr_dialogue_random_nested;
        branch.ends = true;
        break;
        
    //Choice Branch
    case B_C:
        branch.type = type;
        branch.myScript = scr_dialogue_choice;
        branch.ends = true;
        break;
        
    //Possibility for expansion of branch types here:
}
