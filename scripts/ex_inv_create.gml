///ex_inv_create(max_size)

/*
    Description:    creates an empty inventory
    Arguments:      size: the maximum number of items the inventory can hold
    Returns:        the inventory ID
*/

//an inventory is a ds_map holding the max size, current size and the item ids (as ds_grid)
var inv = ds_map_create();

inv[? "max_size"] = argument0;
inv[? "size"] = 0;
var items = ds_grid_create(5,argument0);
inv[? "items"] = items;

//store the index of every row. This allows the inventory to be sorted
//for calculations and then reverted back to its original order
for(var i=0; i<argument0;i++) {
    items[# 0,i] = i;
}

//set all keys to empty
ds_grid_set_region(items,1,0,1,argument0-1,"");

//set all amounts to 0
ds_grid_set_region(items,2,0,2,argument0-1,0);

//set all base keys to empty (used for unique system)
ds_grid_set_region(items,3,0,3,argument0-1,"");

//set all items to empty
ds_grid_set_region(items,4,0,4,argument0-1,-1);

return inv;
