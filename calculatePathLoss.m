% Input Arugments
%   f - in Hertz
%   r - in Meters
% Output Arguments
%   output - loss in dB due to path 

function [output] = calculatePathLoss(f, r)
%CALCULATEPATHLOSS Loss due to path loss
% Units in Db

waveLength = physconst('LightSpeed')/f;

output = 20*log10(waveLength/(4*pi*r));
end

