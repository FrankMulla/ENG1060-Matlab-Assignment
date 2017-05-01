function [totalCost] = PipeCost2( x, D, L, Cs, Co, eps, alpha )
% function [totalCost] = PipeCost2( x, D, L, Cs, Co, eps, alpha )
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it : 12 - Oct - 2016
%
% Description: Calculate total pipeline cost from Company 2
% Input Arguments
% --------------------------------
% x = distance or distances of x
% D = Perpendicular Distance to coastline
% L = Parallel distnce to the Plant
% Cs = Cost for seas side per KM
% Co = Cost of on shore per KM
% eps = epsilon value
% aplha = aplha value
% Output
% ---------------------------------
% totalCost = total cost of the piping

Css = Cs*(1 + 0.5*alpha*eps*D)*(sqrt((x.^2) + (1+ eps^2)*D^2));
Co = (L-x)*Co; 
totalCost = Css + Co;
end
