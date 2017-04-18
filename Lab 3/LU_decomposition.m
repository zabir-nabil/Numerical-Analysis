function [ L, U, x ] = LU_decomposition( A, b )
% LU_decomposition 
% Dolittle method

[r, c] = size(A);

L = zeros(r,c);
U = L;
x = zeros(r,1);

if(r~=c)
    fprintf('This will not produce correct result.\n');
end

Lt = zeros(r,c);
Ut = zeros(r,c);

n = r; % assuming A is square matrix
%b = zeros(n,1); % Ax = b


Ut(1,:) = A(1,:);

for i = 1:n
    Lt(i,i) = 1;
end

Lt(:,1) = A(:,1)/Ut(1,1);

for j = 2:n
    for i = 2:j
        sum = 0;
        for k = 1:j-1
            sum = sum + Lt(i,k)*Ut(k,j);
        end
        
        Ut(i,j) = A(i,j) - sum;
        
    end
    
    for i = j+1:n
        sum = 0;
        for k = 1:j-1
            sum = sum + Lt(i,k)*Ut(k,j);
        end
        
        Lt(i,j) = (1/Ut(j,j))*(A(i,j) - sum);
        
    end
end


L = Lt;
U = Ut;

% Solving primary equation L*z = b
z = zeros(n,1);

z(1) = b(1);

for i = 2:n
    sum = 0;
    
    for j = 1:i-1
        sum = sum+L(i,j)*z(j);
    end
    z(i) = b(i) - sum;
    
end

x(n) = z(n)/U(n,n);

for i = n-1:-1:1
    sum = 0;
    
    for j = i+1:n
        sum = sum+(U(i,j))*j;
    end
        
    x(i) = (z(i)-sum)/U(i,i);
end
        
end

