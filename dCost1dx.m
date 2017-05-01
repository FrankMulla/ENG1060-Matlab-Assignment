function [derivative] = dCost1dx(x, D, Cs, Co)
% We dont use L in the derivative so we may omit it
%
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251
% Date you wrote it : 12 - Oct - 2016
%  
% Description: Calculate the derivative of PipeCost1 wrt x
% Input Arguments
% --------------------------------
% x = distance or distances of x
% D = Perpendicula Distance to coastline 
% Cs = Cost for seas side per KM
% Co = Cost of on shore per KM
% Output
% ---------------------------------
% derivative = value(s) of the derivatives for the x;

derivative = ((Cs.*x)./sqrt(D^2 + x.^2)) - Co;
end
