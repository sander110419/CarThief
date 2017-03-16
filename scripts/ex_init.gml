///ex_init()

/*
    Initializes the inventory system. Call only once at game start
*/

globalvar _ex_db; _ex_db = ds_map_create();
globalvar _ex_keys; _ex_keys = ds_list_create();

enum ex_find_types {
    first,
    last,
    low,
    high
}
