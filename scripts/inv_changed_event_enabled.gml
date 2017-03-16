///inv_changed_event_enabled([enabled])

/*
    Description:    Returns wether the event panel_event.inventory_changed is enabled.
                    If true or false is passed as argument, the property is set accordingly.
    Arguments:      enabled (optional): true or false
    Returns:        true or false
*/

if(argument_count > 0) {
    inventory_changed_callback = argument[0];
}

return inventory_changed_callback;
