% Input Arguments
%   Pt - Transmit power in Watts
%   Gt - Transmit gain in dBi
%   Gr - Receiver Gain in dBi
%   f - Frequency of the signal
%   r - Distance of the signal
% Output Arguments
%   output - Carrier Power in dB
function [output] = calculateCarrierPowerDb(Pt, Gt, Gr, f, r)
%CALCULATECARRIERPOWER All Inputs/Outputs are in DBS
%    Calculates the Carrier Signal Power i.e the C in C/N

output = 10*log10(Pt) + Gt + Gr + calculatePathLoss(f, r) - calculateExtraLossesDb();
end

