///crafting_find_recipe(items)

/*
    Description:    Adds a crafting recipe to the system
    Arguments:      items: ds_list of item keys to check for recipe
    Returns:        a recipe object or -1 if no recipe found
*/

var found_recipe = -1;
var items = argument0;
ds_list_sort(items,true);

for(var i=0; i<ds_list_size(global.crafting_recipes); i++) {
    var recipe = global.crafting_recipes[| i];
    var ingredients = recipe[? "ingredients"];
    if(ds_list_size(ingredients) != ds_list_size(items)) {continue;}
    var matched = true;
    
    for(var j=0; j<ds_list_size(items); j++) {
        if(items[| j] != ingredients[| j]) {matched = false; break;}
    }

    if(matched) {
        found_recipe = recipe;
        break;
    }
}

return found_recipe;
