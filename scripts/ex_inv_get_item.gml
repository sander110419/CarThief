#define ex_inv_get_item
///ex_inv_get_item(inv,index)

/*
    Description:    returns the item in a specific slot
    Arguments:      inv: the inventory to look into
                    index: the slot index
    Returns:        The item in the inventory slot
*/

var inv,items,index;

inv = argument0;
index = argument1;
items = inv[? "items"];

return items[# 4,index];

#define ex_inv_get_amount
///ex_inv_get_amount(inv,index)

/*
    Description:    returns the amount of an item in a specific slot
    Arguments:      inv: the inventory to look into
                    index: the slot index
    Returns:        The amount of the items stack in the inventory slot
*/

var inv,items,index;

inv = argument0;
index = argument1;
items = inv[? "items"];

return items[# 2,index];
#define ex_inv_get_key
///ex_inv_get_key(inv,index)

/*
    Description:    returns the key of an item in a specific slot
    Arguments:      inv: the inventory to look into
                    index: the slot index
    Returns:        The key of the item in the inventory slot
*/

var inv,items,index;

inv = argument0;
index = argument1;
items = inv[? "items"];

return items[# 1,index];