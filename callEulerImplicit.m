function [eulerImplicit] = callEulerImplicit(g,finitial,xinitial,deltaX,xFinal)

x = xinitial:deltaX:xFinal;
g = zeros(length(x),1);
for i = 1:(length(x)-1)
        g(i+1) = (g(i)+((2001+1000*(xinitial+i*deltaX))*deltaX))/(1+1000*deltaX);
end
eulerImplicit = g;
plot(x,eulerImplicit)
end

