///scr_dialogue(id, location, actor, sound, text)

//Creates a dialogue object and stores it within the current branch on tree.
//Requires that the branch have been created/found using scr_set_branch.

//  id                 = Unique value returned to controller when dialogue is played.
//  location           = Where to display actor on screen. Using MACROS "LEFT" or "RIGHT".
//  actor              = Actor object name who are speaking the dialogue.
//  sound              = Soundfile to be played during dialogue.
//  text               = Dialogue text to be displayed on screen.

//Converts arguments to locals.
var d_id = argument0;
var location = argument1;
var actor = argument2;
var sound = argument3;
var text = argument4;

//Calls script to create dialogue.
scr_dialogue_create(branch, d_id, location, actor, sound, text);
