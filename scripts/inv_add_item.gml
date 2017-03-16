///inv_add_item(itemid,number of items)

//Adds items to your inventory.

var ii = 1
var items = argument1
while (ii <= obj_inventory.total_slots) and items > 0 {
    if obj_inventory.inv[ii]=0 {obj_inventory.inv[ii]=argument0 items-=1}
    ii++
}
