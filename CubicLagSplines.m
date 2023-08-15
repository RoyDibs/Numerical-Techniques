function [yint] = CubicLagSplines(x,y,xint)

n = length(x);
idx = find(xint >= x, 1, 'last');

% select data points for interpolation
if idx == 1
    xi = x(1:3);
    yi = y(1:3);
elseif idx == n
    xi = x(n-2:n);
    yi = y(n-2:n);
else
    xi = x(idx-1:idx+2);
    yi = y(idx-1:idx+2);
end

x=xi;
y=yi;

ni = length(xi);

for i = 1 : ni
    L(i) = 1;
    for j = 1 : ni
        if (j ~= i)
            L(i) = L(i)*((xint - x(j))/(x(i) - x(j))); % lagrange function
        end
    end
end

yint = sum(y.*L);

end