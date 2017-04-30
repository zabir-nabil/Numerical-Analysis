function [ y_x ] = Heun( x_i, h )
y_old = 2;
x_req = 1.5;
m1 = fun(x_i,y_old);
m2 = 0;
while(x_i<x_req)
    m1 = fun(x_i,y_old);
    y_new = y_old + h*m1;
    x_i=x_i+h;
    m2 = fun(x_i,y_new);
    m = (m1+m2)/2;
    y_new = y_old + h*m;
    y_old = y_new;
    
end
y_x = y_new;
function [yo] = fun(x,y)
yo = (2*y)/x;
end

end