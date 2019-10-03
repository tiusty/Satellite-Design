classdef gsTrasmitSystemA
    % The ground station that trasmits to the satellite
   properties
        % Phsyical properties of the system
        Gtant = 60; % The transmit antenna directivity in dB
        Pt = 2000; % Power of the transmitted signal in Watts 
        f = 83 * 10^9 % 83 GHZ transmit signal frequency
        bandwidth = 6*10^6; % 6MHz transmit bandwidth
   end
   
   methods
   end
end