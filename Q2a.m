% Q2a Script

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 14 - Oct - 2016

fprintf(' \n Q2a \n\n');

col=['b','g','r','y','m','b','o'];

% Import the RTD data
rawData = importdata('rtd.dat');
% Time will always be in the first column
time = rawData.data(:,1);
textHeaders = rawData.textdata(2,:);% second row only
% Number of reactors excluding the first column.
[numberOfDataPoints ,numberOfReactors] = size(rawData.data);
numberOfReactors = numberOfReactors - 1;

% Printing the number of reactors
fprintf('This data set has %.0f number of reactors\n', numberOfReactors);

% Getting the concentrations for the reactors as a matrix
concentrations = rawData.data(:,2:length(rawData.data(1,:)));
% Plot data in a figure

%Using a for loop to compact and generalise the code
for i = 1:numberOfReactors
plot(time, concentrations(:,i),col(i));
hold on;
end
% Legend using the cells of textHeader
title(rawData.textdata(1,1));
legend(textHeaders(2:length(textHeaders)));
xlabel(textHeaders(1));
ylabel('Concentrations for different reactors');
grid on;
hold off;


