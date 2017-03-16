///inv_drop_item(itemid)

//Drops an item at the desired location.

drop_x=mouse_x
drop_y=mouse_y

dropitem = instance_create(drop_x-obj_inventory.slot_size/2,drop_y-obj_inventory.slot_size/2,obj_ground_item)
dropitem.itemid = argument0


