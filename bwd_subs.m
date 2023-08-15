function [x] = bwd_subs(modA,modb)

%%  CHECKS

[m1, n1] = size(modA);
[m2, n2] = size(modb);
if (m1 ~= n1) || (n1 ~= m2)
    error("A should be a square matrix and b should have compatible dimensions")
end
f1 = isnumeric(modA);
f2 = isnumeric(modb);
if (~f1) || (~f2)
    error("A  and b should contain numerical values")
end

for i=1:1:length(modA)
    if (modA(i,i) == 0)
        error("diagonal element of matrix A should have non-zero value")
    end
end

%%  Backward substitution

x = zeros(m2,1);

for i=n1:-1:1
    x(i,1) = (modb(i,1) - modA(i,:)*x)/modA(i,i);
end

end
