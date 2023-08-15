function [a, Er, y ] = LinReg(xdata,ydata,x)
%% determine a
a = zeros(2,1);
n = length(xdata);
on = ones(length(xdata),1);

% a(2,1) = ((n*sum(xdata.*ydata)) - (sum(xdata)*sum(ydata))) / ((n*sum(xdata.^2)) - (sum(xdata))^2);
% a(1,1) = (sum(ydata)/n) - a(2,1)*(sum(xdata)/n)

z = [on,xdata'];
a = (inv(z'*z))*z'*ydata';

%% determine y
    y = a(2,1).*x + a(1,1);

%% determine Er

er = zeros(length(ydata),1);
for i=1:1:length(ydata)
    y1 = a(2,1)*xdata(i) + a(1,1);
    er(i,1) = ydata(i) - y1;
end

Er = sum(er.^2);

end