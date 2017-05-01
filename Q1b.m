% Q1b script

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 12 - Oct - 2016
% This m file invokes the newton raphson function to find the lowest point
% of the derivative corresponding to the minimum cost calculated.

fprintf('\n Q1b \n\n');

% Setting up variables
D = 40; % Km
L = 120;  % Km
Cs1 = 2500000; % per kilometer
Co1 = 2000000; % per kilometer
x = linspace(0,121,120); % 121 points between 0 to 120 km's

% plot derivative function dCost1dx
derivatives = dCost1dx(x, D, Cs1, Co1);
figure;
plot(x,derivatives);
title('Derivatives of total costs for distcances of x');
xlabel('x(Km''s)');
ylabel('Total Cost Derivative($/Km)');
grid on;
hold off;

% find the minimum cost using Newton-Raphson method
f = @(X) dCost1dx(X, D, Cs1, Co1);
df = @(X) dCost1dx2(X,D,Cs1);

minimumDistance = NewtRaph(f, df, 0.0, 0.001);
minimumCost = PipeCost1(minimumDistance, D, L, Cs1, Co1);
minimumCost = minimumCost / 1000000;

% Printing the results of the root finding
fprintf('The minimum cost of the pipes: $%3.0fM\nThe minimum distance x for the cost is: %3.1f Km''s\n',minimumCost, minimumDistance);