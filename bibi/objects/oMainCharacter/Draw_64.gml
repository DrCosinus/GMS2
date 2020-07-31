/// @description 

#macro step 0.1

var trackVerticesList = ds_list_create();
var count = path_get_number(path0);
var length = 0;
var length_v2 = 0;
for (var i = 0;i<count;++i)
{
    var x1 = path_get_point_x(path0,mathMod(i-1, count));
    var y1 = path_get_point_y(path0,mathMod(i-1, count));
    var x2 = path_get_point_x(path0,mathMod(i  , count));
    var y2 = path_get_point_y(path0,mathMod(i  , count));
    var x3 = path_get_point_x(path0,mathMod(i+1, count));
    var y3 = path_get_point_y(path0,mathMod(i+1, count));

    var ax = (x1-2*x2+x3)/2;
    var ay = (y1-2*y2+y3)/2;
    var bx = x2-x1;
    var by = y2-y1;
    var cx = (x1+x2)/2;
    var cy = (y1+y2)/2;

    for (var t=0; t<1; t+=step)
    {
        var xM = ax*t*t+bx*t+cx;
        var yM = ay*t*t+by*t+cy;

        var vxM = 2*ax*t + bx;
        var vyM = 2*ay*t + by;

        var vM = sqrt(vxM*vxM+vyM*vyM);

        length_v2 += vM * step;
 
        var sectionWidth = 30/vM;

        ds_list_add( trackVerticesList, [xM-vyM*-sectionWidth,yM+vxM*-sectionWidth], [xM-vyM*sectionWidth, yM+vxM*sectionWidth] );
    }
}
draw_set_color(c_ltgray);
draw_primitive_begin(pr_trianglestrip)
for(var i=0; i<ds_list_size(trackVerticesList); ++i)
{
    var pt = trackVerticesList[|i];
    draw_vertex(pt[0],pt[1]);
}
var pt0 = trackVerticesList[|0];
draw_vertex(pt0[0],pt0[1]);
var pt1 = trackVerticesList[|1];
draw_vertex(pt1[0],pt1[1]);
draw_primitive_end();

ds_list_destroy(trackVerticesList);
ds_list_destroy(trackVerticesList);

for (var i = 0;i<count;++i)
{
    var x2 = path_get_point_x(path0,mathMod(i  , count));
    var y2 = path_get_point_y(path0,mathMod(i  , count));
    
    var col = c_yellow;

    if ( (x2-mouse_x)*(x2-mouse_x)+(y2-mouse_y)*(y2-mouse_y)<5*5 )
    {
        col = c_orange;
    }

    draw_set_color(col);
    draw_circle(x2,y2,5,false);
    draw_text(x2+5,y2,string(i));
}
draw_set_color(c_yellow);

zorg += delta_time * 0.000001 / path_get_number(path0);
var delta = 0.1 /path_get_number(path0);
zorg %= 1;
var fx = path_get_x(path0, zorg);
var fy = path_get_y(path0, zorg);

var dfx = path_get_x(path0, (zorg+delta)%1)-fx;
var dfy = path_get_y(path0, (zorg+delta)%1)-fy;

var dir = point_direction(0,0,dfx,dfy)

draw_text(0,0,string(zorg))
draw_text(0,20,string(path_get_number(path0)))
draw_text(0,40,path_get_length(path0));
draw_text(0,60,length);
draw_text(0,80,length_v2);


draw_sprite_ext(sCar,0,fx,fy,1.5,1.5,dir,c_white,1) ;