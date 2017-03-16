///user_event(object, event);

//Calls given user event on the given object.

//  object             = Object to call event on. Can be instance or object id.
//  event              = Event to be called. Predefined events go from 0-15.

//Converts arguments to locals.
var obj = argument0;
var event = argument1;

//Accesses object to call event.
with obj
{
    //Calls event.
    event_user(event);
}
