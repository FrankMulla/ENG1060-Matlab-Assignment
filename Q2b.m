% Q2b Script

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 13 - Oct - 2016

fprintf(' \n Q2b \n\n');

% Getting the raw data from the file
rawData = importdata('rtd.dat');

% Time will always be in the first column
time = rawData.data(:,1);
textHeaders = rawData.textdata(2,:);% second row only
% Number of reactors is the number of columns excluding the first column.
[numberOfDataPoints ,numberOfReactors] = size(rawData.data);
numberOfReactors = numberOfReactors-1;
% Getting the concentrations for the reactors as a matrix
concentrations = rawData.data(:,2:length(rawData.data(1,:)));

% normalise each RTD curve to be one
normalisedConcentrations = zeros(numberOfDataPoints, numberOfReactors);
normalisingValue = zeros(1,numberOfReactors);
% Calculating column by column
for i = 1:numberOfReactors
    normalisingValue(i) = SimpRule(time,concentrations(:,i));
    normalisedConcentrations(:,i) = concentrations(:,i)./normalisingValue(i);
end

% Plot the normalised curves
% Using a for loop to compact the code plotting each column/reactor at a
% time
for i = 1:numberOfReactors
    plot(time, normalisedConcentrations(:,i),col(i));
    hold on;
end

% Legend using the cells of textHeader
title(sprintf('%s %s',strjoin(rawData.textdata(1,1)),'(Normalised)'));
legend(textHeaders(2:length(textHeaders)));
xlabel(textHeaders(1));
ylabel('Concentrations for different reactors');
grid on;

% Printing the normalising values
fprintf('The normalising value for reactor %3.0f is %.5f\n', [(1:numberOfReactors)',normalisingValue']');
