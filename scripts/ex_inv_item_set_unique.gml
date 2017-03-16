///ex_inv_item_set_unique(inv,slot,new_key)

/*
    Description:    marks an item as unique, allowing its properties to be edited
    Arguments:      inv: the inventory where the item is
                    slot: slot of the item to make unique
                    new_key: the new key assigned to the item
    Returns:        true if successful, false otherwise
*/

var inv,items,item,slot,new_key,unique_item;

inv = argument0;
items = inv[? "items"];
slot = argument1;
new_key = argument2;
item = ex_inv_get_item(inv,slot);

//return false if no item exists in the slot
if(item < 0) {return false;} 

//create and set the new item attributes
unique_item = ds_map_dup(item);
unique_item[? "key"] = new_key;
unique_item[? "unique"] = true;
unique_item[? "base_key"] = item[? "key"];
items[# 1,slot] = new_key;
items[# 4,slot] = unique_item;

//if the item was already unique, destroy it
if(item[? "unique"]) {
    ds_map_destroy(item);
}

//update inventory callback
var affected_slots = ds_list_create();
ds_list_add(affected_slots,slot);
ex_inv_updated(inv,affected_slots);
ds_list_destroy(affected_slots);

return true;
