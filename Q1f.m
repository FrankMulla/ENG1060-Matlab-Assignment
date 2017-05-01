% Q1f Script

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 12 - Oct - 2016
fprintf(' \n Q1f \n\n')

% Define any new variable values needed
% set distance where pipe must come ashore
L = 120; % km
D = 40; % km
Cs1 = 2500000; % per kilometer
Co1 = 2000000; % ""
Cs2Start = 2250000;
Co2 = 1800000;
a = 0.5;
e = 0.025;
x = 60;
quoteCostOne = PipeCost1(x, D, L, Cs1, Co1);
cost2 = PipeCost2(x, D, L, 2.132922968206200e+06, Co2, e, a);

% Calculate root and print the value of Cs2 where Company 2's quote is competitive
f = @(Cs2) quoteCostOne - (Cs2*(1 + 0.5*a*e*D)*(sqrt((x.^2) + (1+ e^2)*D^2)) + (L-x)*Co2);
Cs2Price = fzero(f,Cs2Start);
priceDrop = Cs2Start-Cs2Price;
priceDrop = priceDrop/1000000;
Cs2Price = Cs2Price/1000000;
fprintf('The Competetive Price for Cs2 is a Max of : $%.3fM/km or a price drop of: $%.3fM\n',Cs2Price,priceDrop);
fprintf('To Do A reason Convincing the other company to decrease the price');


