///scr_dialogue_create(branch, id, location, actor, sound, text)

//Creates a dialogue object and stores it within the arraylist on the given branch.
//Dialogue object is added at the end of branch, which will automatically grow in size.
//This script is called from within scr_dialogue and should not be used in the controller.

//  branch             = Instance of branch object to store dialogue to.
//  id                 = Unique value returned to controller when dialogue is played.
//  location           = Where to display actor on screen. Using MACROS "LEFT" and "RIGHT".
//  actor              = Actor object name who are speaking the dialogue.
//  sound              = Soundfile to be played during dialogue.
//  text               = Dialogue text to be displayed on screen.

//Converts arguments to locals.
var branch = argument0;
var d_id = argument1;
var location = argument2;
var actor = argument3;
var sound = argument4;
var text = argument5;

//Creates data object.
var data = instance_create(x, y, obj_data);

//Stores information.
with data
{
    //System Variables
    datatype = "Dialogue";
    ctr = other.id;
    played = false;
    
    //User Variables
    self.d_id = d_id;
    self.location = location;
    self.actor = actor;
    self.sound = sound;
    self.text = text;
    
    //Constants - Can be customized. GUI Variables.
    font = dsdia.line_font;
    font_size = font_get_size(font);
    text_length = string_length(text);
    maxlength = dsdia.line_max_length;
    spd = dsdia.line_speed_letter;
    
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
