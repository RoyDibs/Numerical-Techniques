function [xGolden] = callGolden(callf,xLeft,xRight,xTol)

R = (sqrt(5) - 1)/2;

fxL = callf(xLeft);
fxR = callf(xRight);
xError = 1;
count = 0;

while xError >= xTol
    xL = xRight - R*(xRight - xLeft);
    xR = xLeft - R*(xRight - xLeft);
    fNew1 = callf(xL);
    fNew2 = callf(xR);
if fxL < fxR
    xNew = xR;
    xRight = xNew;
     fxR = fNew2;
else
    xNew = xL;
    xLeft = xNew;
     fxL = fNew1;
end

xError = abs(xRight - xLeft);
xGolden = (xRight + xLeft)/2;
count = count + 1;
    if(count > 1)
        xErr = abs((xGolden - xGoldenOld)/xGolden)*100;    
         eVec(count-1) = xErr;
    end
    xGoldenOld = xGolden;
end

a = diff(eVec);
for i=1:length(a)-1
    if a(i+1) > a(i)
        flag = 1;
    else
        flag = 0;
    end
end

end