///inv_equipment_allowed(slot)

/*
    Description:    Checks if the equipment we are trying to put into
                    a slot of obj_inv_equipment is allowed
    Arguments:      
    Returns:        true if valid, false otherwise
*/

var item, item_type, slot;

item = obj_inv_mouse.slots[0].item;
if(item >= 0) {
    item_type = string_copy(item[? "key"],1,string_pos("_",item[? "key"])-1);
}
slot = argument0;
