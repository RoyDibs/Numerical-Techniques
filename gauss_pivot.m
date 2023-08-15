function [x] = gauss_pivot(A,b)
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

%% forward elimination

X = [A, b];
for i=1:1:length(A)-1
    % Partial pivoting
    [~,piv] = max(abs(X(i:length(A),i))); % finding the index of max absolute value in the ith column
    piv = piv + i - 1;
    temp = X(piv,:);
    if (piv ~= i)
        X(piv,:) = X(i,:);
        X(i,:) = temp;
    end

    % Echelon form
    for j=i+1:1:length(A)
        X(j,:) = X(j,:) - (X(j,i)/X(i,i))*X(i,:);
    end
end
modA = X(:,1:length(X)-1);
modb = X(:,length(X));

%%  Backward substitution

x = zeros(m2,1);

for i=n1:-1:1
    x(i,1) = (modb(i,1) - modA(i,:)*x)/modA(i,i);
end

end