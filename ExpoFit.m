function [b,m] = ExpoFit(x,y)

tol = 0.0001;
a = [1 1]; % initial guess
iter_max = 50;
n = length(x);


for iter=1:iter_max
    b = a(1);
    m = a(2);

    for i=1:n
        f(i) = b * exp(m * x(i));
        j(i,1) = exp(m * x(i));
        j(i,2) = b * x(i) * exp(m * x(i));
        d(i) = y(i) - f(i);
    end

    aOld = a;
    da = (j' * j)\(j' * d');
    a = a + da';


     %check convergence
    if (abs((a(1) - aOld(1))/a(1)) < tol) && (abs((a(2) - aOld(2))/a(2)) < tol)
        break;
    end
end
b = a(1);
m = a(2);

end
