function [heuns] = callHeuns(f1,finitial,xinitial,deltaX,xFinal)


for i = 1:((xinitial+xFinal)/deltaX)
    finitiale = finitial + f1(xinitial,finitial)*deltaX;
    heuns(i,1) = finitial + (f1(xinitial,finitial) + f1(xinitial+deltaX,finitiale))*deltaX/2;
    finitial = heuns(i,1);
    xinitial = xinitial + deltaX;
end

end