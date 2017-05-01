%Q1d script

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 12 - Oct - 2016
% This m file calculates the cost of the two companies for different ranges
% of x

fprintf('\n Q1d \n\n')

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

figure;
% Plot cost from Company 2 and compare to Company 1
cost2 = PipeCost2( x, D, L, Cs2, Co2, e, a);
cost1 = PipeCost1(x, D, L, Cs1, Co1);
cost1 = cost1./(100000000);
cost2 = cost2./(100000000);
plot(x,cost1,'b-',x,cost2,'r-');
title('Distance X(Km) by Cost ($ 100M)');
legend('Company One', 'Company Two');
xlabel('Distance X(Km)');
grid on;
ylabel('Cost ($ 100M)');
hold off;