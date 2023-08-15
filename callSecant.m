function [xSecant] = callSecant(callfx,xGuess,xDelta,xTol)

xError = 1;
xSecant = xGuess;
count = 0;
while (xError >= xTol )
    xSecant = xSecant - (callfx(xSecant)*xDelta*xSecant)/ (callfx(xSecant + xDelta*xSecant) - callfx(xSecant));
    count = count + 1;
    if(count>1)
        xError = abs((xSecant - xSecantOld)/xSecant)*100;
        eVec(count-1) = xError;
    end
    xSecantOld = xSecant;
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