function [y] = callforward_elim(L, b)


%%  CHECKS

[m1, n1] = size(L);
[m2, n2] = size(b);
if (m1 ~= n1) || (n1 ~= m2)
    error("L should be a square matrix and b should have compatible dimensions")
end
f1 = isnumeric(L);
f2 = isnumeric(b);
if (~f1) || (~f2)
    error("L  and b should contain numerical values")
end
for i=1:1:length(L)
    if (L(i,i) == 0)
        error("diagonal element of matrix L should have non-zero value")
    end
end

for i=1:1:length(L)
    for j=i+1:1:length(L)
        if(L(i,j) ~= 0)
            error("upper-triangular part of matrix L should contain zero")
        end
    end
end


%% Calculate y

y = zeros(n1,1);

for i=1:1:n1
    y(i,1) = (b(i,1) - L(i,:)*y)/L(i,i);
end

end