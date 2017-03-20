clear all;
clc;
close all;
pnc = 0.0015;
onc = 0.005;
nov = 50;
xdim = 2;
odim = 2;
pnco = pnc*eye(xdim);
%omu = zeros(odim,1);
R = 273; C = 0.1; L = 233*0.000001;
A = [0, 1/C; -1/L, -R/L];
B = [0; 1/L];
step = 0.0000001;
A = eye(xdim) + step*A;
B = step*B;
C = eye(odim);
obs = zeros(odim,nov);
state = zeros(xdim,nov);
state(:,1) = [.1 1];
ucontrol = 0.0001*ones(1,nov);
pn = zeros(xdim,nov);

for n = 2:nov
    pn = sqrt(pnco)*randn(xdim,1);
    state(:,n) = A*state(:,n-1) + B*ucontrol(:,n-1)+pn;
    on = sqrt(onc)*randn(odim,1);
    obs(:,n) = C*state(:,n) + on;
end

figure(1)
plot(state(1,:),'-bs','MarkerSize',2)
legend('True state Vc');
xlabel('Time slot k','FontSize',14,'FontName','Arial')
ylabel('Voltage, Volt','FontSize',14,'FontName','Arial')