function [xNewton,yNewton] = callNewton2D(callf,callf1x,callf1y,callg,callg1x,callg1y,xGuess,yGuess,xTol,yTol)

xNewton = xGuess;
yNewton = yGuess;
xError = 1;
yError = 1;
count = 0;
while (xError >= xTol) || (yError >= yTol)
    f1x = callf1x(xNewton,yNewton);
    f1y = callf1y(xNewton,yNewton);
    g1x = callg1x(xNewton);
    g1y = callg1y(yNewton);
    
    % Calculate the values of f(x,y) and g(x,y).
    f = callf(xNewton,yNewton);
    g = callg(xNewton,yNewton);

    % Jacobian matrix
    J = [f1x f1y; g1x g1y];
    B = J\[f;g];
    
    xNewton = xNewton - B(1);
    yNewton = yNewton - B(2);

    
    count = count + 1;
    if(count>1)
        xError = abs((xNewton - xNewtonOld)/xNewton)*100; 
        yError = abs((yNewton - yNewtonOld)/yNewton)*100;
        eVecx(count-1) = xError;
        eVecy(count-1) = yError;

    end
    xNewtonOld = xNewton;
    yNewtonOld = yNewton;
end

ex = diff(eVecx);
ey = diff(eVecy);
for i=1:length(ex)-1
    if ex(i+1) > ex(i) || ey(i+1) > ey(i)
        flag = 1;
    else
        flag = 0;
    end
end
end