function [xFixedPoint] = callFixedPoint(callgx,xGuess,xTol)

xError = 1;
xFixedPoint = xGuess;
count = 0;
while (xError >= xTol )
    xFixedPoint = callgx(xFixedPoint);
    count = count + 1;
    if(count>1)
        xError = abs((xFixedPoint - xFixedPointOld)/xFixedPoint)*100;
        eVec(count-1) = xError;
    end
    xFixedPointOld = xFixedPoint;
end
e = diff(eVec);
for i=1:length(e)-1
    if e(i+1) > e(i)
        flag = 1;
    else
        flag = 0;
    end
end


end
