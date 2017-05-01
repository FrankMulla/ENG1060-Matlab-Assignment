function [root] = NewtRaph(f, df, xI, precision)

%  Newton Raphson root finder
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 04 - Oct - 2016
% Inputs Arguments
% -----------------------------------
% f = function handle for the equation to be solved
% df = function handle for the derivativeof the equation to be solved
% xI = the initial guess
% precision = stopping criteria determined by the user
%
% Output
% -----------------------------------
% root = the root of the equation to the precision 

% calculate f(xI) and f'(xI) [initial values]

fxI = f(xI); 
dfxI = df(xI);

%iteration for Newton-Raphson starts
while (abs(fxI) > precision)
    xI = xI - fxI/dfxI;     % calculate the new root
    fxI = f(xI);            % re-calculate f(xI)
    dfxI = df(xI);          % re-calculate dervitive of xI
end
root = xI;                  % The Final root value is the last xI 
end

