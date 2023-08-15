function [modA, modb]= fwd_elim(A,b)

%%  CHECKS

[m1, n1] = size(A);
[m2, n2] = size(b);
if (m1 ~= n1) || (n1 ~= m2)
    error("A should be a square matrix and b should have compatible dimensions")
end
f1 = isnumeric(A);
f2 = isnumeric(b);
if (~f1) || (~f2)
    error("A  and b should contain numerical values")
end

for i=1:1:length(A)
    if (A(i,i) == 0)
        error("diagonal element of matrix A should have non-zero value")
    end
end


%% forward elimination

X = [A, b];
for i=1:1:length(A)-1
    for j=i+1:1:length(A)
        X(j,:) = X(j,:) - (X(j,i)/X(i,i))*X(i,:);
    end
end
modA = X(:,1:length(X)-1);
modb = X(:,length(X));

end