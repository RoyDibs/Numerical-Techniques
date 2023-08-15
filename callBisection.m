function [xBisection] = callBisection(callfx,xLeft,xRight,xTol)

fL = callfx(xLeft);
fR = callfx(xRight);

% check if product of fL and fR is negative
if(fL*fR > 0)
   error('Initial guesses should have different signs');
end

xError = 1;
count = 0;
while (xError >= xTol)
    xBisection = (xLeft + xRight)/2;
    fNew = callfx(xBisection);

    if(fL*fNew > 0)
        xLeft = xBisection;
        fL = fNew;
    else
        xRight = xBisection;
        fR = fNew;
    end

    count = count + 1;
    if(count > 1)
        xError = abs((xBisection - xBisecOld)/xBisection)*100;    
         eVec(count-1) = xError;
    end
    xBisecOld = xBisection;
end
xBisection = (xLeft + xRight)/2;


e = diff(eVec);
for i=1:length(e)-1
    if e(i+1) > e(i)
        flag = 1;
    else
        flag = 0;
    end
end

str1 = ['Number of iterations required = ', num2str(count)];
disp(str1);
end
