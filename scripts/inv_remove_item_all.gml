///inv_remove_item_all(itemid)

//Removes all of an item from your inventory.

var ii = 1
while (ii <= obj_inventory.total_slots) {
    if obj_inventory.inv[ii]=argument0 {obj_inventory.inv[ii]=0}
    ii++
}
