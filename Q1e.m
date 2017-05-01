%Q1e Script

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 12 - Oct - 2016
% This m file calculates the cost for two companies to lay down pipes and
% then calculates the point of intersection

fprintf(' \n Q1e \n\n');

% Define any new variable values needed

L = 120; % km
D = 40; % km
Cs1 = 2500000; % per kilometer
Co1 = 2000000; % ""
Cs2 = 2250000; % per kilometer
Co2 = 1800000; % per kilometer
a = 0.5; % Alpha
e = 0.025; % Eps
x = linspace(0,121,120);

% Working out the costs
cost2 = PipeCost2( x, D, L, Cs2, Co2, e, a);
cost1 = PipeCost1(x, D, L, Cs1, Co1);

% Need to frame Q1e as a root finding problem.
% f = PipeCost2 - PipeCost1 equations as they are equal at the root
f = @(X) (Cs2*(1 + 0.5*a*e*D)*(sqrt((X.^2) + (1+ e^2)*D^2)) + (L-X)*Co2) - ((sqrt(D^2 + X.^2) * Cs1) + ((L-X).*Co1)); 

% Find root and print distance where 2 quotes are the same (and the costs)
intersectionPoint = fzero(f,30);

%Checking values of intersection 
intersectionCost2 = PipeCost2(intersectionPoint, D, L, Cs2, Co2, e, a);
intersectionCost1 = PipeCost1(intersectionPoint, D, L, Cs1, Co1);

% Printing the results
fprintf('The Distance where cost intersections occurs is: %.3f Km''s\n',intersectionPoint);
fprintf('The Corresponding Cost for company One is: $%.3f M/Km\n',intersectionCost1/1000000);
fprintf('The Corresponding Cost for company Two is: $%.3f M/Km\n',intersectionCost2/1000000);
