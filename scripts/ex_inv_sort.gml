///ex_inv_sort(inv,ascending)

/*
    Description:    sorts the inventory based on item key
    Arguments:      inv: the inventory where the count should take place
                    ascending: if true, sorts in ascending order, descending otherwise
    Returns:        The count of the item in the inventory
*/

var inv,items,affected_slots;

inv = argument0;
items = inv[? "items"];
affected_slots = ds_list_create();

ds_grid_sort(items,1,argument1);

//update position column and mark all slots to be updated
for(var i=0; i<inv[? "max_size"]; i++) {
    items[# 0,i] = i;
    ds_list_add(affected_slots,i);
}

ex_inv_updated(inv,affected_slots);

ds_list_destroy(affected_slots);
