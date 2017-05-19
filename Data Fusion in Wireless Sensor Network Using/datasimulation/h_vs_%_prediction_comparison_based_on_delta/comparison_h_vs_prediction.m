% Comparison plot of h vs % of successful prediction at delta = 0.03 and
% delta = 0.21
format long;

fid = fopen('data_f.txt','r');
dataM = fscanf(fid,'%f       %f       %f',[3 inf]);

h = dataM(1,:);
success_03 = dataM(2,:);
success_21 = dataM(3,:);

semilogx(h,success_03,'-k>',h,success_21,'-rs');


title('h vs percentage of successful prediction');
xlabel('h');
ylabel('percentage of successful prediction');
legend('prediction threshold = 0.03','prediction threshold = 0.21','Location','southwest');


