function [d] = callbin2int(b)

%% Check for valid input
if (length(b) > 20) || (~isvector(b)) || (~isnumeric(b)) || (any(b ~= 0 & b~=1))
    error('Please enter a valid binary input');
end


%% binary to decimal conversion
n = length(b);
d = 0;
for  i = n:-1:1
    d = d + b(i)*2^(n-i);
end