//Customize the look and feel of your inventory:

total_slots     =   10                  //The total number of invetory slots
slots_in_row    =   5                   //The number of slots per row
slot_size       =   216                  //The width and heigt of each slot. They must be square.
inventory_x     =   0                 //The x offset on the view of your inventory.
inventory_y     =   1290                  //The y offset on the view of your inventory.
slot_sprite     =   spr_slot            //The sprite of your slot.
slot_selected   =   spr_selected_slot   //The sprite of the slot when it's selected
show_inventory  =   false                //Display the inventory.

/* 

Add items to your game!

The first parameter is a number to be the item identifier. This can be any number as long as they are all different.
The second parameter is the icon sprite used for the item when it's in the inventory and on the ground.
The final parameter is simply the name of the item as a string.

*/

inv_create_item(0,spr_no_item,"") //Don't remove this one!
inv_create_item(901,spr_901,"Screwdriver")
inv_create_item(902,spr_902,"Bodyarmor Suit")
inv_create_item(903,spr_903,"Pick Gun")
inv_create_item(904,spr_904,"Handgun")//
inv_create_item(905,spr_905,"GPS")//
inv_create_item(906,spr_906,"GPS")//
inv_create_item(907,spr_907,"SMG")
inv_create_item(908,spr_908,"GPS")//
inv_create_item(909,spr_909,"Handcannon")//
inv_create_item(910,spr_910,"niks")
inv_create_item(911,sprite216,"Tryout Key Set")
inv_create_item(912,sprite217,"Slim Jim Set")
inv_create_item(913,sprite218,"Pump Wedge")
inv_create_item(914,sprite219,"Chain Cutter")
inv_create_item(915,sprite220,"Boksbeugel")
inv_create_item(916,sprite221,"Crowbar")
inv_create_item(917,sprite222,"Hammer")
inv_create_item(918,sprite223,"Knife")//
inv_create_item(919,sprite224,"Wirecutter")
inv_create_item(920,sprite225,"Lockpick Set")
inv_create_item(921,sprite226,"Multimeter")
inv_create_item(922,sprite227,"Nightstick")
inv_create_item(923,sprite228,"Bodyarmor2")//
inv_create_item(924,sprite229,"Code Grabber")
inv_create_item(925,sprite230,"Screwdriver")
inv_create_item(926,sprite231,"Shotgun")//
inv_create_item(927,sprite232,"Raspberry PI")
inv_create_item(928,sprite233,"Bodyarmor")//
inv_create_item(929,sprite234,"Shotgun")//
inv_create_item(930,sprite235,"Sniper")




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
