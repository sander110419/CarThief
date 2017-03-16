///scr_dialogue_create_load(branch, ctr, played, id, location, actor, sound, text)

//Creates a dialogue object and stores it within the arraylist on the given branch.
//Dialogue object is added at the end of branch, which will automatically grow in size.
//This script is called from within scr_dialogue and should not be used in the controller.

//This particullar script is used within scr_dialogue_load_recursion, and takes additional argument played and fake_size.

//  branch             = Instance of branch object to store dialogue to.
//  ctr                = Controller containing the tree. Used to reference tree in nested recursive calls.
//  played             = Boolean indicating weather dialogue have been played.
//  id                 = Unique value returned to controller when dialogue is played.
//  location           = Where to display actor on screen. Using MACROS "LEFT" and "RIGHT".
//  actor              = Actor object name who are speaking the dialogue.
//  sound              = Soundfile to be played during dialogue.
//  text               = Dialogue text to be displayed on screen.

//Converts arguments to locals.
var branch = argument0;
var ctr = argument1;
var played = argument2;
var d_id = argument3;
var location = argument4;
var actor = argument5;
var sound = argument6;
var text = argument7;

//Creates data object.
var data = instance_create(x, y, obj_data);

//Stores information.
with data
{
    //System Variables
    datatype = "Dialogue";
    self.ctr = ctr.id;
    
    //User Variables
    self.played = played;
    self.d_id = d_id;
    self.location = location;
    self.actor = actor;
    self.sound = sound;
    self.text = text;
    
    //Constants - Can be customized. GUI Variables.
    font = ft_arial_18;
    font_size = font_get_size(font);
    text_length = string_length(text);
    maxlength = 950;
    spd = 1.25;
    
    //Determines time it takes to play dialogue.
    if sound = noone
    {
        //Calculates time based on string.
        time = (string_length(text) * (room_speed / 12)) + 50;
    }
    else
    {
        //Calculates time based on soundfile.
        var sec = audio_sound_length(sound);
        time = sec * room_speed + 50;
    }
}

//Stores object to branch.
with branch
{
    list[size] = 0;
    list[size] = data;
    size++;
}
