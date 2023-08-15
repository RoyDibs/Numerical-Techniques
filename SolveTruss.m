function [F,delL] = SolveTruss(A,b)

LAB = 12; % (in m)
LCD = 8; % (in m)
LGF = 10; % (in m)
E = 70 * 10^(6); % (in KN/m^2) 
Ar = 25 * 10^(-4); % (in m^2)
P = 40; %(in KN)

L = [LAB;LCD;LGF];
delL = zeros(3,1);

[F] = gauss_pivot(A,b);
 
for i=1:1:3
    delL(i,1) = (F(i,1)*L(i,1))/(E*Ar);
end
end