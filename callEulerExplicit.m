function [eulerExplicit] = callEulerExplicit(f1,finitial,xinitial,deltaX,xFinal)

for i = 1:(length(xinitial:deltaX:xFinal))
    eulerExplicit(i,1) = finitial + f1(xinitial,finitial)*deltaX;
    finitial = eulerExplicit(i,1);
    xinitial = xinitial + deltaX;
end

end