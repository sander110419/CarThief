///crafting_add_recipe(result_key,result_amount,item1,[item2],...)

/*
    Description:    Adds a crafting recipe to the system
    Arguments:      result_key: key of the resulting item
                    result_amount: amount of the resulting item (per unit)
                    [itemN]: item(s) required for the recipe
*/

var recipe = ds_map_create();
var ingredients = ds_list_create();

for(var i=2; i < argument_count; i+=1) {
    ds_list_add(ingredients,argument[i]);
}

ds_list_sort(ingredients,true);

recipe[? "result_key"] = argument[0];
recipe[? "result_amount"] = argument[1];
ds_map_add_list(recipe,"ingredients",ingredients);

ds_list_add(global.crafting_recipes,recipe);
ds_list_mark_as_map(global.crafting_recipes,ds_list_size(global.crafting_recipes)-1);
