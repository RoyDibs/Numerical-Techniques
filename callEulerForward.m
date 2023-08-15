function [eulerForward] = callEulerForward(f1,finitial,xinitial,deltaX,xFinal)

for i = 1:(length(xinitial:deltaX:xFinal)
    eulerForward(i,1) = finitial + f1(xinitial,finitial)*deltaX;
    finitial = eulerForward(i,1);
    xinitial = xinitial + deltaX;
end

end