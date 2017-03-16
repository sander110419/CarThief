///ex_inv_set_slot(inv,item,amount,slot)

/*
    Description:    inserts an item into a slot of the inventory, replacing any 
                    items already in the slot (if any)
    Arguments:      inv: the inventory id to add the item to
                    item: the item or its key
                    amount: quantity of the specified item to insert
                    slot: the slot this item should be put into.
    Returns:        The amount of items actually inserted
*/

//get the required data
var inv,amount,item,key,inv_item,inv_items,slot,refresh;

inv = argument0;
if(is_real(argument1)) {
    item = argument1;
    if(argument1 >= 0) {key = item[? "key"];}
    else {key = "";}

}
else {
    key = argument1;
    if(key != "") {item = ex_db_get(key);}
    else {item = -1;}
}
amount = argument2;
slot = argument3;
inv_items = inv[? "items"];
inv_item = ex_inv_get_item(inv,slot);
refresh = false;

//if trying to insert an empty item, clear the slot
if(item < 0) {
    if(inv_item >= 0) {
        inv[? "size"] -= 1;
        if(inv_item[? "unique"]) {ds_map_destroy(inv_item);}
        refresh = true;
    }
    inv_items[# 1,slot] = "";
    inv_items[# 2,slot] = 0;
    inv_items[# 3,slot] = "";
    inv_items[# 4,slot] = -1;
}
else { //replace current item
    var q = min(item[? "stack_size"],amount);

    inv_items[# 1,slot] = key;
    inv_items[# 2,slot] = q;
    inv_items[# 3,slot] = item[? "base_key"];
    if(item[? "unique"]) {inv_items[# 4,slot] = ds_map_dup(item);}
    else {inv_items[# 4,slot] = item;}
    if(inv_item >= 0) {
        if(inv_item[? "unique"]) {ds_map_destroy(inv_item);}
    }
    else {
        inv[? "size"] += 1;
    }
    refresh = true;
}

if(refresh) { //inventory updated callback on success
    var affected_slots = ds_list_create();
    ds_list_add(affected_slots,slot);
    ex_inv_updated(inv,affected_slots);
    ds_list_destroy(affected_slots);
}

return argument2 - amount;
