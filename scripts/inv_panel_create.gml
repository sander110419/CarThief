///inv_panel_create(inv,panel_obj,x,y)
/*
    Description:    Creates a panel_obj instance at position x,y, associated to inv
    Arguments:      inv: associated inventory
                    panel_obj: object to instantiate (child of obj_inv_panel)
                    x,y: where to instantiate the panel
    Returns:        the panel instance
*/

var panel = instance_create(argument2, argument3,argument1);

with(panel) {
    inv = argument0; //assign the inventory to the panel
    slots[inv[? "max_size"]-1] = -1; //init slots array
    event_user(panel_events.init); //call panel specific create event
    event_user(panel_events.inventory_changed); //fire inventory changed event
}
 
return panel;
