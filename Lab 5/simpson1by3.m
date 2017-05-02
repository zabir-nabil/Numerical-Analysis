function [ I ] = simpson1by3( n,a,b )

h = (b-a)/n;

Itemp = fun( x(0,a,h) ) + fun( x(a,a,h) );

for i = 1:n/2
    Itemp = Itemp + 4*fun( x(2*i-1,a,h) );
end

for i = 1:(n/2) -1
    Itemp = Itemp + 2*fun( x(2*i,a,h) );
end

I = Itemp*h/3;

end

function [yo] = fun(xi)

yo = sqrt( sin(xi) );

end

function [xi] = x(i,a,h)

xi = a+i*h;

end