function [etrue] = callcosseries(x,n)

trueVal = cos(x);
approxVal = 1;

for i=1:1:n
    currentTerm = (-1)^i * x^(2*i)/factorial(2*i);
    approxVal = approxVal + currentTerm;
end
 etrue = abs((trueVal - approxVal)/trueVal); % relative error

end