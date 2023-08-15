function[x] = GaussSeidelm(A,b,x0,e);
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
%% Gauss Seidal
x = x0;
e_vec = zeros(length(x),1);
while (true)
    for i = 1:1:length(x0)
        xOld = x(i,1);
        x(i,1) = (1/A(i,i))*(b(i,1) - A(i,1:i-1)*x(1:i-1,1) - A(i,i+1:length(A))*x(i+1:length(A),1));
        e_vec(i) = abs((x(i,1) - xOld)/x(i,1));
    end
    if (max(e_vec) < e)
        break;
    end
end
end

