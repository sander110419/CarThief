#define ex_inv_write
///ex_inv_write(inv)

/*
    Description:    returns a JSON encoded string that containing
                    all the inventory data, to be used for example to save
                    the inventory to file.
    Arguments:      inv: the inventory to write
    Returns:        a JSON string
*/

var inv,json,items_grid,items_list;

inv = argument0;
items_grid = inv[? "items"];

//prepare list of items
items_list = ds_list_create();
for(var i=0; i<ds_grid_height(items_grid); i++) {
    var item = ds_map_create();
    var inv_item = ex_inv_get_item(inv,i);
    item[? "key"] = ex_inv_get_key(inv,i);
    item[? "amount"] = ex_inv_get_amount(inv,i);
    if(inv_item >= 0 && inv_item[? "unique"]) {
        ds_map_add_map(item,"data",ds_map_dup(inv_item));
    }
    ds_list_add(items_list,item);
    ds_list_mark_as_map(items_list,i);
}

//add the list to the inventory
ds_map_delete(inv,"items");
ds_map_add_list(inv,"items",items_list);

//encode the data
json = json_encode(inv);

//revert items back
ds_list_destroy(items_list);
ds_map_delete(inv,"items");
inv[? "items"] = items_grid;

//return encoded data
return json;

#define ex_inv_read
///ex_inv_write(inv)

/*
    Description:    Creates and returns an inventory from a JSON encoded string
                    generated from ex_inv_write.
    Arguments:      inv: the data to read
    Returns:        an inventory reference
*/

var inv,json,items_list,items_grif;

inv = json_decode(argument0);
items_grid = ds_grid_create(5,inv[? "max_size"]);
items_list = inv[? "items"];

//load items
for(var i=0; i<ds_list_size(items_list); i++) {
    var item = items_list[| i];
    items_grid[# 0,i] = i;
    items_grid[# 1,i] = item[? "key"];
    items_grid[# 2,i] = item[? "amount"];
    if(ds_map_exists(item,"data")) {
        var data = item[? "data"];
        items_grid[# 3,i] = data[? "base_key"];
        items_grid[# 4,i] = ds_map_dup(data);    
    }
    else if(item[? "key"] != "") {
        items_grid[# 3,i] = item[? "key"];
        items_grid[# 4,i] = ex_db_get(item[? "key"]);
    }
    else {
        items_grid[# 3,i] = "";
        items_grid[# 4,i] = -1;
    }
}

//delete unneeded data
ds_list_destroy(items_list);
ds_map_delete(inv,"items");

//set items grid back
inv[? "items"] = items_grid;

return inv;