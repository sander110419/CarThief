///ex_inv_destroy(inv_id)

/*
    Description:    destroys an inventory and all its contents
    Arguments:      inv_id: the id of the inventory
*/

var inv = argument0;
var items = inv[? "items"];

//destroy unique items
for(var i=0; i<ds_grid_height(items); i++) {
    var item = ex_inv_get_item(inv,i);
    if(item >= 0 && item[? "unique"]) {
        ds_map_destroy(item);
    }
}

//destroy inventory
ds_grid_destroy(items);
ds_map_destroy(inv);
