classdef constants
   properties( Constant = true)
        % Constants due to temperature
        Tclearsky = 13; % Temp of the clear sky in Kelvins
        Lclearsky = .2; % Loss due to clear sky in dB
        Lrain = 3; % Loss due to rain in dB
        Ledge = 3; % Losses due to edge beam
        Lmisc = 0.4; % Misc losses due to cables etc
        Lmargin = 36; % Built in clear-day link margin
        
        % Intrinsic Constants
        kdb = -228.6; % Boltzmann constant in db
   end
end