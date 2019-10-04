% Input Arguments
%   weather - Weather condtions (weatherConditions enum)
% Output Arguments
%   output - Output losses in dB
function [output] = calculateExtraLossesDb(weather)
%MISCLOSSES Calculates Misc losses such as due to clear sky, rain sky etc
% All units in db

Lrain = 0; % Loss due to rain conditions
if (weather == weatherConditions.rain)
    Lrain = constants.Lrain;
end

output = constants.Lmisc + constants.Lclearsky + constants.Ledge + constants.Lmargin + Lrain;
end

