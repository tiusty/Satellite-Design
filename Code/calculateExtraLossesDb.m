% Input Arguments
%   weather - Weather condtions (weatherConditions enum)
%   objectiveSpecs - the system specs to use based on criteria
% Output Arguments
%   output - Output losses in dB
function [output] = calculateExtraLossesDb(weather, objectiveSpecs)
%MISCLOSSES Calculates Misc losses such as due to clear sky, rain sky etc
% All units in dbL_{

Lrain = 0; % Loss due to rain conditions
if (weather == weatherConditions.rain)
    Lrain = constants.Lrain;
end

output = constants.Lmisc + constants.Lclearsky + constants.Ledge + objectiveSpecs.Lmargin + Lrain;
end

