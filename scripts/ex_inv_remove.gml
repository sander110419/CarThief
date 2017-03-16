#define ex_inv_remove
///ex_inv_remove(inv,item,amount)

/*
    Description:    removes a specified amount of a particular item form an inventory
    Arguments:      inv: the affected inventory
                    item: the item to remove or its key
                    amount: quantity of the specified item to remove
    Returns:        The amount of items actually removed
*/



var inv,item,key,amount,inv_items,affected_slots,col;

//init arguments
inv = argument0;
if(is_real(argument1)) {
    col = 1;
    item = argument1;
    if(argument1 >= 0) {key = item[? "key"];}
    else {key = "";}

}
else {
    col = 3;
    key = argument1;
    if(key != "") {item = ex_db_get(key);}
    else {item = -1;}
}

if(argument2 < 0) {
    argument2 = ex_inv_count(inv,argument1);
}
amount = argument2;

//check if item is empty or amount 0, in which case, there's nothing to do
if(amount == 0 || item < 0) {return 0;}

//check if at least an item of the kind given exists
inv_items = inv[? "items"];
affected_slots = ds_list_create();

while(amount > 0) {
    if(!ds_grid_value_exists(inv_items,col,0,col,ds_grid_height(inv_items)-1,key)) {break;}
    var row = ds_grid_value_y(inv_items,col,0,col,ds_grid_height(inv_items)-1,key);
    var q = min(inv_items[# 2,row],amount);
    inv_items[# 2,row] -= q;
    if(inv_items[# 2,row] == 0) {
        var inv_item = inv_items[# 4,row];
        inv_items[# 1,row] = "";
        inv_items[# 3,row] = "";
        if(inv_item[? "unique"]) {ds_map_destroy(inv_item);}
        inv_items[# 4,row] = -1;
        inv[? "size"] -= 1;
    }
    ds_list_add(affected_slots,row);
    amount -= q;
}

if(argument2 != amount) { //inventory updated callback on success
    ex_inv_updated(inv,affected_slots);
}
ds_list_destroy(affected_slots);

return argument2 - amount;

#define ex_inv_remove_slot
///ex_inv_remove_slot(inv,amount,slot)

/*
    Description:    removes a specified amount of a particular item form an inventory
    Arguments:      inv: the affected inventory
                    amount: quantity of the specified item to remove. -1 = all
                    slot: slot from where to remove
    Returns:        The amount of items actually removed
*/

//check if amount is 0 first
if(argument1 == 0) {return 0;}

//get the required data
var inv,item,amount,inv_items,slot;

inv = argument0;
inv_items = inv[? "items"];
slot = argument2;
if(argument1 < 0) {
    argument1 = inv_items[# 2,slot];
}
amount = argument1;
item = ex_inv_get_item(inv,slot);

if(item < 0) {return 0;} //slot already empty

var q = min(amount,inv_items[# 2,slot]);
inv_items[# 2,slot] -= q;
if(inv_items[# 2,slot] == 0) {
    var inv_item = inv_items[# 4,slot];
    inv_items[# 1,slot] = "";
    inv_items[# 3,slot] = "";
    if(inv_item[? "unique"]) {ds_map_destroy(inv_item);}
    inv_items[# 4,slot] = -1;
    inv[? "size"] -= 1;
}
amount -= q;

if(argument1 != amount) { //inventory updated callback on success
    var affected_slots = ds_list_create();
    ds_list_add(affected_slots,slot);
    ex_inv_updated(inv,affected_slots);
    ds_list_destroy(affected_slots);
}

return argument1 - amount;