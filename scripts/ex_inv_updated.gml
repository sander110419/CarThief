///ex_inv_updated(inv,affected_slots)

/*
    Description:    This script gets called when an inventory changes.
                    e.g: an item is added / removed, an amount changes etc.
    Arguments:      inv: the affected inventory
                    affected_slots: ds_list of affected slot indexes
*/

var inventory = argument0;
var affected_slots = argument1;

//look through all panels and get the ones referencing the changed inventory
with(obj_inv_panel) {
    if(inv == inventory) {
        
        //update the changed slots
        for(var i=0;i<ds_list_size(affected_slots); i++) {
            var slot_index = affected_slots[| i];
            var slot = slots[slot_index];
            with(slot) {event_user(slot_events.init);}
        }
        
        //fire inventory changed event on the panel
        if(inv_changed_event_enabled()) {
            event_user(panel_events.inventory_changed);
        }
        
    }
}
