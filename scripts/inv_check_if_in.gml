///inv_check_if_in(item_id)

//Checks your inventory for an item.

var ii = 1
while (ii <= obj_inventory.total_slots)  {
   if obj_inventory.inv[ii]=argument0 {return true}
   ii++
}
return false
