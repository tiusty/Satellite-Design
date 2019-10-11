classdef testSatellite
    %BASESATELLITE Used when computing the optimal parameters
    %   Defines the best and worst case for certain parameters
    
    properties
        % Phsyical properties of the system
        R = 40000000; % The distance the satellite is from earth in meters
        bandwidth = 6*10^6; % The bandwidth of the transmit signal
        
       
        % Properties related to internal components
        Grant = struct('min', 20, 'max', 50, 'weight', 3, 'curr', 20);
        Gtant = struct('min', 20, 'max', 50, 'weight', 3, 'curr', 20);
        systemGain = struct('min', 75, 'max', 150, 'weight', 2, 'curr', 75);
        systemTemp = struct('min', 600, 'max', 300, 'weight', 1, 'curr', 600);
        f = struct('min', 71*10^9, 'max', 76*10^9, 'weight', 1, 'curr', 71*10^9);
    end
end

