function [ y_x ] = Polygon( x_i, h )
y_old = 2;
x_req = 1.5;
m1 = fun(x_i,y_old);
m2 = 0;
while(x_i<x_req)
    x_i_1 = x_i + h;
    y_i = y_old;
    m = fun(x_i,y_i);
    y_i_1 = y_i + m*h;
    x_ni = (x_i+x_i_1)/2;
    y_ni = (y_i+y_i_1)/2;
    y_i_1 = y_i + fun( x_ni,y_ni)*h;
    y_old = y_i_1;
    x_i = x_i+h; 
end
y_x = y_old;
function [yo] = fun(x,y)
yo = (2*y)/x;
end

end