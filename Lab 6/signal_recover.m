% recover x from r

x = [1 1.10 1.20 1.30 1.40 1.50 1.60 1.70 1.80 1.90];
noise = [0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05];
r = x+noise;



% Transmitter design in matlab
z1 = 2;
z2 = 3;
n = 10;
h = 0.25;
clo = -5;
chi = 5;
%dy/dx = m = 5
threshold = ones(1,10)*0.01;
resig = zeros(1,10);
while(abs(x-resig)<threshold)
    c = (clo+chi)/2;
    Ics = dydx(1) + dydxx(n);

    for i = 1:(n/2)
        Ics = Ics+z1*dydx(2*i-1);
    
    end


    for i = 1:(n/2)-1
        Ics = Ics+z2*dydx(2*i);
    end

    Ics = Ics*(3*h+c)/8;

    x_pos = 1:10;
    resig = Ics*x_pos;
    
    if (abs(x-resig)>threshold)
        chi = cmid;
    else
        clo = cmid;
    
    end

end


