//Customize the look and feel of your inventory:

total_slots     =   100                  //The total number of invetory slots
slots_in_row    =   10                   //The number of slots per row
slot_size       =   32                  //The width and heigt of each slot. They must be square.
inventory_x     =   16                  //The x offset on the view of your inventory.
inventory_y     =   16                  //The y offset on the view of your inventory.
slot_sprite     =   spr_slot            //The sprite of your slot.
slot_selected   =   spr_selected_slot   //The sprite of the slot when it's selected
show_inventory  =   true                //Display the inventory.

/* 

Add items to your game!

The first parameter is a number to be the item identifier. This can be any number as long as they are all different.
The second parameter is the icon sprite used for the item when it's in the inventory and on the ground.
The final parameter is simply the name of the item as a string.

*/

inv_create_item(0,spr_no_item,"") //Don't remove this one!
inv_create_item(901,spr_901,"Bones")
inv_create_item(902,spr_902,"Needle and Thread")
inv_create_item(903,spr_903,"Hammer")
inv_create_item(904,spr_904,"Chisel")
inv_create_item(905,spr_905,"Shovel")
inv_create_item(906,spr_906,"Knife")
inv_create_item(907,spr_907,"Pickaxe")
inv_create_item(908,spr_908,"Hatchet")
inv_create_item(909,spr_909,"Fishing Pole")

/*

Now it's time to program the functionality of your items when you right/left click them.
Go over to the inv_item_action_left and inv_item_action_right scripts to program this.

Common Questions:

Q: How do I add the inventory to my game?
A: Simply put the obj_inventory in your room!

Q: How do I add items to the ground?
A: Place the obj_ground_item in your room, right click it and click creation code. Now type itemid = (the item you want it to be).

Q: How do I add items to the ground through code?
A: Use inv_drop_item code but change the drop_x and drop_y variables.

*/






//Copyright 2015 - Coded Games
