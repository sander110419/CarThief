///inv_slot_create(x,y,panel,index)

/*
    Description:    Creates a slot instance and attaches it to a panel
    Arguments:      x,y: the position of the slot RELATIVE to the panel
                    panel: the panel the slot is attached to
                    index: index of the slot referenced in the inventory
    Returns:        the slot instance
*/

var panel = argument2;
var slot = instance_create(panel.x+argument0,panel.y+argument1,obj_inv_slot);

//init slot variables
slot.rel_x = argument0;
slot.rel_y = argument1;
slot.panel = panel;
slot.inv = panel.inv;
slot.index = argument3;

//add slot to the panel list
panel.slots[argument3] = slot;

//set the inventory item by calling slot initalization
with(slot) {event_user(slot_events.init);}

return slot;
