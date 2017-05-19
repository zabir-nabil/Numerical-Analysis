function I = simpson3by8(n,a,b,z,c)

h = (b-a)/n;

I = fun(a) + fun(b);

for i=1:n-1
    I = I + z*fun( x(i,a,h) );
end

I = I*(3*h+c)/8;

end


function yo = fun(x)
yo = x^3+1;
%yo = sqrt(sin(x));
end

function xi = x(i,a,h)
xi = a+i*h;
end
