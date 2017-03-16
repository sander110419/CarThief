///inv_remove_item(itemid)

//Removes one of an item from your inventory.

var ii = 1
var removed = false
while (ii <= obj_inventory.total_slots) and (removed = false) {
    if obj_inventory.inv[ii]=argument0 {obj_inventory.inv[ii]=0 removed=true}
    ii++
}
