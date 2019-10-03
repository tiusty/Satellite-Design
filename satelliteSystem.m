classdef satelliteSystem
   properties
        % Phsyical properties of the system
        R = 40000000; % The distance the satellite is from earth in meters
        Grant = 20; % The receive antenna directivity in dB
        Gtant = 30; % The transmit antenna directivity in dB
        
       
        % Properties related to internal components
        Tant = 190; % Temp of antenna in Kelvin
        Tlna = 50; % Temp of LNA in Kelvin
        Glna = 30; % Gain of the LNA in dB
        Tmixer = 80; % Temp of the mixer in Kelvin
        Gmixer = 0; % Gain of the mixer in dB
   end
   
   methods
       function output = GetSystemTemp(obj)
           output = obj.Tant + obj.Tlna + obj.Tmixer/(10^(obj.Gmixer/10));
       end
   end
end