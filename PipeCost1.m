function [totalCost] = PipeCost1( x, D, L, Cs, Co )
% function [totalCost] = PipeCost1( x, D, L, Cs, Co )
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it : 12 - Oct - 2016
%
% Description: Calculate total pipeline cost from Company 1
% Input Arguments
% --------------------------------
% x = distance or distances of x
% D = Perpendicular Distance to coastline
% L = Parallel distnce to the Plant
% Cs = Cost for seas side per KM
% Co = Cost of on shore per KM
% Output
% ---------------------------------
% totalCost = total cost of the piping

subSeaDistance = sqrt(D^2 + x.^2);
subSeaCost = subSeaDistance * Cs;
onShoreCost = (L-x).*Co;
totalCost = subSeaCost +onShoreCost;

end

