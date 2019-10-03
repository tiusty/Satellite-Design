% Input Arguments
%   Pt - Transmit power in Watts
%   Gt - Transmit gain in dBi
%   Gr - Receiver Gain in dBi
%   f - Frequency of the signal
%   r - Distance of the signal
%   tsys - Temperature of system in Kelvin
%   weather - Weather condtions (weatherConditions enum)
% Output Arguments
%   output - SNR of the system
function [output] = calculateSNR(Pt, Gt, Gr, f, b, r, tsys, weather)
%CALCULATESNR calculates the SNR for the given system

output = calculateCarrierPowerDb(Pt, Gt, Gr, f, r) - calculateNoisePowerDb(tsys, b, weather);
end

