function [x, L, U] = callsolve_LU(A, b)

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


%%  solve
[L, U] = callcrout_LU(A);
[y] = callforward_elim(L, b);
[x] =callbackward_elim(U, y);
end