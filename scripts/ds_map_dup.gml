///ds_map_dup(ds_map)

/*
    Description:    generate a duplicate of the given ds_map, and returns it
    Arguments:      ds_map: the map to duplicate
    Returns:        ds_map
*/

var copy = ds_map_create();
ds_map_copy(copy,argument0);

return copy;
