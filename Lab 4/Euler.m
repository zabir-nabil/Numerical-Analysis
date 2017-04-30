function [ y_x ] = Euler( x_i, h )
y_old = 2;
x_req = 1.5;
while(x_i<x_req)
    y_new = y_old + h*fun(x_i,y_old);
    y_old = y_new;
    x_i=x_i+h;
end
y_x = y_new;
function [yo] = fun(x,y)
yo = (2*y)/x;
end

end