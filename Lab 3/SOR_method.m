function [ x ] = SOR_method( A, b, w, num_iter)
%SOR_method Successive over relaxation
%   Improvement of Jacobi/Gauss-Seidal Method

[r, c] = size(A);
x = zeros(r,1);
if( (r~=c) || (length(b)~=r))
    fprintf('This will not produce correct result\n');
    return;
end

n = r; % assuming r = c

x_k = zeros(n,1); % initial guess
x_k_1 = zeros(n,1);


for iter = 1:num_iter
    
    for i = 1:n
        axk1 = 0;
        for j=1:i-1
            axk1 = axk1 + A(i,j)*x_k_1(j);
        end
        axk = 0;
        for j=i+1:n
            axk = axk + A(i,j)*x_k(j);
        end
        
        x_k_1(i) = (-axk1 - axk +b(i))/A(i,i);
    end
    x_k_r = x_k + w*(x_k_1 - x_k);
    x_k = x_k_r;
    
end

x = x_k;

end

