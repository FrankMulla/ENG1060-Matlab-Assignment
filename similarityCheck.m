function [similiar, reactors] = similarityCheck(On, Sn)
% [similiar, reactors] = similarityCheck(standardDeviation, normalisedSkewness);
% This function calculates if there are similiarly operating reactors given
% their standard deviation and normalised skewness
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it: 13 - Oct - 2016
%
% Input Arguments
% --------------------------------
% Sn = standard Deviation value(s)
% On= normalised Skewness value(s)
%
% Output
% ---------------------------------
% similiar = true if there are one or more similiarities
% reactors = vector of pairs of similiar reactors

similiar = false;

% Checking if th input data is valid 
numberOfReactors = length(On);
if(numberOfReactors ~=length(Sn))
    error('The number of values for standard deviation are not equal to the values of skewness');
end
% Keeping track of where to put the pairs
index = 1;

% Worst case scenario when they are all similiar
reactors = zeros(1,factorial(numberOfReactors-1));

% Iterating through the combinations of reactors at once.
for i = 1:numberOfReactors - 1
    
    for j = i+1:numberOfReactors
    skewDifference = 2*((abs(Sn(i)-Sn(j))/(abs(Sn(i))+abs(Sn(j))))*100);
    standardDifference =2*((abs(On(i)-On(j))/(abs(On(i))+abs(On(j))))*100);
    
    if (skewDifference <= 10) && (standardDifference <= 10)
        reactors(index) = i;
        reactors(index+1) = j;
        index = index +2;
    end
    end
end

% Using a logical to remove the un used spots
valid = logical(reactors);
reactors = reactors(valid);

% Checking if there are any similiarities
if (~isempty(reactors))
    similiar = true;
end
end

