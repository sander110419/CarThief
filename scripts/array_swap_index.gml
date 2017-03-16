///array_swap_index(array, index1, index2);

//Swaps the values of two indexes in an array.

//  array                = Array containing the indexes to swap.
//  index1               = One of the indexes to be swapped with the other.
//  index2               = One of the indexes to be swapped with the other.

//Converts arguments to locals.
var array = argument0;
var i1 = argument1;
var i2 = argument2;

//Stores index values.
var v1 = array[i1];
var v2 = array[i2];

//Swaps Indexes.
array[@i1] = v2;
array[@i2] = v1;
