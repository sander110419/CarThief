///inv_get_first_slot_of(item id)

//Returns the first slot id that holds a specific item id.

var ii = 1
while (ii <= obj_inventory.total_slots) {
   if obj_inventory.inv[ii]=argument0 {return ii}
   ii++
}
return 0
