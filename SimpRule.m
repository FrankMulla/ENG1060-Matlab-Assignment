function [Integral] = SimpRule(t, f)
% function [Integral] = SimpRule(t, f)
% This function calculate an integral using Simpson's rule
% on evenly spaced data in f (specified at times in t)
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 13 - Oct - 2016
%
% Input Arguments
% --------------------------------
% t = independent variable vector
% f = dependent variable vector
% Output
% ---------------------------------
% Integral = the integral acrross the length of the given vectors 

% check to see if we have odd number of points, and change if not
n = length(t);
if (mod(n,2) == 0)
% The number of points are even
 error('There are an even number of points please use another method or enter vectors with an odd number of points');
else
    % Setting up variable
    b = max(t);
    a = t(1);
    h = (b - a)/(n - 1);
    innerEvenArea = 0;
    innerOddArea = 0;

    for xn_even = a + h:2*h:b-h
        innerEvenArea = innerEvenArea + 4*f(xn_even);
    end
    for xn_odd = a + 2*h : 2*h : b - 2*h
        innerOddArea = innerOddArea + 2*f(xn_odd);
    end
    
    % Estimate integral
    % when t = 0 f = 0 so f(a) = 0
    Integral = (h/3)*(f(1) + innerEvenArea + innerOddArea + f(b));
end
end