///ex_inv_count(inv,item)

/*
    Description:    returns the amount of a specific item in the inventory
    Arguments:      inv: the inventory where the count should take place
                    item: the item to count, or its key
    Returns:        The count of the item in the inventory
*/

var inv,items,item,key,count,col;

inv = argument0;
items = inv[? "items"];
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
count = 0;


if(!ds_grid_value_exists(items,col,0,col,ds_grid_height(items)-1,key)) {
    return 0;
}

for(var i=0;i<ds_grid_height(items);i++) {
    if(items[# col,i] == key) {
        count += items[# 2,i];
    }
}

return count;
