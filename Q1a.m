% Q1a

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 13 - Oct - 2016
% This m file calculates the total cost of pipe from a company given its
% prices on seaside and onshore per kilometer

fprintf('\n Q1a \n\n');

% Set fixed variables

D = 40; % Km
L = 120;  % Km
Cs1 = 2500000; % per kilometer
Co1 = 2000000; % ""
x = linspace(0,121,120); % 121 points between 0 to 120 km's

% plot cost as a function of xlabel
costs = PipeCost1(x, D, L, Cs1, Co1);
costs = costs./(100000000);
figure;
plot(x,costs);
title('Distance X(Km) by Cost ($100M)');
% No legend as there is only one set of data being plotted
xlabel('Distance X');
ylabel('Cost ($100M)');
grid on;
hold off;




