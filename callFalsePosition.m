function [xFalsePosition] = callFalsePosition(callfx,xLeft,xRight,xTol)

fL = callfx(xLeft);
fR = callfx(xRight);

% check if product of fL and fR is negative
if(fL*fR > 0)
   error('Please enter correct Initial guesses');
end

xError = 1;
count = 0;
while (xError >= xTol)
    xFalsePosition = ((xLeft)*fR - xRight*fL)/(fR - fL);
    fNew = callfx(xFalsePosition);

    if(fL*fNew > 0)
        xLeft = xFalsePosition;
        fL = fNew;
    else
        xRight = xFalsePosition;
        fR = fNew;
    end

    count = count + 1;
    if(count > 1)
        xError = abs((xFalsePosition - xFalsePositionOld)/xFalsePosition)*100;    
         eVec(count-1) = xError;
    end
    xFalsePositionOld = xFalsePosition;
end
xFalsePosition = ((xLeft)*fR - xRight*fL)/(fR - fL);


e = diff(eVec);
for i=1:length(e)-1
    if e(i+1) > e(i)
        flag = 1;
    else
        flag = 0;
    end
end


end