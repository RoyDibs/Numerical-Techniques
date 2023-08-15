function [x] =callbackward_elim(U, y)


%%  CHECKS

[m1, n1] = size(U);
[m2, n2] = size(y);
if (m1 ~= n1) || (n1 ~= m2)
    error("U should be a square matrix and y should have compatible dimensions")
end
f1 = isnumeric(U);
f2 = isnumeric(y);
if (~f1) || (~f2)
    error("U  and y should contain numerical values")
end
for i=1:1:length(U)
    if (U(i,i) == 0)
        error("diagonal element of matrix U should have non-zero value")
    end
end

for i=2:1:length(U)
    for j=1:1:i-1
        if(U(i,j) ~= 0)
            error("Lower-triangular part of matrix U should contain zero")
        end
    end
end


%% Calculate x

x = zeros(n1,1);

for i=n1:-1:1
    x(i,1) = (y(i,1) - U(i,:)*x)/U(i,i);
end

end