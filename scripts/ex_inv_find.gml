///ex_inv_find(inv,item,ex_find_type)

/*
    Description:    finds the an item with the specified key in the inventory
    Arguments:      inv: the inventory to search through
                    item: item or key to look for
                    ex_find_type: the type of find operation from the ex_find_type enum, determining the
                    priority in case of multiple items with the same key. Can be either
                    ex_find_type.first, ex_find_type.last, 
                    ex_find_type.low (lowest amount), ex_find_type.high (highest amount)
    Returns:        The index of the item in the inventory (or -1 if not found)
*/

var inventory,items,item,key,type,col;

inventory = argument0;
items = inventory[? "items"];
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
type = argument2;

if(!ds_grid_value_exists(items,col,0,col,ds_grid_height(items)-1,key)) {
    return -1;
}

switch(type) {
    case ex_find_types.first:
        return ds_grid_value_y(items,col,0,col,ds_grid_height(items)-1,key);
    
    case ex_find_types.last:
        ds_grid_sort(items,0,false);
        var row = items[# 0,ds_grid_value_y(items,col,0,col,ds_grid_height(items)-1,key)];
        ds_grid_sort(items,0,true);
        return row;
    
    case ex_find_types.low:
        ds_grid_sort(items,2,true);
        var row = items[# 0,ds_grid_value_y(items,col,0,col,ds_grid_height(items)-1,key)];
        ds_grid_sort(items,0,true);
        return row;
        
    case ex_find_types.high:
        ds_grid_sort(items,2,false);
        var row = items[# 0,ds_grid_value_y(items,col,0,col,ds_grid_height(items)-1,key)];
        ds_grid_sort(items,0,true);
        return row;
}
