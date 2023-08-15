function [xNewton] = callNewton(callfx,callf1x,xGuess,xTol)

xNewton = xGuess;
xError = 1;
count = 0;
while (xError >= xTol)
    xNewton = xNewton  - callfx(xNewton)/callf1x(xNewton);
    count = count + 1;
    if(count>1)
        xError = abs((xNewton - xNewtonOld)/xNewton)*100; 
        eVec(count-1) = xError;
    end
    xNewtonOld = xNewton;
end

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