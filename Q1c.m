% Q1c script

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 13 - Oct - 2016
% This mfile calculates the optimal values for x and cost when varying d
% for the ranges of x

fprintf('\n Q1c \n\n')

% Define any variables (pre-allocate as needed)
D = 1:1:80; % Km
L = 120;  % Km
Cs1 = 2500000; % per kilometer
Co1 = 2000000; % ""
x = linspace(0,121,120); % 121 points between 0 to 120 km's

% Calculate optimal distance 'x' for different D
minimumCosts = zeros(1,length(D));
minimumXDistance(D) = zeros(1,length(D));

% Working out the minimum distance for each Distance (D)
for D = 1:1:80; % Km
    f = @(X) dCost1dx(X, D, Cs1, Co1);
    df = @(X) dCost1dx2(X,D,Cs1);
    minimumXDistance(D) = NewtRaph(f, df, 0.0, 0.001);
    minimumCosts(D) = PipeCost1(minimumXDistance(D), D, L, Cs1, Co1);
end

D = 1:1:80; % Km
%plot x vs D  and cost vs D in vertically stacked subplots
figure;
subplot(2,1,1);
plot(D,minimumXDistance,'b-');
title('Distance (D) against optimal X');
xlabel('Distance (D)');
ylabel('Optimal X');
grid on;
hold off;

% Plotting the second data point for the minimum
subplot(2,1,2);
minimumCosts = minimumCosts/100000000; % Units of 100M
plot(D , minimumCosts, 'r-');
title('Distance (D) against Minimum Cost');
xlabel('Distance (Km)');
ylabel('Cost $(100M)');
grid on;
hold off;