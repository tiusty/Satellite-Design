% Input Arguments
%   Pt - Transmit power in Watts
%   Gt - Transmit gain in dBi
%   Gr - Receiver Gain in dBi
%   f - Frequency of the signal
%   r - Distance of the signal
%   tsys - Temperature of system in Kelvin
%   weather - Weather condtions (weatherConditions enum)
%   objectiveSpecs - the desired specs to use for the system
% Output Arguments
%   output - SNR of the system
function [output, C, N] = calculateSNR(Pt, Gt, Gr, f, b, r, tsys, weather, objectiveSpecs)
%CALCULATESNR calculates the SNR for the given system
C = calculateCarrierPowerDb(Pt, Gt, Gr, f, r, weather, objectiveSpecs);
N = calculateNoisePowerDb(tsys, b, weather);
output = C - N;
end

