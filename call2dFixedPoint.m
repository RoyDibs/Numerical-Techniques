function [xFixedPoint,flag] = call2dFixedPoint(f,g,xGuess,yGuess,xTol,yTol)

count = 1;
x = xGuess;
y = yGuess;
countMax = 100;
while (1)
    xNew = f(x,y);
    yNew = g(x,y);
    
    if (count>2)
        xError(count-1,1) = abs((x - xNew)/xNew) * 100;
        yError(count-1,1) = abs((y - yNew)/yNew) * 100;
        if (xError(count-1) < xTol) && (yError(count-1) < yTol)
                break;
        end
    end
    x = xNew;
    y = yNew;

    if(count > countMax)
        break;
    end
    count = count + 1;
end
xFixedPoint = [xNew; yNew];



if (count == countMax)
    flag = 1;
else
    flag = 0;
end

end