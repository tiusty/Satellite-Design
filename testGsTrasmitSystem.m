classdef testGsTrasmitSystem
    %TESTGSTRASMITSYSTEM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % Phsyical properties of the system
        f = 83 * 10^9 % 83 GHZ transmit signal frequency
        bandwidth = 6*10^6; % 6MHz transmit bandwidth
        
        % Test Parameters
        Gant = struct('min', 20, 'max', 60, 'weight', 2, 'curr', 20);
        Pt = struct('min', 1000, 'max', 5000, 'weight', 3, 'curr', 1000);
    end
end

