/// @description 

#macro dist 5
show_debug_message("plop: "+string(mouse_x)+", "+string(mouse_y));
var count = path_get_number(path0);
//var selected = -1;
for (var i = 0;i<count;++i)
{
    var px = path_get_point_x(path0, i)-mouse_x;
    var py = path_get_point_y(path0, i)-mouse_y;
    show_debug_message(string(i) + ": "+string(path_get_point_x(path0, i))+", "+string(path_get_point_y(path0, i)));
    if ( px*px+py*py < dist*dist )
    {
        selectedPathPoint = i;
        show_debug_message("Selected Path Point Index = "+string(selectedPathPoint));
        break;
    }
}

