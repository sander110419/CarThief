///inv_add_or_drop(itemid,number of items)

//Adds items to your inventory. If your inventory is full it places them on the ground.

var ii = 1
var items = argument1
while (ii <= obj_inventory.total_slots) and items > 0 {
    if obj_inventory.inv[ii]=0 {obj_inventory.inv[ii]=argument0 items-=1}
    ii++
}
while items > 0 {
    inv_drop_item(argument0)
    items--
}
