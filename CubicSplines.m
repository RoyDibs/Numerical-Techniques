function yint = CubicSplines(x,y,xint)

if any(size(x) ~= size(y)) || size(x,2) ~= 1
   error('inputs x and y must be column vectors of equal length');
end

n = length(x);

h = x(2:n) - x(1:n-1);
d = (y(2:n) - y(1:n-1))./h;

lower = h(2:end);
main  = 2*(h(1:end-1) + h(2:end));
upper = h(1:end-1);

T = spdiags([lower main upper], [-1 0 1], n-2, n-2);
rhs = 6*(d(2:end)-d(1:end-1));

m = T\rhs;

% Use natural boundary conditions where second derivative
% is zero at the endpoints

m = [ 0; m; 0];

s0 = y;
s1 = d - h.*(2*m(1:end-1) + m(2:end))/6;
s2 = m/2;
s3 =(m(2:end)-m(1:end-1))./(6*h);



for i=1:length(xint)
    jj = 0;
    for j=1:length(x)
        if xint(i)< x(j)
            jj = j;
            break;
        end
    end
   yint(i,1) = s0(jj) + s1(jj)*(xint(i)-x(jj)) + ... 
     s2(jj)*(xint(i)-x(jj)).^2 + s3(jj)*(xint(i) - x(jj)).^3;
end



end
