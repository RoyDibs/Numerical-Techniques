function [a] = QuadFit(x, y)

n = length(x);
m = 2;

for i=1:2*m
    xsum(i) = sum(x.^(i)); % summation term of the powers of xi
end

% first row of matrix p and first elem of vector b
p(1,1) = n;
b(1,1) = sum(y);

for j=2:m+1
    p(1,j) = xsum(j-1);
end

% remaining term of p and b
for i=2:m+1
    for j=1:m+1
        p(i,j) = xsum(j+i-2);
    end
    b(i,1) = sum(x.^(i-1).*y);
end

a_all = (p\b)';

% extracting the coefficients
for i=1:m+1
    a(i) = a_all(m+2-i);
end