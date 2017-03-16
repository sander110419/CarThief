///scr_branch_change(branch, [interupt])

//Forces a branch change on the tree, to given branch. Should be run from the controller.
//Note: Doesn't reset progress of branches, they still remember their variables, such as current.

//  branch          = Index of the branch to be changed to.
//  interupt        = Optional argument. Set to true, to avoid tree from stopping dialogue. Default false.

//Converts arguments to locals.
var branch = argument[0];
if argument_count = 2 { var interupt = argument[1]; } else { var interupt = false; }

//Runs code from tree.
with tree
{
    //Causes branch change.
    self.interupt = interupt;
    self.branch = branch;
    audio_stop_sound(speech);
    event_user(6);
    //alarm[0] = 1;
}
