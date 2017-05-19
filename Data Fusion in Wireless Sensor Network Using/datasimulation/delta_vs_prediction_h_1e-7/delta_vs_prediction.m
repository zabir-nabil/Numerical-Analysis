% Comparison plot of h vs % of successful prediction at delta = 0.03 and
% delta = 0.21
format long;

fid = fopen('data_f.txt','r');
dataM = fscanf(fid,'%f       %f',[2 inf]);

delta = dataM(1,:);
success_1e7 = dataM(2,:);


plot(delta,success_1e7,'-rs');


title('prediction threshold vs percentage of successful prediction (h = 1e-7)');
xlabel('prediction threshold');
ylabel('percentage of successful prediction');
legend('h = 1e-7','Location','southwest');


