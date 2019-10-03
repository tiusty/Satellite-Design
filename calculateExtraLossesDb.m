% Input Arguments
% Output Arguments
%   output - Output losses in dB
function [output] = calculateExtraLossesDb()
%MISCLOSSES Calculates Misc losses such as due to clear sky, rain sky etc
% All units in db

output = constants.Lmisc + constants.Lclearsky + constants.Ledge + constants.Lmargin;
end

