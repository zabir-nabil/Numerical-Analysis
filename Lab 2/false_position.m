
function [root,flag_convergence,num_iteration] = false_position(coef_v)

X_EPS = 0.001;
Z_EPS = 0.000001;
THRESHOLD = 0.5;
MAX_ITERATION = 500000;

n = length(coef_v);

r_max_abs = sqrt(  sqr(coef_v(n-1)/coef_v(n) ) - 2*( coef_v(n-2)/coef_v(n) )  );

% x1 = - r_max_abs;
% x2 = r_max_abs;
x1 = 3;
x2 = 5;

num_iteration = 0;
flag_convergence = true;
x_bar = 0;
abs_error = (x2-x1);

while ( (abs(abs_error)>X_EPS) )
    fx1 = polynomial(coef_v,x1);
    fx2 = polynomial(coef_v,x2);
    if(fx1==fx2)
        x1=x1+THRESHOLD; % To avoid symmetric point, division by 0
        continue;
    end
    x0 = x1 - (  (fx1*(x2-x1)) / (fx2-fx1)  );
    fx0 = polynomial(coef_v,x0);
    x_bar = x0;
    if(abs(fx0)<=Z_EPS)
        break;
    elseif(fx0*fx2<0)
        x1 = x0;
    else
        x2 = x0;
    end
    
    x1;
    x2;
    
    
    
    num_iteration=num_iteration+1;
    
    if(num_iteration==MAX_ITERATION)
        flag_convergence = false;
        break;
    end
    
    
    abs_error = (x2-x1);
        
    
end

root = x_bar;

function [fx] = polynomial(coef_v,x)
fx = 0;
n = length(coef_v);

for i = (0:1:n-1)
    fx = fx + coef_v(i+1)*(x^i);
end

function [sqv] = sqr(ss)
sqv = ss*ss;

   
    
%[r,c,n] = false_position([-9 -8 1]);
 

