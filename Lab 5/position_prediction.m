% Position prediction

[tm, ypos] = ode45('velocity',[0 5],1.5);

plot(tm,ypos,'-.');

title('dy/dt = -t*y/(sqrt(2-y^2))');

axis([0 5 0 1.5]);

