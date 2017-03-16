__listheight = (__itemheight*__itemcount) + __paddingtop;
if (__title!='') {
    __listheight += __itemheight;
}

__maxmin = -__listheight;
if (__title!='') {
    __maxmin+=__itemheight;
}
__maxmin+=__itemheight;
__maxmin+=__paddingtop;

