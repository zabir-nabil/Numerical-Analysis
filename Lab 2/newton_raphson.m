
function [root,flag_convergence,num_iteration] = newton_raphson(coef_v)

X_EPS = 0.0000001;
Z_EPS = 0.0000001;
THRESHOLD = 0.005;
MAX_ITERATION = 500000;

n = length(coef_v);

x_n = 10; %initial guess 10

x_np1 = inf

num_iteration = 0;
flag_convergence = true;
x_bar = 0;
abs_error = (x_np1-x_n);

while ( (abs(abs_error)>X_EPS) )
    fxn = polynomial(coef_v,x_n)
    fxn_p = polynomial_derivative(coef_v,x_n)
    if(abs(fxn_p)<=Z_EPS)
        x_n=x_n+THRESHOLD; % To avoid maxima, minima. division by 0
        continue;
    end
    x_np1 = x_n - (  fxn/fxn_p  )
    x_bar = x_np1;
    if(abs(fxn)<=Z_EPS)
        disp('DEBUG: Fxn close to 0 ');
        break;
    
    end
    
    
    
    
    num_iteration=num_iteration+1;
    
    if(num_iteration==MAX_ITERATION)
        flag_convergence = false;
        disp('DEBUG: Too much iterations ');
        break;
    end
    
    
    abs_error = (x_np1-x_n);
    
    x_n = x_np1;
        
    
end

root = x_bar;

function [fx] = polynomial(coef_v,x)
fx = 0;
n = length(coef_v);

for i = (0:1:n-1)
    fx = fx + coef_v(i+1)*(x^i);
end


function [fx] = polynomial_derivative(coef_v,x)
fx = 0;
n = length(coef_v);

for i = (0:1:n-1)
    fx = fx + (i)*coef_v(i+1)*(x^i);
end


   
    
%[r,c,n] = newton_raphson([-9 -8 1]);
 

