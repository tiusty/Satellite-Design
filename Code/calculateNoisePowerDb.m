% Input Arguments
%   tsys - system temp in kelvin (linear)
%   bandwidth - bandwidth in Hz (linear)
%   weather - the desired weather (weatherConditions enum)
% Output Arguments
%   output - Noise power in dB
function [output] = calculateNoisePowerDb(tsys, bandwidth, weather)
%CALCULATENOISEPOWER Calculate the NoisePower
t = 10*log10(tsys); % System temp in dB
b = 10*log10(bandwidth); % Bandwidth in db
deltaN = 0; % Extra noise due to rainy conditions

% Add extra noise due to rainy conditions if desired
if (weather == weatherConditions.rain)
    % Total loss is due to clear sky + rain
    La = constants.Lclearsky + constants.Lrain;
    Tsky = 270*(1-(1/La));
    deltaTsky = Tsky - constants.Tclearsky;
    Tsrain = constants.Tclearsky + deltaTsky;
    deltaN = 10*log10(Tsrain/Tsky);
end

output = constants.kdb + t + b + deltaN;
end

