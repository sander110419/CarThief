/**
 * In here we'll process the steps, as the draw event is actually a step on itself.
 */

/** 
  * Check the dragging of the mouse / finger
  */
___m_in_rectangle = in_rectangle(mouse_x, mouse_y, x, y, __width, __height);
var center = -__offset + (__height/2) - __itemheight/2;

if (mouse_check_button_pressed(mb_left) && ___m_in_rectangle) {
    __mouse_yprevious = mouse_y;
}

if (mouse_check_button_released(mb_left) && ___m_in_rectangle) {
    if (__mouse_yprevious > mouse_y-1 && __mouse_yprevious < mouse_y+1) {
        
        if (__title == '') { _ystart = __paddingtop; } 
        else { _ystart = __paddingtop+__itemheight; }

        _____dis = -1000;
        for (___i = 0; ___i<__itemcount; ___i++) {
            ____ofy = _ystart + __offset + ___i*__itemheight;
            
            if (____ofy > mouse_y-y-__itemheight && ____ofy < mouse_y-y ) {
                if (___selected!= ___i) {
                    ___selected = ___i;
                    audio_play_sound(snd_list_click, 1, 0);
                    
                    var dist = ___i*__itemheight - center;
                    if (dist < 0) { dist += __itemheight; } //Offset fix
                    __dragy = -((dist)/5) //Automatically slide to selected item
                }
            }
        
        }
    
    }
}

if (mouse_check_button(mb_left)) {
    if (___m_in_rectangle) {
        __dragy = mouse_y-__mouse_yprevious;
        __sidebar_alpha = 5;
    }
}

__sidebar_alpha = max(0, __sidebar_alpha-0.05);// Fade out the sidebar
__dragy *= __dragslowdown;// Slow it down 
__offset += __dragy;

if (___m_in_rectangle) {
    __mouse_yprevious = mouse_y;
}
/**
 * Make sure we don't drag the whole thing away.
 */
//Dont make it go down more than we can 
if (__offset > 0) {
    __offset = 0;
}

//If the whole list fits in, we don't need no scrollin'. Aint nobody got time fo dat.
if (__height >= __listheight) { //If the list fits in
    __offset = 0;
} else { //It does not fit in
    if (__offset < __maxmin) { //Make sure we can't go lower.
        __offset = __maxmin;
    }
}

//Autoselect a certain one

if (__autoselect) {
    
    if (__title == '') { _ystart = __paddingtop; } 
        else { _ystart = __paddingtop+__itemheight; }

    _____dis = -1000;
    for (___i = 0; ___i<__itemcount; ___i++) {
        ____ofy = _ystart + __offset + ___i*__itemheight;
        
        if (___i*__itemheight > center - (__itemheight/2) && ___i*__itemheight < center + (__itemheight/2) ) {
            if (___selected!= ___i) {
                ___selected = ___i;
                audio_play_sound(snd_list_click, 1, 0);
            }
        }
    
    }

}

/**
 * Now we'll handle the drawing part. Since we want it to be our own size i'm using surfaces.
 */ 

if (!surface_exists(__surface)) {
    
    //Surfaces must be square. Therefore calculate the bigger size of the scrollbar.
    if (__width > __height) {
        ___biggest = __width;
    } else {
        ___biggest = __height;    
    }
    
    ___i = 1;
    while (___i < ___biggest) {
        ___i *= 2;
    }

    __surface = surface_create(___i, ___i);
} else {
    surface_set_target(__surface);
    
    // Clear the surface
    draw_set_color(c_white);
    draw_rectangle(0, 0, __width, __height,0);
    
    //Draw the backgorund
    draw_sprite_stretched(spr_list_background, 0, 0, 0, __width, __height);
    
    _xstart = 0;
    //If we have a title set, then increase the ystart with the itemheight for the title.    
    if (__title == '') { _ystart = __paddingtop; } 
        else { _ystart = __paddingtop+__itemheight; }

    draw_set_font(__itemfont);
    draw_set_color(__itemcolor);
    switch (__itemalign) {
        case 'left':
            draw_set_halign(fa_left);
            _xstart = __paddingleft;
            break;
        
        case 'center':
            draw_set_halign(fa_center);
            _xstart = __width/2;
            break;
    }
    
    /////////////////////
    ///// DRAW ITEMS ////
    /////////////////////
    for (___i = 0; ___i<__itemcount; ___i++) {
        if (___selected == ___i) {
            draw_set_color(c_green);
            draw_sprite_stretched(spr_list_middle_selector, 0, 0, _ystart + __offset + ___i*__itemheight -5, __width, __itemheight+5);
            draw_set_color(c_black);
        }
        var _ypos = _ystart + __offset + ___i*__itemheight;
        if (_ypos >= -20 && _ypos <= __height + 20) { // Only draw the text if its visible
            draw_text(_xstart, _ypos, __items[___i]);
        }
    }    
    
    /////////////////////
    ///// DRAW TITLE ////
    /////////////////////
    /*
    if (__title != '') { 
        switch (__titlealign) {
        case 'left':
            draw_set_halign(fa_left);
            _xstart = 16;
            break;
        
        case 'center':
            draw_set_halign(fa_center);
            _xstart = __width/2;
            break;
        }
        draw_set_font(__titlefont);
        draw_set_color(__titlecolor);
        draw_text(_xstart, __paddingtop , __title);
        
    }
    */
    // I've left out the title drawing for now.
    
    
    //Draw the foreground
    draw_sprite_stretched(spr_list_foreground, 0, 0, 0, __width, __height);
    
    surface_reset_target();
    
    //Draw our surface
    draw_surface_part(__surface, 0, 0, __width, __height, __x, __y);
}
