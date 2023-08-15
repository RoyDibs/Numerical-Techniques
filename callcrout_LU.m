function [L, U]=callcrout_LU(A)

%%  CHECKS

[m1, n1] = size(A);
f1 = isnumeric(A);
if (m1 ~= n1)
    error("A should be a square matrix")
elseif (~f1) 
    error("A should contain numerical values only ")
end

L = zeros(n1);
U = eye(n1);

%% forward elimination

U = A;
L = eye(n1);
for i=1:1:length(A)-1
    for j=i+1:1:length(A)
        L(j,i) = U(j,i)/U(i,i);
        U(j,:) = U(j,:) - (U(j,i)/U(i,i))*U(i,:);
    end
end


%% Transforming U And L as per crouts

diag = zeros(n1);
invDiag = zeros(n1);

for i=1:1:m1
    diag(i,i) = U(i,i);
    invDiag(i,i) = 1/U(i,i);
end

L = L*diag;
U = invDiag*U;

%% check of zero diagonal element in L
for i=1:1:m1
    if (L(i,i) == 0)
        error("diagonal element of L becomes zero")
    end
end
end
