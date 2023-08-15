function [iTrapezoid] = callTrapezoid(callfx,xLeft,xRight,deltaX)

n = (xRight - xLeft)/ deltaX;
fi = callfx(xLeft);
deltaX1 = 0;
for i = 2:1:n-1
    deltaX1 = deltaX*(i-1);
    fi = fi + callfx(xLeft + deltaX1);  
end

iTrapezoid = (deltaX/2) * (callfx(xLeft) + 2*fi + callfx(xRight));

end