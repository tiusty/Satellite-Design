% Input Arguments
%   Pt - Transmit power in Watts
%   Gt - Transmit gain in dBi
%   Gr - Receiver Gain in dBi
%   f - Frequency of the signal
%   r - Distance of the signal
%   objectiveSpecs - the system specs to use based on objective
%   weather - Weather condtions (weatherConditions enum)
% Output Arguments
%   output - Carrier Power in dB
function [output] = calculateCarrierPowerDb(Pt, Gt, Gr, f, r, weather, objectiveSpecs)
%CALCULATECARRIERPOWER All Inputs/Outputs are in DBS
%    Calculates the Carrier Signal Power i.e the C in C/N

output = 10*log10(Pt) + Gt + Gr + calculatePathLoss(f, r) - calculateExtraLossesDb(weather, objectiveSpecs);
end

