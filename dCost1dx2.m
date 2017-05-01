function [secondDerivative] = dCost1dx2(X,D,Cs)
% function [derivative] = dCost1dx2(X,D,Cs)
% Description: Calculate 2nd derivative of PipeCost1 wrt x
% Input Arguments
% --------------------------------
% x = distance or distances of x
% D = Perpendicula Distance to coastline 
% Cs = Cost for seas side per KM
% Output
% ---------------------------------
% secondDerivative = value(s) of the derivatives for the x;
% Your name: Takudzwa Frank Mukarakate
% Your student ID: 27754251

secondDerivative = ((Cs*D^2)./((D^2+X.^2).^(3/2)));

end

