% Cost function to determine how off the number is
% Input Arguments
%   desiredSNR - The desired value we want to hit
%   currSNR - The current SNR value we are computing the cost for
% Output
%   cost - The unitless cost value. The higher the farther from the desired
function [cost] = costFunc(desiredSNR,currSNR)
%COSTFUNC Define a cost function to measure the effectiveness of the
%current values

% Simple cost function
cost = (desiredSNR - currSNR)^2;
end

