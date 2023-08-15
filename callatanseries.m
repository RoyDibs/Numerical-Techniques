function [etrue] = callatanseries(x,n)

trueVal = atan(x);
approxVal = 0;

for i=1:1:n
    currentTerm = (-1)^(i-1) * x^((2*i)-1)/((2*i)-1);
    approxVal = approxVal + currentTerm;
end
etrue = abs(trueVal - approxVal);
end