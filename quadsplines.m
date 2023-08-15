function yint = quadsplines(x,y,xint)

A = zeros(3*(length(x)-1) - 1);
j = 0;
A(1,1) = x(1);
A(1,2) = 1;
A(2,1) = x(2);
A(2,2) = 1;

for i = 3:2:((length(x)-1)*2)
    A(i,i+j) = (x(j+2))^2;
    A(i,i+j+1) = x(j+2);
    A(i,i+j+2) = 1;

    A(i+1,i+j) = (x(j+3))^2;
    A(i+1,i+j+1) = x(j+3);
    A(i+1,i+j+2) = 1;
    j = j+1;
end

k = 3;
m = 3;
for i=2*(length(x)-1)+2:3*(length(x)-1)-1
    A(i,k) = 2*x(m);
    A(i,k+1) = 1;
    A(i,k+2) = 0;
    A(i,k+3) = -2*x(m);
    A(i,k+4) = -1;

    k = k+3;
    m = m+1;
end

n = 2*(length(x)-1)+1;
A(n,1) = 1;
A(n,2) = 0;
A(n,3) = -2*x(2);
A(n,4) = -1;


ab = zeros(3*(length(x)-1)-1,1);
ab(1,1) = y(1);
ab(((length(x)-1)*2),1) = y(end);

cc = 2;
for i=2:2:((length(x)-1)*2)-2-1
    ab(i,1) = y(cc);
    ab(i+1,1) = y(cc);
    cc = cc + 1;
end

param = A\ab;


yint = zeros(1,length(xint));

yint(1) = param(9,1)*(xint(1))^2 + param(10,1)*xint(1) + param(11,1);
yint(2) = param(21,1)*(xint(2))^2 + param(22,1)*xint(2) + param(23,1);


end