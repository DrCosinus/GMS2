/// @description 

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
draw_text(0,40,selectedPathPoint);
//draw_circle(fx,fy,5,false);
//draw_path(path0,0,0,true)

draw_sprite_ext(sCar,0,fx,fy,1,1,dir,c_white,1) 

#macro step 0.1

var count = path_get_number(path0);
for (var i = 0;i<count;++i)
{
    var x1 = path_get_point_x(path0,mathMod(i-1, count));
    var y1 = path_get_point_y(path0,mathMod(i-1, count));
    var x2 = path_get_point_x(path0,mathMod(i  , count));
    var y2 = path_get_point_y(path0,mathMod(i  , count));
    var x3 = path_get_point_x(path0,mathMod(i+1, count));
    var y3 = path_get_point_y(path0,mathMod(i+1, count));

    var col = c_yellow;
    if ( (x2-mouse_x)*(x2-mouse_x)+(y2-mouse_y)*(y2-mouse_y)<5*5 )
    {
        col = c_orange;
    }

    draw_set_color(col);

    draw_circle(x1,y1,5,false);
    draw_text(x1+5,y1,string(i));
    
    x1 = (x1 + x2)/2;
    y1 = (y1 + y2)/2;
    x3 = (x3 + x2)/2;
    y3 = (y3 + y2)/2;

    for (var t=0; t<1; t+=step)
    {
        var xM = x1*power(1-t,2)+2*x2*t*(1-t)+x3*power(t,2);
        var yM = y1*power(1-t,2)+2*y2*t*(1-t)+y3*power(t,2);
        var u = mathMod(t+step, 1);
        var xN = x1*power(1-u,2)+2*x2*u*(1-u)+x3*power(u,2)
        var yN = y1*power(1-u,2)+2*y2*u*(1-u)+y3*power(u,2);
        var vxM = -2*x1*(1-t)+2*x2*(1-2*t)+2*x3*t;
        var vyM = -2*y1*(1-t)+2*y2*(1-2*t)+2*y3*t;

        var vM = sqrt(vxM*vxM+vyM*vyM);
        
        //draw_circle(xM,yM,3,false);
        var d = 30/vM;
        //draw_set_color(c_green);
        draw_line_width(xM,yM,xN,yN,5);
        draw_set_color(c_red);
        //draw_arrow(xM,yM,xM-vyM*d,yM+vxM*d,1);
        draw_line_width(xM-vyM*-d,yM+vxM*-d,xM-vyM*d,yM+vxM*d,5);
        draw_set_color(col);
    }


    //draw_circle(x2,y2,5,true);
    //draw_circle(x3,y3,5,true);

    //draw_set_color(c_white);
}