///ex_inv_switch(inv1,index1,inv2,index2)

/*
    Description:    switches two slots from the same or different inventories
    Arguments:      inv1: first inventory
                    index1: slot index of the first inventory
                    inv2: second inventory
                    index2: slot index of the second inventory
*/

var inv1,inv2,index1,index2,item1,amount1,item2,amount2,unique;

inv1 = argument0;
index1 = argument1;
inv2 = argument2;
index2 = argument3;

item1 = ex_inv_get_item(inv1,index1);
amount1 = ex_inv_get_amount(inv1,index1);
item2 = ex_inv_get_item(inv2,index2);
amount2 = ex_inv_get_amount(inv2,index2);

unique = item1 >= 0 && item1[? "unique"];

if(unique) {item1 = ds_map_dup(item1);}

ex_inv_set_slot(inv1,item2,amount2,index1);
ex_inv_set_slot(inv2,item1,amount1,index2);

if(unique) {ds_map_destroy(item1);}
