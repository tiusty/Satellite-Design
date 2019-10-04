classdef satelliteSystemA
   properties
        % Phsyical properties of the system
        R = 40000000; % The distance the satellite is from earth in meters
        Grant = 50; % The receive antenna directivity in dB
        Gtant = 50; % The transmit antenna directivity in dB
        f = 73*10^9; % The frequency of the transmit signal in hz
        bandwidth = 6*10^6; % The bandwidth of the transmit signal
        
       
        % Properties related to internal components
        Tant = 190; % Temp of antenna in Kelvin
        Glna = 35; % Gain of the LNA in dB.
        Tlna = 627.06; % Temp of LNA in Kelvin
        Gmixer = 0; % Gain of the mixer in dB
        Tmixer = 627.06; % Temp of the mixer in Kelvin
        Ghpa = 40; % Gain of high power amplifer in dB
        Thpa = 298.15; % Temp of hpa in kelvin
   end
   
   methods
       % Calculates the system temperature of the satellite
       % Output Arguments
       %    output - The output system temp in Kelvin
       function output = GetSystemTemp(obj)
           output = obj.Tant + obj.Tlna + obj.Tmixer/(10^(obj.Glna/10)) + obj.Thpa/(10^(obj.Glna/10) + 10^(obj.Gmixer));
       end
       
       % Based on the received power of the satellite, calculates the power transmitted based
       % on internal componenets
       % Input Arguments
       %    Pr - recieved power in dB
       % Output Arguments
       %    output - the power transmitted by the sattelite in Watts
       function output = GetPtFromPrWatts(obj, Pr)
           pt = Pr + obj.Glna + obj.Gmixer + obj.Ghpa;
           output = 10^(pt/10); % Convert the output to Watts
       end
   end
end