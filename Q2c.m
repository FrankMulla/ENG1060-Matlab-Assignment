% Q2c Script

% Leave any lines of MATLAB code that are already in this file
% DO NOT clear, close or clc inside this script
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 14 - Oct - 2016

fprintf(' \n Q2c \n\n')

% Setting up of base values 
col=['b','g','r','y','m','b','o'];

% Getting the raw data from the file
rawData = importdata('rtd.dat');
 
% Time will always be in the first column
time = rawData.data(:,1);

textHeaders = rawData.textdata(2,:);% second row only

% Number of reactors excluding the first column.
[numberOfDataPoints ,numberOfReactors] = size(rawData.data);
numberOfReactors = numberOfReactors-1;

% Getting the concentrations for the reactors as a matrix
concentrations = rawData.data(:,2:length(rawData.data(1,:)));

% normalise each RTD curve to be one
normalisedConcentrations = zeros(numberOfDataPoints, numberOfReactors);

% Pre allocating the space for the arrays
reactorMeanTime =  zeros(1,numberOfReactors);
normalisingValue = zeros(1,numberOfReactors);
variance = zeros(1,numberOfReactors);

% Calculating the normalised Values for the concentration for each reactor
for i = 1:numberOfReactors
    normalisingValue = SimpRule(time,concentrations(:,i));
    normalisedConcentrations(:,i) = concentrations(:,i)./normalisingValue;
end

% Calculate mean residence time, normalised standard
% Calculating the mean residence time for each reactor
for i = 1:numberOfReactors
    meanTimeDerivative = (time.*normalisedConcentrations(:,i));
    reactorMeanTime(i) = SimpRule(time,meanTimeDerivative);
end

% Calculating the variance for each reactor
for i = 1:numberOfReactors
   varianceDerivative = ((time - reactorMeanTime(i)).^2).*normalisedConcentrations(:,i);
   variance(i) = SimpRule(time,varianceDerivative);
end

% deviation and skewness for each reactor
skewness = zeros(1,numberOfReactors);
standardDeviation = (1./reactorMeanTime).*sqrt(variance);

for i = 1:numberOfReactors
   skewnessDerivative = ((time - reactorMeanTime(i)).^3).*normalisedConcentrations(:,i);
   skewness(i) = SimpRule(time,skewnessDerivative);
end

% Calculating normalised skewness using the skewness and the mean residence
% time
normalisedSkewness = (1./reactorMeanTime).*(skewness.^(1/3));

% Print the table of data to the command window
fprintf('%7s\t\t%7s\t\t%7s\t\t%6s\n','Reactor','Mean RT', 'StDev_N', 'Skew_N');
fprintf('%7g\t\t%7.2f\t\t%7.2f\t\t%6.2f\n',[(1:numberOfReactors)',reactorMeanTime',standardDeviation', normalisedSkewness']');

% Check to see if any pair is similar and print numbers if they are

% Using similiarity check function to get the similiar values
[similiar, similiarReactors] = similarityCheck(standardDeviation, normalisedSkewness);

% similiar would be false if there are no similiarities
if (similiar)
    fprintf('\n\n');
    for i=1:2:length(similiarReactors)
        fprintf('The Reactors %g and %g are similiar in operation\n',similiarReactors(i),similiarReactors(i+1));
    end
else
    fprintf('There are no similiar Reactors')
end

