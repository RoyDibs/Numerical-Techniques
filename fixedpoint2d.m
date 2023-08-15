clc
close all
clear variables

callf = @(x,y) ((7 - y^2 - x^2) / (y));
callg = @(x,y) (9 - x^3)^(1/3);
xGuess = 1;
yGuess = 0.5;
xTol = 0.01;
yTol = 0.01;
[xFixedPoint,flag] = call2dFixedPoint(callf,callg,xGuess,yGuess,xTol,yTol)